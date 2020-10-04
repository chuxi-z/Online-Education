package com.web.serviceedu.service.impl;

import com.web.servicebase.exceptionHandler.customizeException;
import com.web.serviceedu.entity.EduCourse;
import com.web.serviceedu.entity.EduCourseDescription;
import com.web.serviceedu.entity.vo.CourseInfoVo;
import com.web.serviceedu.entity.vo.CoursePublishVo;
import com.web.serviceedu.mapper.EduCourseMapper;
import com.web.serviceedu.service.EduCourseDescriptionService;
import com.web.serviceedu.service.EduCourseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author ZD
 * @since 2020-09-29
 */
@Service
public class EduCourseServiceImpl extends ServiceImpl<EduCourseMapper, EduCourse> implements EduCourseService {

    @Autowired
    EduCourseDescriptionService eduCourseDescriptionService;

    @Override
    public String saveCourseInfo(CourseInfoVo courseInfoVo) {
        EduCourse eduCourse = new EduCourse();
        BeanUtils.copyProperties(courseInfoVo, eduCourse);
        int insert = baseMapper.insert(eduCourse);
        if(insert <= 0){
            throw new customizeException(20001, "add course failed...");
        }

        EduCourseDescription description = new EduCourseDescription();
        description.setDescription(courseInfoVo.getDescription());
        description.setId(eduCourse.getId());

        eduCourseDescriptionService.save(description);

        return description.getId();
    }

    @Override
    public CourseInfoVo getCourseInfo(String id) {
        EduCourse eduCourse = baseMapper.selectById(id);
        EduCourseDescription courseDescription = eduCourseDescriptionService.getById(id);
        CourseInfoVo courseInfoVo = new CourseInfoVo();

        BeanUtils.copyProperties(eduCourse, courseInfoVo);
        courseInfoVo.setDescription(courseDescription.getDescription());
//        courseInfoVo.setId();

        return courseInfoVo;
    }

    @Override
    public void updateByInfo(CourseInfoVo courseInfoVo) {
        EduCourse eduCourse = new EduCourse();
        BeanUtils.copyProperties(courseInfoVo, eduCourse);
        int update = baseMapper.updateById(eduCourse);

        if(update == 0){
            throw new customizeException(20001, "update courseInfo failed...");
        }

        EduCourseDescription description = new EduCourseDescription();
        BeanUtils.copyProperties(courseInfoVo, description);
        eduCourseDescriptionService.updateById(description);
    }

    @Override
    public CoursePublishVo getPublishInfo(String id) {
        CoursePublishVo publishVo = baseMapper.getAllInfo(id);
        return publishVo;
    }
}
