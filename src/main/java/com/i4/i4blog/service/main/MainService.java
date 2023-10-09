package com.i4.i4blog.service.main;

import com.i4.i4blog.repository.interfaces.main.MainPageRepository;
import com.i4.i4blog.repository.model.main.MainDTO;
import com.i4.i4blog.util.Criteria;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class MainService {

    private final MainPageRepository mainPageRepository;

    public List<MainDTO> defaultMainPage(Criteria cri){
        return mainPageRepository.mainPageDefault(cri);
    }

    public Integer getListCount() {
        return mainPageRepository.listCount();
    }

}
