package com.web.serviceedu.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.web.serviceedu.entity.EduTeacher;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ZD
 * @since 2020-09-15
 */
public interface EduTeacherService extends IService<EduTeacher> {

    List<EduTeacher> findPopularTeacher();

    Map<String, Object> pageTeacherFront(Page<EduTeacher> teacherPage);
}
