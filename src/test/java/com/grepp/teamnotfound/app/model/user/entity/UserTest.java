package com.grepp.teamnotfound.app.model.user.entity;

import com.grepp.teamnotfound.app.model.user.code.SuspensionPeriod;
import com.grepp.teamnotfound.app.model.user.code.UserStatus;
import com.grepp.teamnotfound.infra.error.exception.BusinessException;
import com.grepp.teamnotfound.infra.error.exception.code.ReportErrorCode;
import com.grepp.teamnotfound.infra.error.exception.code.UserErrorCode;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.time.OffsetDateTime;
import java.time.temporal.ChronoUnit;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;

class UserTest {

    private User user1;
    private User user2;
    private User suspendedUser;
    private User suspendEndUser;
    private User suspendEndUser2;

    @BeforeEach
    void setUp() {
        user1 = User.builder()
                .userId(1L)
                .email("user1@email.com")
                .status(UserStatus.ACTIVE)
                .build();
        user2 = User.builder()
                .userId(2L)
                .email("user2@email.com")
                .status(UserStatus.ACTIVE)
                .build();

        suspendedUser = User.builder()
                .suspensionEndAt(OffsetDateTime.now().plusDays(3))
                .status(UserStatus.SUSPENDED)
                .build();

        suspendEndUser = User.builder()
                .suspensionEndAt(OffsetDateTime.now().minusDays(3))
                .status(UserStatus.SUSPENDED)
                .build();

        suspendEndUser2 = User.builder()
                .suspensionEndAt(OffsetDateTime.now().minusDays(3))
                .status(UserStatus.ACTIVE)
                .build();
        }

    // validateNotSelf
    @Test
    @DisplayName("신고자 검증 - 자기 자신 실패")
    void validateNotSelf_fail() {
        // when
        BusinessException exception = assertThrows(BusinessException.class, () -> {
           user1.validateNotSelf(user1);
        });

        // then
        assertThat(exception.getErrorCode())
                .isEqualTo(ReportErrorCode.CANNOT_REPORT_SELF);
    }

    @Test
    @DisplayName("신고자 검증 - 성공")
    void validateSelf_success() {
        // when then
        assertDoesNotThrow(() -> user1.validateNotSelf(user2));
    }


    // updateSuspensionEndAtNow
    @Test
    @DisplayName("회원 활성화 실패 - 정지 회원이 아님")
    void updateSuspensionEndAtNow_fail_not_suspended(){

        // when
        BusinessException exception = assertThrows(BusinessException.class, () -> {
            user1.updateSuspensionEndAtNow();
        });

        // then
        assertThat(exception.getErrorCode())
                .isEqualTo(UserErrorCode.USER_NOT_SUSPENDED);
    }

    @Test
    @DisplayName("회원 활성화 실패 - 과거 정지 회원")
    void updateSuspensionEndAtNow_fail_suspended_end(){

        // when
        BusinessException exception = assertThrows(BusinessException.class, () -> {
            suspendEndUser.updateSuspensionEndAtNow();
        });

        // then
        assertThat(exception.getErrorCode())
        .isEqualTo(UserErrorCode.USER_NOT_SUSPENDED);
    }

    @Test
    @DisplayName("회원 활성화 성공")
    void updateSuspensionEndAtNow_success(){
        // when then
        assertDoesNotThrow(() -> suspendedUser.updateSuspensionEndAtNow());
        assertThat(suspendedUser.getSuspensionEndAt())
                .isCloseTo(OffsetDateTime.now(),
                        within(1, ChronoUnit.SECONDS));
    }


    // refreshStatus
    @Test
    @DisplayName("status 변경 성공")
    void refreshStatus_success(){
        // when
        suspendEndUser.refreshStatus();

        // then
        assertThat(suspendEndUser.getStatus())
                .isEqualTo(UserStatus.ACTIVE);
    }

    @Test
    @DisplayName("status 변경 X")
    void refreshStatus_suspended(){
        // when
        suspendedUser.refreshStatus();

        // then
        assertThat(suspendedUser.getStatus())
                .isEqualTo(UserStatus.SUSPENDED);
    }

    @Test
    @DisplayName("status 변경 X")
    void refreshStatus_active(){
        // when
        user1.refreshStatus();

        // then
        assertThat(user1.getStatus())
                .isEqualTo(UserStatus.ACTIVE);
    }


    // suspend
    @Test
    @DisplayName("suspend permanent")
    void suspend_permanent(){
        // when
        user1.suspend(SuspensionPeriod.PERMANENT);

        // then
        assertThat(user1.getSuspensionEndAt())
                .isCloseTo(OffsetDateTime.now().plusYears(7777),
                        within(1, ChronoUnit.SECONDS));
        assertThat(user1.getStatus())
                .isEqualTo(UserStatus.SUSPENDED);
    }

    @Test
    @DisplayName("suspend active user")
    void suspend_activeUser(){

        // when
        user2.suspend(SuspensionPeriod.ONE_DAY);

        // then
        assertThat(user2.getSuspensionEndAt())
                .isCloseTo(OffsetDateTime.now().plusDays(SuspensionPeriod.ONE_DAY.getDays()),
                within(1, ChronoUnit.SECONDS));
        assertThat(user2.getStatus())
                .isEqualTo(UserStatus.SUSPENDED);

    }

    @Test
    @DisplayName("suspend suspendEndUser")
    void suspend_suspendEndUser(){

        // when
        suspendEndUser2.suspend(SuspensionPeriod.FIVE_DAYS);

        // then
        assertThat(suspendEndUser2.getSuspensionEndAt())
                .isCloseTo(OffsetDateTime.now().plusDays(SuspensionPeriod.FIVE_DAYS.getDays()),
                        within(1, ChronoUnit.SECONDS));
        assertThat(suspendEndUser2.getStatus())
                .isEqualTo(UserStatus.SUSPENDED);

    }

    @Test
    @DisplayName("suspend suspended user")
    void suspend_suspendedUser(){

        // when
        suspendedUser.suspend(SuspensionPeriod.FIVE_DAYS);

        // then
        assertThat(suspendedUser.getSuspensionEndAt())
                .isCloseTo(OffsetDateTime.now().plusDays(3)
                                .plusDays(SuspensionPeriod.FIVE_DAYS.getDays())
                , within(1, ChronoUnit.SECONDS));
        assertThat(suspendedUser.getStatus())
                .isEqualTo(UserStatus.SUSPENDED);

    }

}