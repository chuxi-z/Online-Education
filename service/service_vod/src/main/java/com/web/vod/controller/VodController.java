package com.web.vod.controller;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.vod.model.v20170321.DeleteVideoRequest;
import com.web.commonutils.RParadigm;
import com.web.servicebase.exceptionHandler.customizeException;
import com.web.vod.Utils.ConstantVodUtil;
import com.web.vod.Utils.InitVodObject;
import com.web.vod.service.VodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/eduvod/video")
public class VodController {

    @Autowired
    VodService vodService;

    @PostMapping("/uploadCloudVideo")
    public RParadigm uploadVideo(MultipartFile file){
        String videoId = vodService.uploadVideo(file);

        return RParadigm.ok().data("videoId", videoId);
    }

    @DeleteMapping("/deleteVideo/{videoId}")
    public RParadigm deleteVideo(@PathVariable String videoId){
        DefaultAcsClient client = InitVodObject.initVodClient(ConstantVodUtil.ACCESS_KEY_ID, ConstantVodUtil.ACCESS_KEY_SECRET);

        DeleteVideoRequest request = new DeleteVideoRequest();
        request.setVideoIds(videoId);

        try {
            client.getAcsResponse(request);
            return RParadigm.ok();
        } catch (ClientException e) {
            e.printStackTrace();
            return RParadigm.error();
//            throw new customizeException(20001, "delete video fails...");
        }
    }

    @DeleteMapping("/deleteBatch")
    public RParadigm deleteBatchCloudVideo(@RequestParam("videoList") List<String> videoList){
        vodService.removeBatchCloudVideo(videoList);
        return RParadigm.ok();
    }
}
