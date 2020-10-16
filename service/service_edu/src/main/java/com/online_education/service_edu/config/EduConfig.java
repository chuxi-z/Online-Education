package com.online_education.service_edu.config;

import com.baomidou.mybatisplus.core.injector.ISqlInjector;
import com.baomidou.mybatisplus.extension.injector.LogicSqlInjector;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.online_education.service_edu.mapper")

public class EduConfig {
    // Logic Delete
    @Bean
    public ISqlInjector sqlInjector() {
        return new LogicSqlInjector();
    }


    // Page
    @Bean
    public PaginationInterceptor paginationInterceptor() {
            return new PaginationInterceptor();
            }

}