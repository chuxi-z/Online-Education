package com.web.vod.service.impl;

import com.aliyun.vod.upload.impl.UploadVideoImpl;
import com.aliyun.vod.upload.req.UploadStreamRequest;
import com.aliyun.vod.upload.resp.UploadStreamResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.vod.model.v20170321.DeleteVideoRequest;
import com.web.commonutils.RParadigm;
import com.web.servicebase.exceptionHandler.customizeException;
import com.web.vod.Utils.ConstantVodUtil;
import com.web.vod.Utils.InitVodObject;
import com.web.vod.service.VodService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@CrossOrigin
@Service
public class VodServiceImpl implements VodService {
    @Override
    public String uploadVideo(MultipartFile file) {
        String fileName = file.getOriginalFilename();
        String title = fileName.substring(0, fileName.lastIndexOf("."));

        InputStream inputStream = null;
        try {
            inputStream = file.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }

        UploadStreamRequest request = new UploadStreamRequest(ConstantVodUtil.ACCESS_KEY_ID, ConstantVodUtil.ACCESS_KEY_SECRET, title, fileName, inputStream);

        UploadVideoImpl uploader = new UploadVideoImpl();
        UploadStreamResponse response = uploader.uploadStream(request);
//        System.out.print("RequestId=" + response.getRequestId() + "\n");  //请求视频点播服务的请求ID

        String videoId = null;
        if (response.isSuccess()) {
            videoId = response.getVideoId();
//            System.out.print("VideoId=" + response.getVideoId() + "\n");
        } else { //如果设置回调URL无效，不影响视频上传，可以返回VideoId同时会返回错误码。其他情况上传失败时，VideoId为空，此时需要根据返回错误码分析具体错误原因
//            System.out.print("VideoId=" + response.getVideoId() + "\n");
//            System.out.print("ErrorCode=" + response.getCode() + "\n");
//            System.out.print("ErrorMessage=" + response.getMessage() + "\n");
            videoId = response.getVideoId();
        }
        videoId = response.getVideoId();
        return videoId;
    }

    @Override
    public void removeBatchCloudVideo(List<String> videoList) {

        DefaultAcsClient client = InitVodObject.initVodClient(ConstantVodUtil.ACCESS_KEY_ID, ConstantVodUtil.ACCESS_KEY_SECRET);

        DeleteVideoRequest request = new DeleteVideoRequest();
        String videoIds = StringUtils.join(videoList.toArray(), ",");
        request.setVideoIds(videoIds);

        try {
            client.getAcsResponse(request);
        } catch (ClientException e) {
            e.printStackTrace();
            throw new customizeException(20001, "delete video fails...");
        }
    }
}
