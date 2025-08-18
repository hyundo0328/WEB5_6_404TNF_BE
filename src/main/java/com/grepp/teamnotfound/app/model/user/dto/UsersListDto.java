package com.grepp.teamnotfound.app.model.user.dto;

import com.grepp.teamnotfound.app.model.user.code.UserStateResponse;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.OffsetDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UsersListDto {

    private Long userId;
    private String email;
    private String nickname;
    private Long postCount;
    private Long commentCount;
    private OffsetDateTime lastLoginDate;
    private OffsetDateTime joinDate;
    private UserStateResponse status;
    private OffsetDateTime suspensionEndAt;

}
