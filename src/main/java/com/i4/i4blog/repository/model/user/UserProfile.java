package com.i4.i4blog.repository.model.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@Setter
@ToString
public class UserProfile {
    private Integer id;
    private Integer userId;
    private String profileTitle;
    private String profileContent;
    private String imgOriginal;
    private String imgThumbnail;

}
