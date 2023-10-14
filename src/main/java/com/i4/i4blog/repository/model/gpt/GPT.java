package com.i4.i4blog.repository.model.gpt;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class GPT {
    private Integer userId;
    private String request;
    private String response;

}
