package com.i4.i4blog.handler;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
@Slf4j
public class ErrorHandler implements ErrorController {
    @GetMapping("/error")

    public String handleError(HttpServletRequest request) {

        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);


        if (status != null) {
            int statusCode = Integer.valueOf(status.toString());
            //404에러시 404에러 html페이지를 반환
            log.error("error code {}", statusCode);
            if (statusCode == HttpStatus.NOT_FOUND.value()) {

                return "error/404error";
            } else if (statusCode==HttpStatus.FORBIDDEN.value()) {
                return "redirect:/";

            } else {
            //그외에 에러는 아래와 같이 반환함
            return "error";
        }
    }

        return"error";
}
    }

