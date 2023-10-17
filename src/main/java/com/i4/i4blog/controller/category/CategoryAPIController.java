package com.i4.i4blog.controller.category;

import java.security.Principal;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.i4.i4blog.dto.category.CategorySaveDto;
import com.i4.i4blog.service.category.CategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/category")
@RequiredArgsConstructor
@Slf4j
public class CategoryAPIController {
	
	private final CategoryService categoryService;
	
	@PutMapping("/list-save")
	public ResponseEntity<?> categoryListSave (@RequestBody List<CategorySaveDto> categoryListSaveDto
												, Principal principal) {
		log.info("/list-save");
		log.info("categoryListDto - {}", categoryListSaveDto);
		
		categoryService.listUpdate(categoryListSaveDto, principal.getName());
		
		return ResponseEntity.ok().build();
	}
}
