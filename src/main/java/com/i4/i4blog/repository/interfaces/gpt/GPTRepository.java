package com.i4.i4blog.repository.interfaces.gpt;

import com.i4.i4blog.repository.model.gpt.GPT;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GPTRepository {
    Integer save(GPT gpt);

}
