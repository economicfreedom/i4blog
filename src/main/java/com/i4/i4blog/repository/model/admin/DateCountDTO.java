package com.i4.i4blog.repository.model.admin;

import lombok.*;
import lombok.extern.slf4j.Slf4j;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
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
