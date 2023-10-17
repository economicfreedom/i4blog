package com.i4.i4blog.service.category;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.i4.i4blog.dto.category.CategorySaveDto;
import com.i4.i4blog.repository.interfaces.board.BoardRepository;
import com.i4.i4blog.repository.interfaces.category.CategoryRepository;
import com.i4.i4blog.repository.interfaces.user.UserRepository;
import com.i4.i4blog.repository.model.category.Category;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class CategoryService {

	private final CategoryRepository categoryRepository;
	private final BoardRepository boardRepository;
	private final UserRepository userRepository;
	
	public List<Category> findByUserId(Integer id) {
		List<Category> categoryEntity = categoryRepository.findByUserId(id);
		return categoryEntity;
	}

	@Transactional
	public void listUpdate(List<CategorySaveDto> categoryListSaveDto, String userId) {
		for(CategorySaveDto category : categoryListSaveDto) {
			log.info("category - {}", category);
			if(category.getState().equals("R")) {
				log.info("state - R");
				// 읽기 (변경사항 없음)
				
			} else if(category.getState().equals("C")) {
				// 추가
				log.info("state - C");
				category.setUserId(userRepository.getIdByUserId(userId));
				categoryRepository.insert(category);
				log.info("state - C - success");
			} else if(category.getState().equals("U")) {
				// 수정
				log.info("state - U");
				categoryRepository.update(category);
				log.info("state - U - success");
			} else if(category.getState().equals("D")) {
				// 삭제 + 게시글의 카테고리 0으로 변경
				log.info("state - D");
				category.setUserId(userRepository.getIdByUserId(userId));
				categoryRepository.delete(category);
				boardRepository.deleteCategory(category);
				log.info("state - D - success");
			} else {
				log.info("state : ??");
			}
		}
	}

}
