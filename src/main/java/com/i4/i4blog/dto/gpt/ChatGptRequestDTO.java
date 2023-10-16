package com.i4.i4blog.dto.gpt;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;

import java.util.ArrayList;
import java.util.List;
@Data

public class ChatGptRequestDTO {
    @Value("${openai.model}")
    private String model;
    private List<Message> messages;

    public ChatGptRequestDTO(String model, String prompt) {
        this.model = model;
        this.messages = new ArrayList<>();
        this.messages.add(new Message("user",prompt));
    }
}
