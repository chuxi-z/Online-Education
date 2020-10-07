package com.web.serviceedu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.web.serviceedu.client.VodClient;
import com.web.serviceedu.entity.EduChapter;
import com.web.serviceedu.entity.EduVideo;
import com.web.serviceedu.mapper.EduVideoMapper;
import com.web.serviceedu.service.EduVideoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 课程视频 服务实现类
 * </p>
 *
 * @author ZD
 * @since 2020-09-29
 */
@Service
public class EduVideoServiceImpl extends ServiceImpl<EduVideoMapper, EduVideo> implements EduVideoService {

    @Autowired
    VodClient vodClient;

    @Override
    public void removeVideoByCourseId(String courseId) {
        //删除小节对应文件
        QueryWrapper<EduVideo> wrapperVideo = new QueryWrapper<>();
        wrapperVideo.eq("course_id", courseId);
        wrapperVideo.select("video_source_id");
        List<EduVideo> eduVideos = baseMapper.selectList(wrapperVideo);

        List<String> videoIds = new ArrayList<>();
        for (EduVideo eduVideo : eduVideos){
            if(!StringUtils.isEmpty(eduVideo.getVideoSourceId())){
                videoIds.add(eduVideo.getVideoSourceId());
            }
        }
        if(videoIds.size() > 0){
            vodClient.deleteBatchCloudVideo(videoIds);
        }

        //删除小节
        QueryWrapper<EduVideo> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id", courseId);

        baseMapper.delete(wrapper);
    }
}
