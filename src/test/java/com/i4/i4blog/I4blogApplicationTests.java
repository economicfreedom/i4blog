package com.i4.i4blog;

import com.i4.i4blog.dto.user.UserJoinFormDto;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class I4blogApplicationTests {

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
}
