package com.i4.i4blog;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class I4blogApplicationTests {

	@Test
	void contextLoads() {
	}



	@Test
	void test111(){
		TestDTO testDTO = new TestDTO();
		testDTO.setTest("test1");
		testDTO.setTest2("test2");
		System.out.println(testDTO.getTest());
		System.out.println(testDTO.getTest2());
	}
}
