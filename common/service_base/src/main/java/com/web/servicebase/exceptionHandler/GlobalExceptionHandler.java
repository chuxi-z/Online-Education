package com.web.servicebase.exceptionHandler;

import com.web.commonutils.RParadigm;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler
    @ResponseBody
    public RParadigm error(Exception e){
        e.printStackTrace();
        return RParadigm.error().message("Start global exception handler...");
    }

}
