package com.i4.i4blog.dto.user;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
@Getter
@Setter
public class ProfileRequestDTO {
    private Integer id;
    @Pattern(regexp = "^[ㄱ-ㅣ가-힣a-zA-Z0-9]{2,12}$"
            , message = "최소 2글자에서 최대 12글자"
            + " 한글과 영어만 입력 가능합니다.")
    @NotBlank(message = "닉네임을 입력해주세요.")
    private String nickname;
    private String originalImg;
    private String thumbNail;


}
