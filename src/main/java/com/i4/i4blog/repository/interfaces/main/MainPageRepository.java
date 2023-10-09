package com.i4.i4blog.repository.interfaces.main;

import com.i4.i4blog.repository.model.main.MainDTO;
import com.i4.i4blog.util.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainPageRepository {

    List<MainDTO>mainPageDefault (Criteria cri);
    Integer listCount();

}
