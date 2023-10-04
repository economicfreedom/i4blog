package com.i4.i4blog.vo.img;

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ThumbnailURLVO {
    private String originalImgURL;
    private String thumbnailImgURL;

}
