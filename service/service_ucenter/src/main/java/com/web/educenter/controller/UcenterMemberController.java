package com.web.educenter.controller;


import com.web.commonutils.JwtUtils;
import com.web.commonutils.MemberInfoRemoteOrder;
import com.web.commonutils.RParadigm;
import com.web.educenter.entity.UcenterMember;
import com.web.educenter.entity.vo.RegisterVo;
import com.web.educenter.service.UcenterMemberService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 会员表 前端控制器
 * </p>
 *
 * @author ZD
 * @since 2020-10-09
 */
@RestController
@RequestMapping("/educenter/member")
@CrossOrigin
public class UcenterMemberController {

    @Autowired
    UcenterMemberService ucenterMemberService;

    @PostMapping("/login")
    public RParadigm login(@RequestBody UcenterMember ucenterMember){
        String token = ucenterMemberService.login(ucenterMember);
        return RParadigm.ok().data("token", token);
    }

    //注册
    @PostMapping("/register")
    public RParadigm register(@RequestBody RegisterVo registerVo){
        ucenterMemberService.register(registerVo);
        return RParadigm.ok();
    }

    @GetMapping("/getMemberInfo")
    public RParadigm getMemberInfo(HttpServletRequest request){
        String memberId = JwtUtils.getMemberIdByJwtToken(request);
        UcenterMember member = ucenterMemberService.getById(memberId);
        return RParadigm.ok().data("member", member);
    }

    //远程向order发送用户信息
    @PostMapping("/sendMemberInfoOrder/{id}")
    public MemberInfoRemoteOrder getMemberInfo(@PathVariable String id){
        UcenterMember member = ucenterMemberService.getById(id);
        MemberInfoRemoteOrder remoteOrder = new MemberInfoRemoteOrder();
        BeanUtils.copyProperties(member, remoteOrder);
        return remoteOrder;
    }

}

