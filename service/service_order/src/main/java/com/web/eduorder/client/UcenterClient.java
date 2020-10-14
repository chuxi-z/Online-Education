package com.web.eduorder.client;


import com.web.commonutils.MemberInfoRemoteOrder;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@FeignClient("service-ucenter")
@Component
public interface UcenterClient {

    @PostMapping("/educenter/member/sendMemberInfoOrder/{id}")
    public MemberInfoRemoteOrder getMemberInfo(@PathVariable("id") String id);

}
