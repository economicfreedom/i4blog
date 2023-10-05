package com.i4.i4blog.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Component
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Autowired
	private BlogInterceptor blogInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(blogInterceptor)
			.addPathPatterns("/blog/{userId}/**")
			.excludePathPatterns("/admin/**", "/user/**"
					, "/js/**", "/css/**", "/img/**");
	}
}
