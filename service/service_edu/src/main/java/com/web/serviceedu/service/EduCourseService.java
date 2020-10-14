package com.web.serviceedu.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.web.serviceedu.entity.EduCourse;
import com.baomidou.mybatisplus.extension.service.IService;
import com.web.serviceedu.entity.frontVo.CourseFrontInfoVo;
import com.web.serviceedu.entity.frontVo.courseFrontVo;
import com.web.serviceedu.entity.vo.CourseInfoVo;
import com.web.serviceedu.entity.vo.CoursePublishVo;

import java.util.List;
import java.util.Map;

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

    List<EduCourse> findPopularCourse();

    //课程前台
    Map<String, Object> getCourseFrontPage(Page<EduCourse> coursePage, courseFrontVo courseQuery);

    CourseFrontInfoVo getBaseCourseInfo(String courseId);
}
