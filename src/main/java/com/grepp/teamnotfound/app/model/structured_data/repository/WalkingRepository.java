package com.grepp.teamnotfound.app.model.structured_data.repository;

import com.grepp.teamnotfound.app.model.pet.entity.Pet;
import com.grepp.teamnotfound.app.model.structured_data.entity.Feeding;
import com.grepp.teamnotfound.app.model.structured_data.entity.Walking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;


public interface WalkingRepository extends JpaRepository<Walking, Long> {

    @Modifying(clearAutomatically=true, flushAutomatically=true)
    @Query("UPDATE Walking w SET w.deletedAt = CURRENT_TIMESTAMP WHERE w.lifeRecord.lifeRecordId = :lifeRecordId AND w.deletedAt IS NULL")
    void delete(@Param("lifeRecordId") Long lifeRecordId);

    @Query("SELECT w FROM Walking w JOIN FETCH w.lifeRecord lr WHERE lr.pet = :pet AND lr.deletedAt IS NULL AND lr.recordedAt BETWEEN :start AND :end ")
    List<Walking> findWalkingsByPetAndDateRange(Pet pet, LocalDate start, LocalDate end);
}
