package com.i4.i4blog.config;

import com.i4.i4blog.config.search.SearchSessionClearInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private BlogInterceptor blogInterceptor;
	@Autowired
    private SearchSessionClearInterceptor searchSessionClearInterceptor;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(blogInterceptor)
                .addPathPatterns("/blog/{userId}/**")
                .excludePathPatterns("/admin/**", "/user/**"
                        , "/js/**", "/css/**", "/img/**");
        // 최규하 - 세션 삭제 인터셉터 추가
        registry.addInterceptor(searchSessionClearInterceptor)
                .addPathPatterns("/**");

    }

}
