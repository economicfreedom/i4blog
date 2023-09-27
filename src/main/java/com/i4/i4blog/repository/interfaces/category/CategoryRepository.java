package com.i4.i4blog.repository.interfaces.category;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.i4.i4blog.repository.model.category.Category;


@Mapper
public interface CategoryRepository {
	public List<Category> findByUserId(int userId);
}
