package com.i4.i4blog;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling

@SpringBootApplication
public class I4blogApplication {

    public static void main(String[] args) {
        SpringApplication.run(I4blogApplication.class, args);
    }

}
