package com.web.oss.controller;

import com.web.commonutils.RParadigm;
import com.web.oss.service.OssService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/eduoss/fileoss")
@CrossOrigin
public class OssController {

    @Autowired
    OssService ossService;

    @PostMapping
    public RParadigm uploadOssFile(MultipartFile file){
        String url = ossService.uploadFileAvatar(file);

        return RParadigm.ok().data("url", url);
    }

}
