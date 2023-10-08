package com.i4.i4blog.dto.user;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class PwChangeRequestDTO {

    @NotBlank
    @Size(min = 4, max = 16, message = "비밀번호는 4글자에서 16글자 사이여야 합니다.")
    private String newPw;

    @NotBlank
    @Size(min = 4, max = 16, message = "비밀번호는 4글자에서 16글자 사이여야 합니다.")
    private String newPw2;
    private String originalPw;
    public boolean isSamePw() {
        if (newPw.equals(newPw2)) {
            return true;
        }
        return false;
    }
}
