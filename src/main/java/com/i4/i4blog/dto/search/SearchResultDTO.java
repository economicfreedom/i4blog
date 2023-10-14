package com.i4.i4blog.dto.search;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class SearchResultDTO {
    private Integer id;
    private String imgPath;
    private String title;
    private String info;
    private String createdAt;
    private String userId;

}
