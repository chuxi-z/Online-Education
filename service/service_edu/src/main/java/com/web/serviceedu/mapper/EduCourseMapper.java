package com.web.serviceedu.mapper;

import com.web.serviceedu.entity.EduCourse;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.web.serviceedu.entity.vo.CoursePublishVo;

/**
 * <p>
 * 课程 Mapper 接口
 * </p>
 *
 * @author ZD
 * @since 2020-09-29
 */
public interface EduCourseMapper extends BaseMapper<EduCourse> {
    CoursePublishVo getAllInfo(String id);
}
