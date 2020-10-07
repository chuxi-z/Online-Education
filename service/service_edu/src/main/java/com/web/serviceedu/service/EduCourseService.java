package com.web.serviceedu.service;

import com.web.serviceedu.entity.EduCourse;
import com.baomidou.mybatisplus.extension.service.IService;
import com.web.serviceedu.entity.vo.CourseInfoVo;
import com.web.serviceedu.entity.vo.CoursePublishVo;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author ZD
 * @since 2020-09-29
 */
public interface EduCourseService extends IService<EduCourse> {

    String saveCourseInfo(CourseInfoVo courseInfoVo);

    CourseInfoVo getCourseInfo(String id);

    void updateByInfo(CourseInfoVo courseInfoVo);

    CoursePublishVo getPublishInfo(String id);

    void removeCourse(String id);
}
