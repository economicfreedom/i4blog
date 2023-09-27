package com.i4.i4blog.repository.model.board;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Board {
	private Integer id;
	private Integer userId;
	private String boardTitle;
	private String boardContent;
	private String boardCategory;
	private Timestamp boardCreated;
	private Timestamp boardUpdate;
	private Integer boardCount;
	private Integer boardPublic;
	private Integer boardState;
}
