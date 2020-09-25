package com.web.oss.service.impl;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSBuilder;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSClientBuilder;
import com.web.oss.service.OssService;
import com.web.oss.utils.ConstantPropertiesUtil;
import org.joda.time.DateTime;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.UUID;

@Service
public class OssServiceImpl implements OssService {
    @Override
    public String uploadFileAvatar(MultipartFile file) {
        String endpoint = ConstantPropertiesUtil.END_POINT;
        String accessKeyId = ConstantPropertiesUtil.ACCESS_KEY_ID;
        String accessKeySecret = ConstantPropertiesUtil.ACCESS_KEY_SECRET;
        String bucketName = ConstantPropertiesUtil.BUCKET_NAME;

        String url = null;

        try{
            OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
//            ossClient.putObject(bucketName, file.getOriginalFilename(), new ByteArrayInputStream(file.getBytes()));

            String fileName = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 5) + file.getOriginalFilename();
            String path = new DateTime().toString("yyyy/MM/dd");
            fileName = path + "/" + fileName;

            InputStream inputStream = file.getInputStream();
            ossClient.putObject(bucketName, fileName, inputStream);
            ossClient.shutdown();
            url =  "https://" + bucketName + "." + endpoint + "/" + fileName;
        }catch (IOException e) {
            e.printStackTrace();
        }
        return url;
    }
}
