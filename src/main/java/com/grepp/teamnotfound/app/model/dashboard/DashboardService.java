package com.grepp.teamnotfound.app.model.dashboard;

import com.grepp.teamnotfound.app.model.dashboard.dto.DaySleeping;
import com.grepp.teamnotfound.app.model.dashboard.dto.DayWalking;
import com.grepp.teamnotfound.app.model.dashboard.dto.DayWeight;
import com.grepp.teamnotfound.app.model.dashboard.dto.FeedingDashboardDto;
import com.grepp.teamnotfound.app.model.dashboard.dto.SleepingDashboardDto;
import com.grepp.teamnotfound.app.model.dashboard.dto.WalkingDashboardDto;
import com.grepp.teamnotfound.app.model.dashboard.dto.WeightDashboardDto;
import com.grepp.teamnotfound.app.model.liferecord.LifeRecordService;
import com.grepp.teamnotfound.app.model.liferecord.entity.LifeRecord;
import com.grepp.teamnotfound.app.model.pet.PetService;
import com.grepp.teamnotfound.app.model.pet.dto.PetDto;
import com.grepp.teamnotfound.app.model.pet.entity.Pet;
import com.grepp.teamnotfound.app.model.recommend.DailyRecommendService;
import com.grepp.teamnotfound.app.model.schedule.dto.ScheduleDto;
import com.grepp.teamnotfound.app.model.schedule.entity.Schedule;
import com.grepp.teamnotfound.app.model.schedule.repository.ScheduleRepository;
import com.grepp.teamnotfound.app.model.structured_data.FeedingService;
import com.grepp.teamnotfound.app.model.structured_data.WalkingService;
import com.grepp.teamnotfound.app.model.structured_data.code.FeedUnit;
import com.grepp.teamnotfound.app.model.structured_data.entity.Feeding;
import com.grepp.teamnotfound.app.model.structured_data.entity.Walking;
import com.grepp.teamnotfound.infra.error.exception.UserException;
import com.grepp.teamnotfound.infra.error.exception.code.UserErrorCode;
import java.time.Duration;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class DashboardService {

    private final PetService petService;
    private final WalkingService walkingService;
    private final FeedingService feedingService;
    private final LifeRecordService lifeRecordService;
    private final ScheduleRepository scheduleRepository;
    private final ModelMapper modelMapper;

    @Transactional(readOnly = true)
    public PetDto getProfile(Long petId, Long userId) {
        Pet pet = validatePetOwnership(petId, userId);

        PetDto dto = modelMapper.map(pet, PetDto.class);
        dto.setImgUrl(petService.getProfileImgPath(petId));
        return dto;
    }

    @Transactional(readOnly = true)
    public FeedingDashboardDto getFeeding(Long petId, Long userId, LocalDate date) {
        Pet pet = validatePetOwnership(petId, userId);

        // 기록일별 식사량 리스트 가져오기
        Map<LocalDate, List<Feeding>> feedingList = feedingService.getFeedingList(pet, date.minusDays(8), date);
        if (feedingList.isEmpty()) return FeedingDashboardDto.builder().average(0.0).build();
        Map<LocalDate, Double> dailyFeeding = calculateDailyFeeding(feedingList);

        // 오늘 날짜 제외
        List<Double> feedingExcludingDate = dailyFeeding.entrySet().stream()
                .filter(entry -> !entry.getKey().equals(date))
                .map(Map.Entry::getValue)
                .toList();

        double total = feedingExcludingDate.stream()
                .mapToDouble(Double::doubleValue)
                .sum();

        FeedUnit unit = feedingList.values().stream()
                .flatMap(List::stream)
                .map(Feeding::getUnit)
                .findFirst()
                .orElse(null);


        return FeedingDashboardDto.builder()
                .amount(dailyFeeding.get(date))
                .average(total / feedingExcludingDate.size())
                .unit(unit)
                .date(date)
                .build();
    }

    @Transactional(readOnly = true)
    public WalkingDashboardDto getWalking(Long petId, Long userId, LocalDate date) {
        Pet pet = validatePetOwnership(petId, userId);

        // 기록일 별로 정리
        Map<LocalDate, List<Walking>> walkingListMap = walkingService.getWalkingList(pet, date.minusDays(10), date);

        WalkingDashboardDto dto = new WalkingDashboardDto(new ArrayList<>());
        if (walkingListMap.isEmpty()) return dto;

        // 날짜별 계산
        for (Map.Entry<LocalDate, List<Walking>> entry : walkingListMap.entrySet()) {
            LocalDate recordDate = entry.getKey();
            List<Walking> walkings = entry.getValue();

            long totalMinutes = 0;
            int totalPace = 0;

            for (Walking walking : walkings) {
                long minutes = Duration.between(walking.getStartTime(), walking.getEndTime()).toMinutes();
                totalMinutes += minutes;
                totalPace += walking.getPace();
            }

            int averagePace = walkings.isEmpty() ? 0 : totalPace / walkings.size();

            DayWalking dayWalking = DayWalking.builder()
                    .date(recordDate)
                    .time(totalMinutes)
                    .pace(averagePace).build();

            dto.getWalkingList().add(dayWalking);
        }
        return dto;
    }

    @Transactional(readOnly = true)
    public WeightDashboardDto getWeight(Long petId, Long userId, LocalDate date) {
        Pet pet = validatePetOwnership(petId, userId);

        List<LifeRecord> lifeRecords = lifeRecordService.getWeightLifeRecordList(pet, date);
        if (lifeRecords.isEmpty()) return new WeightDashboardDto(new ArrayList<>());

        WeightDashboardDto dtos = new WeightDashboardDto(new ArrayList<>());

        for (LifeRecord lifeRecord : lifeRecords){
            dtos.getWeightList().add(DayWeight.builder()
                    .weight(lifeRecord.getWeight())
                    .date(lifeRecord.getRecordedAt()).build());
        }

        return dtos;
    }

    @Transactional(readOnly = true)
    public SleepingDashboardDto getSleeping(Long petId, Long userId, LocalDate date) {
        Pet pet = validatePetOwnership(petId, userId);

        List<LifeRecord> lifeRecords = lifeRecordService.getSleepingLifeRecordList(pet, date);
        if (lifeRecords.isEmpty()) return new SleepingDashboardDto(new ArrayList<>());

        SleepingDashboardDto dtos = new SleepingDashboardDto(new ArrayList<>());

        for(LifeRecord sleeping: lifeRecords){
            dtos.getSleepingList().add(DaySleeping.builder()
                            .sleep(sleeping.getSleepingTime())
                            .date(sleeping.getRecordedAt()).build());
        }

        return dtos;
    }

    @Transactional(readOnly = true)
    public String getNote(Long petId, Long userId, LocalDate date) {
        validatePetOwnership(petId, userId);

        Optional<Long> lifeRecordId = lifeRecordService.findLifeRecordId(petId, date);
        if (lifeRecordId.isEmpty()) return "";

        return lifeRecordService.getLifeRecord(lifeRecordId.get()).getContent();
    }

    public Map<LocalDate, Double> calculateDailyFeeding(Map<LocalDate, List<Feeding>> feedingList) {
        Map<LocalDate, Double> feedingMap = new HashMap<>();

        for (Map.Entry<LocalDate, List<Feeding>> entry : feedingList.entrySet()) {
            LocalDate date = entry.getKey();
            List<Feeding> feedings = entry.getValue();

            if (feedings == null || feedings.isEmpty()) {
                continue;
            }

            double amount = feedings.stream()
                    .mapToDouble(Feeding::getAmount)
                    .sum();

            feedingMap.put(date, amount);
        }

        return feedingMap;
    }

    @Transactional(readOnly = true)
    public List<ScheduleDto> getChecklist(Long petId, Long userId, LocalDate date) {
        validatePetOwnership(petId, userId);

        List<Schedule> schedules = scheduleRepository.findChecklist(petId, date);

        return schedules.stream()
            .map(schedule -> ScheduleDto.builder()
                .scheduleId(schedule.getScheduleId())
                .date(schedule.getScheduleDate())
                .petId(schedule.getPet().getPetId())
                .petName(schedule.getPet().getName())
                .name(schedule.getName())
                .isDone(schedule.getIsDone())
                .cycle(schedule.getCycle())
                .cycleEnd(schedule.getCycleEnd())
                .build()
            )
            .toList();
    }

    public List<String> getWeekNotes(Long petId, LocalDate date) {
        Pet pet = petService.getPet(petId);

        return lifeRecordService.getWeekNotes(pet, date);
    }

    private Pet validatePetOwnership(Long petId, Long userId) {
        Pet pet = petService.getPet(petId);
        if (!pet.getUser().getUserId().equals(userId)) {
            throw new UserException(UserErrorCode.USER_ACCESS_DENIED);
        }
        return pet;
    }
}
