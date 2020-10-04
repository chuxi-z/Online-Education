package com.web.serviceedu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.web.servicebase.exceptionHandler.customizeException;
import com.web.serviceedu.entity.EduChapter;
import com.web.serviceedu.entity.EduVideo;
import com.web.serviceedu.entity.chapter.ChapterVo;
import com.web.serviceedu.entity.chapter.VideoVo;
import com.web.serviceedu.mapper.EduChapterMapper;
import com.web.serviceedu.service.EduChapterService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.web.serviceedu.service.EduVideoService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author ZD
 * @since 2020-09-29
 */
@Service
public class EduChapterServiceImpl extends ServiceImpl<EduChapterMapper, EduChapter> implements EduChapterService {

    @Autowired
    EduVideoService eduVideoService;


    @Override
    public List<ChapterVo> getChapterVoById(String id) {

        QueryWrapper<EduChapter> wrapperChap = new QueryWrapper<>();
        wrapperChap.eq("course_id", id);
        List<EduChapter> chapters = baseMapper.selectList(wrapperChap);

        QueryWrapper<EduVideo> wrapperVid = new QueryWrapper<>();
        wrapperVid.eq("course_id", id);
        List<EduVideo> videos = eduVideoService.list(wrapperVid);

        List<ChapterVo> list = new ArrayList<>();

        for(EduChapter chap : chapters){
            ChapterVo chapterVo = new ChapterVo();
            BeanUtils.copyProperties(chap, chapterVo);

            List<VideoVo> children = new ArrayList<>();
            for(EduVideo vid : videos){
                if(chap.getId().equals(vid.getChapterId())){ //vid.getCourseId().equals(id)
                    VideoVo videoVo = new VideoVo();
                    BeanUtils.copyProperties(vid, videoVo);
                    children.add(videoVo);
                }
            }
            chapterVo.setChildren(children);
            list.add(chapterVo);
        }

        return list;
    }

    @Override
    public boolean deleteChapterInfo(String chapterId) {
        QueryWrapper<EduVideo> wrapper = new QueryWrapper<>();
        wrapper.eq("chapter_id", chapterId);

        int count = eduVideoService.count(wrapper);
        if(count > 0){
            throw  new customizeException(20001, "videos exists, can delete this chapter!");
        }
        else{
            int delete = baseMapper.deleteById(chapterId);
            return delete>0;
        }
    }
}
