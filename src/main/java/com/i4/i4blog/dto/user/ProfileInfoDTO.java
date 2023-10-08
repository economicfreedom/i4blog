package com.i4.i4blog.dto.user;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ProfileInfoDTO {



    private String info;
    @NotBlank
    @Size(min = 1,max = 30,message = "최소 1 글자에서 최대 30글자 입니다.")
    private String title;


}
