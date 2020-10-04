package com.web.serviceedu.controller;


import com.web.commonutils.RParadigm;
import com.web.serviceedu.entity.EduVideo;
import com.web.serviceedu.service.EduVideoService;
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

    @DeleteMapping("deleteVideo/{Vid}")
    public RParadigm deleteVideo(@PathVariable String Vid){
        boolean remove = eduVideoService.removeById(Vid);
        return RParadigm.ok();
    }

    @PostMapping("/updateVideo")
    public RParadigm updateVideo(@RequestBody EduVideo eduVideo){
        eduVideoService.updateById(eduVideo);
        return RParadigm.ok();
    }
}

