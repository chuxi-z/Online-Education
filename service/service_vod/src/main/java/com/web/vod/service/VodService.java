package com.web.vod.service;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@CrossOrigin
@Service
public interface VodService {
    String uploadVideo(MultipartFile file);

    void removeBatchCloudVideo(List<String> videoList);

}
