package com.i4.i4blog.config;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

import com.i4.i4blog.repository.interfaces.category.CategoryRepository;
import com.i4.i4blog.repository.interfaces.user.UserRepository;
import com.i4.i4blog.repository.model.category.Category;
import com.i4.i4blog.vo.user.ProfileInfoVo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class BlogInterceptor implements HandlerInterceptor {

	private final CategoryRepository categoryRepository;
	private final UserRepository userRepository;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// pathVariable 값 가져오기
		Map<?, ?> pathVariables = (Map<?, ?>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
		String userId = (String)pathVariables.get("userId");
		// 블로그 정보 조회
		ProfileInfoVo profileInfoVo = userRepository.findProfileByUserId(userId);
		modelAndView.addObject("blogProfile", profileInfoVo);
		// 카테고리 목록 조회
		List<Category> categoryList = categoryRepository.findByUserId(profileInfoVo.getId());
		modelAndView.addObject("categoryList", categoryList);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
}
