package com.i4.i4blog.repository.model.board;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private Integer id;
	private Integer userId;
	private String boardTitle;
	private String boardContent;
	private String boardCategory;
	private Timestamp boardCreatedAt;
	private Timestamp boardUpdatedAt;
	private Timestamp boardDeletedAt;
	private Integer boardCount;
	private Integer boardPublic;
	private Integer boardState;
	private String boardThumbnail;
}
