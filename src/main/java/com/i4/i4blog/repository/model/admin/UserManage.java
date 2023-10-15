package com.i4.i4blog.repository.model.admin;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserManage {
    private Integer id;
    private String userId;
    private String userEmail;
    private String userNickname;
    private Integer boardCount;
    private Integer commentCount;
    private String userCreatedAt;


}
