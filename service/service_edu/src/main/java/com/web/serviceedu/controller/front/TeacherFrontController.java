package com.web.serviceedu.controller.front;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.web.commonutils.RParadigm;
import com.web.serviceedu.entity.EduCourse;
import com.web.serviceedu.entity.EduTeacher;
import com.web.serviceedu.service.EduCourseService;
import com.web.serviceedu.service.EduTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/eduservice/teacherfront")
@CrossOrigin
public class TeacherFrontController {

    @Autowired
    private EduTeacherService eduTeacherService;

    @Autowired
    private EduCourseService eduCourseService;

    @PostMapping("/conditionPage/{page}/{limit}")
    public RParadigm conditionPage(@PathVariable Long page, @PathVariable Long limit){

        Page<EduTeacher> teacherPage = new Page<>(page, limit);
        Map<String, Object> map = eduTeacherService.pageTeacherFront(teacherPage);

        return RParadigm.ok().data(map);
    }


    @GetMapping("/getTeacherFrontInfo/{teacherId}")
    public RParadigm getTeacherFrontInfo(@PathVariable String teacherId){
        EduTeacher eduTeacher = eduTeacherService.getById(teacherId);

        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        wrapper.eq("teacher_id", teacherId);
        List<EduCourse> courseList = eduCourseService.list(wrapper);

        return RParadigm.ok().data("eduTeacher", eduTeacher).data("courseList", courseList);
    }
}
