package com.i4.i4blog;

import com.i4.i4blog.dto.user.UserJoinFormDto;
import com.i4.i4blog.repository.model.admin.DateCountDTO;
import com.i4.i4blog.service.admin.AdminService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j

class I4blogApplicationTests {

	private final AdminService adminService;

	@Autowired
	public I4blogApplicationTests(AdminService adminService) {
		this.adminService = adminService;
	}

	@Test
	void contextLoads() {
	}




	@Test
	void logTest(){
		UserJoinFormDto userJoinFormDto = new UserJoinFormDto();
		userJoinFormDto.setUserNickname("asdf");
		userJoinFormDto.setUserEmail("asdfsadfa");

		System.out.println("유저 폼 :"+userJoinFormDto);

		log.info("유저 폼 로그 : {}",userJoinFormDto);
	}

	// 최규하
	@Test
	void 가입한유저및작성된글과댓글(){

		DateCountDTO dateCountDTO = adminService.getDateCountDTO();
		Assertions.assertNotNull(dateCountDTO.getTJoinedUser());


	}
}
