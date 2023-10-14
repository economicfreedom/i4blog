package com.i4.i4blog.controller.gpt;

import com.i4.i4blog.dto.gpt.ChatGptRequestDTO;
import com.i4.i4blog.dto.gpt.ChatGptResponseDTO;
import com.i4.i4blog.dto.gpt.GPTRequestDTO;
import com.i4.i4blog.service.gpt.GPTService;
import com.i4.i4blog.service.user.UserService;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@Slf4j

public class GPTAPIController {
    @Autowired
    private UserService userService;
    @Autowired
    private GPTService gptService;


    @Autowired
    private RestTemplate template;

    private static final String PROMPT_1 = "Hi I am currently writing a blog\n" +
            "I need help\n" +
            "What I'm wondering is\n" +
            "'";
    private static final String PROMPT_2 = "' and\n" +
            "You need to add more content to my article to make it more complete.\n" +
            "I am using Summernote as my writing editor.\n" +
            "\n" +
            "You must follow these guidelines\n" +
            "1. the answers you give should be verified\n"+
            "2.you must be aware that I am writing a blog.\n"+
            "3. your answers must be in Korean, without using English for unnecessary parts.\n";

    @Value("${openai.model}")
    private String model;
    @Value("${openai.api.url}")
    private String apiURL;


    @PostMapping("/gpt")
    public ResponseEntity<?> chat(@RequestBody GPTRequestDTO gptRequestDTO) {
        log.info("gptRequest {}",gptRequestDTO);

        CustomResponse customResponse = new CustomResponse();

        byte count = userService.getGptCountByUserId(gptRequestDTO.getUserId());
        log.info("count {}",count);
        boolean validCount = gptService.isValidCount(count);

        if (!validCount){
            customResponse.setResponse("사용횟수를 확인해주세요.");
            return ResponseEntity.badRequest().body(customResponse);
        }


        String userRequest = gptRequestDTO.getRequest();
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(PROMPT_1);
        stringBuffer.append(userRequest);
        stringBuffer.append(PROMPT_2);

        ChatGptRequestDTO request = new ChatGptRequestDTO(model, stringBuffer.toString());
        ChatGptResponseDTO chatGptResponse = template.postForObject(apiURL, request, ChatGptResponseDTO.class);
        String response = chatGptResponse.getChoices().get(0).getMessage().getContent();

        Integer save = gptService.save(gptRequestDTO, response);

        customResponse.setResponse(response);
        return ResponseEntity.ok(customResponse);
    }
    @Data
    private class CustomResponse{
        private String response ;
    }
}
