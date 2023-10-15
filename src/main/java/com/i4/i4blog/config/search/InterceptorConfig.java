package com.i4.i4blog.config.search;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

@Configuration
public class InterceptorConfig {
    @Bean
    public SearchSessionClearInterceptor searchSessionClearInterceptor() {
        return new SearchSessionClearInterceptor();
    }

}
