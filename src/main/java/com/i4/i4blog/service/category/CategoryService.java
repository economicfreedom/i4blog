package com.i4.i4blog.service.category;

import java.util.List;

import org.springframework.stereotype.Service;

import com.i4.i4blog.repository.interfaces.category.CategoryRepository;
import com.i4.i4blog.repository.model.category.Category;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CategoryService {

	private final CategoryRepository categoryRepository;
	
	public List<Category> findByUserId(Integer userId) {
		List<Category> categoryEntity = categoryRepository.findByUserId(userId);
		return categoryEntity;
	}

}
