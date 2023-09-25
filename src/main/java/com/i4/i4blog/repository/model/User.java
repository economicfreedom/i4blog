package com.i4.i4blog.repository.model;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class User {
	private int id;
	private String userId;
	private String userPassword;
	private String userName;
	private String userNickname;
	private String userPhone;
	private String userEmail;
	private Timestamp userReddate;
	private int userState;
	private int userRole;
}
