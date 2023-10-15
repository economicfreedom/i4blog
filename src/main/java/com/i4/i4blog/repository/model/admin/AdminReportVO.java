package com.i4.i4blog.repository.model.admin;


import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminReportVO {

    private  Integer id;
    private  Integer userId;
    private  Integer boardId;
    private  Integer commentId;
    private  String commentContent;
    private  String reportContent;
    private  String boardTitle;
    private  String reportType;
    private  String reportDate;
    private  String state;
    private  Integer count;
    private String strUserId;
}
