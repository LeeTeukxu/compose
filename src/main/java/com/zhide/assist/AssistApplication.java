package com.zhide.assist;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.stereotype.Component;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@EnableCaching
@SpringBootApplication()
@MapperScan(basePackages = "com.zhide.assist.mapper")
@EnableJpaAuditing
public class AssistApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(AssistApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(AssistApplication.class);
    }

}
