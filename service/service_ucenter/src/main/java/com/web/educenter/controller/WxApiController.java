package com.web.educenter.controller;


import com.google.gson.Gson;
import com.web.commonutils.JwtUtils;
import com.web.educenter.ConstantWxUtils;
import com.web.educenter.entity.UcenterMember;
import com.web.educenter.service.UcenterMemberService;
import com.web.educenter.utils.HttpClientUtils;
import com.web.servicebase.exceptionHandler.customizeException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;

@CrossOrigin
@Controller//注意这里没有配置 @RestController
@RequestMapping("/api/ucenter/wx")
public class WxApiController {

    @Autowired
    private UcenterMemberService ucenterMemberService;

    @GetMapping("/callback")
    public String callback(String code, String state){
        try {
            String baseAccessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token" +
                    "?appid=%s" +
                    "&secret=%s" +
                    "&code=%s" +
                    "&grant_type=authorization_code";

            String accessTokenUrl = String.format(baseAccessTokenUrl,
                    ConstantWxUtils.WX_OPEN_APP_ID,
                    ConstantWxUtils.WX_OPEN_APP_SECRET,
                    code);
            String accessTokenInfo = HttpClientUtils.get(accessTokenUrl);
//            System.out.println(accessTokenInfo);

            Gson gson = new Gson();
            HashMap map = gson.fromJson(accessTokenInfo, HashMap.class);
            String accessToken = (String)map.get("access_token");
            String openid = (String)map.get("openid");

            UcenterMember ucenterMember = ucenterMemberService.countByOpenId(openid);
            if(ucenterMember == null){
                //通过token openidqi请求微信固定地址 获取扫描人信息
                //访问微信的资源服务器，获取用户信息
                String baseUserInfoUrl = "https://api.weixin.qq.com/sns/userinfo" +
                        "?access_token=%s" +
                        "&openid=%s";
                String userInfoUrl = String.format(
                        baseUserInfoUrl,
                        accessToken,
                        openid
                );

                String userInfo = HttpClientUtils.get(userInfoUrl);

//            System.out.println(userInfo);
                HashMap userInfoMap = gson.fromJson(userInfo, HashMap.class);
                String nickname = (String) userInfoMap.get("nickname");
                String headimgurl = (String) userInfoMap.get("headimgurl");


                ucenterMember = new UcenterMember();
                ucenterMember.setOpenid(openid);
                ucenterMember.setNickname(nickname);
                ucenterMember.setAvatar(headimgurl);
                ucenterMemberService.save(ucenterMember);
            }

            //通过在路径上加入token 在前端实现用户信息显示登录
            String jwtToken = JwtUtils.getJwtToken(ucenterMember.getId(), ucenterMember.getNickname());

            return "redirect:http://localhost:3000?token=" + jwtToken;
        }
        catch (Exception e){
            throw new customizeException(20001, "Fail to login...");
        }

    }

    @GetMapping("/login")
    public String genQrConnect(){
        String Url = "https://open.weixin.qq.com/connect/qrconnect" +
                "?appid=%s" +
                "&redirect_uri=%s" +
                "&response_type=code" +
                "&scope=snsapi_login" +
                "&state=%s" +
                "#wechat_redirect";

        String state = "edu-online";

        // 回调地址
        String redirectUrl = ConstantWxUtils.WX_OPEN_REDIRECT_URL; //获取业务服务器重定向地址
        try {
            redirectUrl = URLEncoder.encode(redirectUrl, "UTF-8"); //url编码
        } catch (UnsupportedEncodingException e) {
            throw new customizeException(20001, e.getMessage());
        }

        String resultUrl = String.format(
                Url,
                ConstantWxUtils.WX_OPEN_APP_ID,
                redirectUrl,
                state);

        return "redirect:" + resultUrl;
    }
}
