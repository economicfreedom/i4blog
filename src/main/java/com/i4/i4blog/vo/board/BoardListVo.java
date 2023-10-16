package com.i4.i4blog.vo.board;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardListVo {
	private final Integer id;
	private final Integer userId;
	private final String strUserId;
	private final String boardTitle;
	private final String boardCategory;
	private final String boardCreatedAt;
	private final String userNickname;
	private final String boardPublic;
	private final String boardThumbnail;
	private final String boardImgOriginal;
	private final Integer likeCount;
}
