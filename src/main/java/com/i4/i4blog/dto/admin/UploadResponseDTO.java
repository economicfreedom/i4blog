package com.i4.i4blog.dto.admin;

import lombok.*;

import java.util.List;

@Getter
@Setter
@Builder
@ToString
@AllArgsConstructor
public class UploadResponseDTO {
    private List<UploadResultDTO>uploadResultDTOList;
    private String originalURL;
    private String thumbnailURL;
}
