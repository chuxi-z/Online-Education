package com.web.commonutils;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

@Data
public class RParadigm {
    private Boolean success;
    private Integer code;
    private String message;
    private Map<String, Object> data = new HashMap<String, Object>();

    private RParadigm(){}

    public static RParadigm ok(){
        RParadigm r = new RParadigm();
        r.setCode(ResultCode.SUCCESS);
        r.setSuccess(true);
        r.setMessage("Success!!!");
        return r;
    }

    public static RParadigm error(){
        RParadigm r = new RParadigm();
        r.setCode(ResultCode.ERROR);
        r.setSuccess(false);
        r.setMessage("Error!!!");
        return r;
    }


    public RParadigm success(Boolean success){
        this.setSuccess(success);
        return this;
    }

    public RParadigm message(String message){
        this.setMessage(message);
        return this;
    }

    public RParadigm code(Integer code){
        this.setCode(code);
        return this;
    }

    public RParadigm data(String key, Object value){
        this.data.put(key, value);
        return this;
    }

    public RParadigm data(Map<String, Object> map){
        this.setData(map);
        return this;
    }
}
