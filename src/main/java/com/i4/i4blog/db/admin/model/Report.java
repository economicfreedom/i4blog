package com.i4.i4blog.db.admin.model;


import lombok.*;

@Getter
@Setter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Report {
    private Integer id;
    private Integer userId;
    private Integer boardId;
    private String report_type;
    private String boardTitle;
    private Integer reportCount;
}
