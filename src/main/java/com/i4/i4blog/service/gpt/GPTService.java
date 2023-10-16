package com.i4.i4blog.service.gpt;

import com.i4.i4blog.dto.gpt.GPTRequestDTO;
import com.i4.i4blog.repository.interfaces.gpt.GPTRepository;
import com.i4.i4blog.repository.interfaces.user.UserRepository;
import com.i4.i4blog.repository.model.gpt.GPT;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class GPTService {
    private final UserRepository userRepository;
    private final GPTRepository gptRepository;

    public Integer save(GPTRequestDTO gptRequestDTO, String response) {
        Integer id = userRepository.getIdByUserId(gptRequestDTO.getUserId());
        userRepository.decrementUsageCountByUserId(gptRequestDTO.getUserId());
        GPT gpt = GPT.builder()
                .userId(id)
                .request(gptRequestDTO.getRequest())
                .response(response)
                .build();


        return gptRepository.save(gpt);

    }

    public boolean isValidCount(byte count) {
        if (count <= 0) {
            log.info("여기로옴");
            return false;
        }
        return true;

    }

    @Scheduled(cron = "0 8 0 * * ?")
    public void resetGptCountAllUser() {
        log.info("count reset start");
        userRepository.resetGptCountAllUser();
        log.info("count reset done");
    }

}
