package com.web.servicebase.exceptionHandler;

import com.web.commonutils.RParadigm;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
//@Slf4j
public class GlobalExceptionHandler {

    //全局异常处理
    @ExceptionHandler
    @ResponseBody
    public RParadigm error(Exception e){
        e.printStackTrace();
        return RParadigm.error().message("Start global exception handler...");
    }

    //特定异常处理
    @ExceptionHandler
    @ResponseBody
    public RParadigm error(ArithmeticException e){
        e.printStackTrace();
        return RParadigm.error().message("Start ArithmeticException handler...");
    }

    @ExceptionHandler(customizeException.class)
    @ResponseBody
    public RParadigm error(customizeException e){
//        log.error(e.getMessage());
        e.printStackTrace();
        return RParadigm.error().code(e.getCode()).message(e.getMsg());
    }

}
