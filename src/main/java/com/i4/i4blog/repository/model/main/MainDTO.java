package com.i4.i4blog.repository.model.main;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class MainDTO {
    private String userNickname;
    private String userId;
    private Integer uId;
    private Integer boardId;
    private String boardTitle;
    private String boardContent;
    private String boardThumbnail;
    private Integer likeCount;
    private Integer likeUserId;
    private String imgThumbnail;
    private Integer commentCount;
    private String boardCreatedAt;

}
