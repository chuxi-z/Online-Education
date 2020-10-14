package com.web.eduorder.client;


import com.web.commonutils.CourseFrontInfoVoOrder;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Component
@FeignClient("service-edu")
public interface EduClient {

    @PostMapping("/eduservice/courseFront/getCourseInfoOrder/{id}")
    public CourseFrontInfoVoOrder getCourseInfoOrder(@PathVariable("id") String id);
}
