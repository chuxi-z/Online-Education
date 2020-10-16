package com.online_education.servicebase.exceptionHandler;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class OnlineEducationException extends RuntimeException{
    private Integer code;

    private String msg;

    @Override
    public String toString() {
        return "GuliException{" + "message=" + this.getMessage() + ", code=" + code + '}';
    }

}


