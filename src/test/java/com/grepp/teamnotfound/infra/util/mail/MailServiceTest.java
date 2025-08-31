package com.grepp.teamnotfound.infra.util.mail;

import com.grepp.teamnotfound.infra.error.exception.AuthException;
import com.grepp.teamnotfound.infra.error.exception.code.AuthErrorCode;
import com.grepp.teamnotfound.infra.error.exception.code.UserErrorCode;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSendException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import java.time.Duration;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.hamcrest.Matchers.startsWith;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class MailServiceTest {

    @InjectMocks
    private MailService mailService;

    @Mock
    private JavaMailSender mailSender;

    @Mock
    private StringRedisTemplate stringRedisTemplate;

    @Mock
    private ValueOperations<String, String> valueOperations;

    @BeforeEach
    void setUp() {
        given(stringRedisTemplate.opsForValue()).willReturn(valueOperations);
    }


    @Test
    void sendEmail_success() {
        // given
        doNothing().when(mailSender).send(any(SimpleMailMessage.class));

        // when
        mailService.sendVerificationEmail("test@test.com");

        // then
        verify(valueOperations).set(
                eq("email: verifying test@test.com"),
                anyString(),
                any(Duration.class)
        );
        verify(mailSender).send(any(SimpleMailMessage.class));
    }

    @Test
    void sendEmail_fail() {
        // given
        doThrow(new MailSendException("smtp error"))
                .when(mailSender).send(any(SimpleMailMessage.class));

        // when
        mailService.sendVerificationEmail("test@test.com");

        // then
        String code = stringRedisTemplate.opsForValue().get("email: verifying test@test.com");
        assertThat(code).isNull();
    }

    @Test
    void verifyEmailCode_success() {
        // given
        String email = "test@test.com";
        String code = "123456";
        String redisKey = "email: verifying " + email;

        given(valueOperations.get(redisKey)).willReturn(code);

        // when
        mailService.verifyEmailCode(email, code);

        // then
        verify(valueOperations).get(redisKey);
        verify(stringRedisTemplate).delete(redisKey);
    }

    @Test
    void verifyEmailCode_fail() {
        // given
        String email = "test@test.com";
        String code = "123456";
        String redisKey = "email: verifying " + email;

        String inputCode = "321654";

        given(valueOperations.get(redisKey)).willReturn(code);

        // when
        AuthException exception = assertThrows(AuthException.class, () -> {
            mailService.verifyEmailCode(email, inputCode);
        });


        // then
        assertThat(exception.getErrorCode())
                .isEqualTo(UserErrorCode.EMAIL_VERIFICATION_FAILED);
    }

    @Test
    void verifyEmailCode_nullFail() {
        // given
        String email = "test@test.com";
        String code = null;
        String redisKey = "email: verifying " + email;

        String inputCode = "321654";

        given(valueOperations.get(redisKey)).willReturn(code);

        // when
        AuthException exception = assertThrows(AuthException.class, () -> {
            mailService.verifyEmailCode(email, inputCode);
        });


        // then
        assertThat(exception.getErrorCode())
                .isEqualTo(UserErrorCode.EMAIL_VERIFICATION_FAILED);
    }
}