package com.i4.i4blog.controller.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.Response;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
@Slf4j
public class UserAPIController {

    @GetMapping("/nick-check")
    public ResponseEntity<?> nickCheck(
            @RequestParam String nickname
    ){

        log.info("nick-check test {}",nickname);
        return null;
    }
}
