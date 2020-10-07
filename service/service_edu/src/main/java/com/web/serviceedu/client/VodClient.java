package com.web.serviceedu.client;

import com.web.commonutils.RParadigm;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(name = "service-vod", fallback = VodClientFallbackImpl.class)
@Component
public interface VodClient {

    @DeleteMapping("/eduvod/video/deleteVideo/{videoId}")
    public RParadigm deleteVideo(@PathVariable("videoId") String videoId);

    @DeleteMapping("/eduvod/video/deleteBatch")
    public RParadigm deleteBatchCloudVideo(@RequestParam("videoList") List<String > videoList);

}
