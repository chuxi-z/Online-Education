package com.web.serviceedu.client;

import com.web.commonutils.RParadigm;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class VodClientFallbackImpl implements VodClient {
    //生产者服务挂掉之后执行掉操作

    @Override
    public RParadigm deleteVideo(String videoId) {
        return RParadigm.error();
    }

    @Override
    public RParadigm deleteBatchCloudVideo(List<String> videoList) {
        return RParadigm.error();
    }
}
