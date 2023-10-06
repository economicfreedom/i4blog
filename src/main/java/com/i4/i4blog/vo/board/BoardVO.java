package com.i4.i4blog.vo.board;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	private Integer id;
	private Integer userId;
	private String boardTitle;
	private String boardContent;
	private String boardCategory;
	private Timestamp boardCreated;
	private Integer boardCount;
	private String userNickname;
}
