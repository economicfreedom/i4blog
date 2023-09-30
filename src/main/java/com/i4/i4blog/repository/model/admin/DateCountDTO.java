package com.i4.i4blog.repository.model.admin;

import lombok.*;
import lombok.extern.slf4j.Slf4j;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
//어제 오늘 가입,글작성,댓글작성 데이터를 담는 DTO
public class DateCountDTO {

    /**
     * t = today
     * y = yesterday
     */
    private String tJoinedUser;
    private String yJoinedUser;
    private String tCreatedBoard;
    private String yCreatedBoard;
    private String tCreatedComment;
    private String yCreatedComment;



}
