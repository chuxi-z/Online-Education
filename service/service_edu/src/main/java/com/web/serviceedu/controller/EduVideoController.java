package com.web.serviceedu.controller;


import com.alibaba.excel.util.StringUtils;
import com.web.commonutils.RParadigm;
import com.web.servicebase.exceptionHandler.customizeException;
import com.web.serviceedu.client.VodClient;
import com.web.serviceedu.entity.EduVideo;
import com.web.serviceedu.service.EduVideoService;
import org.apache.poi.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 课程视频 前端控制器
 * </p>
 *
 * @author ZD
 * @since 2020-09-29
 */
@RestController
@RequestMapping("/eduservice/video")
@CrossOrigin
public class EduVideoController {

    @Autowired
    EduVideoService eduVideoService;

    @Autowired
    VodClient vodClient;

    @GetMapping("/getVideo/{videoId}")
    public RParadigm getVideo(@PathVariable String videoId){
        EduVideo video = eduVideoService.getById(videoId);
        return RParadigm.ok().data("video", video);
    }

    @PostMapping("/addVideo")
    public RParadigm addVideo(@RequestBody EduVideo eduVideo){
        eduVideoService.save(eduVideo);
        return RParadigm.ok();
    }


    //springCloud 删除云端视频
    @DeleteMapping("/deleteVideo/{Vid}")
    public RParadigm deleteVideo(@PathVariable String Vid){
        //先删视频
        EduVideo video = eduVideoService.getById(Vid);
        String sourceId = video.getVideoSourceId();
        if(!StringUtils.isEmpty(sourceId)){
            RParadigm deleteVideo = vodClient.deleteVideo(sourceId);
            if (deleteVideo.getCode() == 20001){
                throw new customizeException(20001, "fail to delete cloud videoes, feign.hystrix...");
            }
        }

        //删除小节
        boolean remove = eduVideoService.removeById(Vid);
        return RParadigm.ok();
    }

    @PostMapping("/updateVideo")
    public RParadigm updateVideo(@RequestBody EduVideo eduVideo){
        eduVideoService.updateById(eduVideo);
        return RParadigm.ok();
    }
}

