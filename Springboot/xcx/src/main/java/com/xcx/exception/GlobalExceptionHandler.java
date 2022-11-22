package com.xcx.exception;

import com.xcx.entity.R;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 全局异常处理
 * */
@ControllerAdvice
@RestController
public class GlobalExceptionHandler {
    @ExceptionHandler(value = Exception.class)
    public R exceptionHandler(HttpServletRequest request,Exception e){
        return R.error("服务端异常请联系Z"+"<br/>"+e.getMessage());
    }
}
