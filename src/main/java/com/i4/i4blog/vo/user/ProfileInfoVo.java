package com.i4.i4blog.vo.user;

import lombok.Data;

@Data
public class ProfileInfoVo {
	private Integer id;
	private String userId;
	private String userNickname;
	private String userRole;
	private String profileTitle;
	private String profileContent;
}
