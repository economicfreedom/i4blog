package com.i4.i4blog.vo.board;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@RequiredArgsConstructor
@ToString
public class BoardVO {
	private final Integer id;
	private final Integer uId;
	private final String userId;
	private final String boardTitle;
	private final String boardContent;
	private final String boardCategory;
	private final String boardCreatedAt;
	private final Integer boardCount;
	private final String userNickname;
	private final String boardThumbnail;
	private final String boardImgOriginal;
	private final Integer likeCount;
}
