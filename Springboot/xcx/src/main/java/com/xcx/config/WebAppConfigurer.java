package com.xcx.config;

import com.xcx.interceptor.SysInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


/*
 * web 项目配置类
 * */
@Configuration
public class WebAppConfigurer implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("*")
                .allowCredentials(true)
                .allowedMethods("GET","HEAD","POST","PUT","DELETE","OPTIONS")
                .maxAge(3600);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/image/swiper/**").addResourceLocations("file:D:\\项目\\购物小程序\\图片\\swiperImgs\\");
        registry.addResourceHandler("/image/bigType/**").addResourceLocations("file:D:\\项目\\购物小程序\\图片\\bigTypeImgs\\");
        registry.addResourceHandler("/image/product/**").addResourceLocations("file:D:\\项目\\购物小程序\\图片\\productImgs\\");
        registry.addResourceHandler("/image/productSwiperImgs/**").addResourceLocations("file:D:\\项目\\购物小程序\\图片\\productSwiperImgs\\");
        registry.addResourceHandler("/image/productIntroImgs/**").addResourceLocations("file:D:\\项目\\购物小程序\\图片\\productIntroImgs\\");
        registry.addResourceHandler("/image/productParaImgs/**").addResourceLocations("file:D:\\项目\\购物小程序\\图片\\productParaImgs\\");
    }

    @Bean
    public SysInterceptor sysInterceptor() {
        return new SysInterceptor();
    }

    /**
     * 自定义的鉴权拦截实现，以后可以用spring security
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        String[] patterns = new String[]{"/adminLogin", "/product/**", "/bigType/**", "/user/wxlogin", "/weixinpay/**"};
        registry.addInterceptor(sysInterceptor()).addPathPatterns("/**").excludePathPatterns(patterns);
    }
}
