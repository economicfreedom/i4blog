package com.i4.i4blog.repository.interfaces.category;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.i4.i4blog.dto.category.CategorySaveDto;
import com.i4.i4blog.repository.model.category.Category;


@Mapper
public interface CategoryRepository {
	public List<Category> findByUserId(Integer id);

	public void insert(CategorySaveDto category);

	public void update(CategorySaveDto category);

	public void delete(CategorySaveDto category);
}
