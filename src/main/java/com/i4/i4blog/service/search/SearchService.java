package com.i4.i4blog.service.search;

import com.i4.i4blog.dto.search.SearchResultDTO;
import com.i4.i4blog.repository.interfaces.search.SearchRepository;
import com.i4.i4blog.util.Criteria;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Slf4j
@Service
public class SearchService {

    private final SearchRepository searchRepository;

    public List<SearchResultDTO> boardSearchList(Criteria cri, String userId) {
        return searchRepository.boardPagingList(cri,userId);
    }

    public Integer getSearchTotal(Criteria cri,String userId) {
        return searchRepository.getBoardSearchTotal(cri, userId);
    }
    public List<SearchResultDTO> userSearchPageList(Criteria cri,String userId){
        return searchRepository.userSearchPageList(cri, userId);
    }
    public Integer getUserSearchTotal(Criteria cri,String userId){
        return searchRepository.getUserSearchTotal(cri, userId);
    }
}
