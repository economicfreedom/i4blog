package com.i4.i4blog.repository.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Board {
	private Integer id;
	private Integer userId;
	private String boardTitle;
	private String boardContent;
	private String boardCategory;
	private Timestamp boardCreated;
	private Timestamp boardUpdate;
	private int boardCount;
	private int boardPublic;
	private int boardState;
}
