package com.web.serviceedu.controller;

import com.web.commonutils.RParadigm;
import org.springframework.web.bind.annotation.*;

//vue.config.js--port
@RestController
@RequestMapping("/eduservice/user")
@CrossOrigin //解决跨域问题--端口号，网络协议，ip地址必须全都一致
public class EduLoginController {

    //login
    @PostMapping("/login")
    public RParadigm login(){
        return RParadigm.ok().data("token", "admin");
    }


    //info
    @GetMapping("/info")
    public RParadigm info(){
        return RParadigm.ok().data("roles", "[admin]").data("name", "admin").data("avatar", "https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif");
    }
}
