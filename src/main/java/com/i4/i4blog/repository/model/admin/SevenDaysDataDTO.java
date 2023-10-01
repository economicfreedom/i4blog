package com.i4.i4blog.repository.model.admin;

import lombok.*;
import org.springframework.scheduling.annotation.Scheduled;

import java.util.List;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SevenDaysDataDTO {
    private List<Integer> userCounts;
    private List<Integer> boardCounts;
    private List<Integer> commentCounts;
    private List<Integer> reportCounts;
    private List<String> userCreatedDates;
    private List<String> boardCreatedDates;
    private List<String> commentCreatedDates;
    private List<String> reportCreatedDates;
}
