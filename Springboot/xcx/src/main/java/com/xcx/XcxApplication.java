package com.xcx;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.xcx.mapper")
public class XcxApplication {

    public static void main(String[] args) {
        SpringApplication.run(XcxApplication.class, args);
    }

}
