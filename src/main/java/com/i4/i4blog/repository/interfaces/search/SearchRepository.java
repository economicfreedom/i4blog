package com.i4.i4blog.repository.interfaces.search;

import com.i4.i4blog.dto.search.SearchResultDTO;
import com.i4.i4blog.util.Criteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SearchRepository {


    public List<SearchResultDTO> boardPagingList(

            @Param("cri") Criteria cri, @Param("userId") String userId
    );

    public Integer getBoardSearchTotal(

            @Param("cri") Criteria cri, @Param("userId") String userId

    );

    public List<SearchResultDTO> userSearchPageList(

            @Param("cri") Criteria cri, @Param("userId") String userId

    );

    public Integer getUserSearchTotal(

            @Param("cri") Criteria cri, @Param("userId") String userId

    );
}
