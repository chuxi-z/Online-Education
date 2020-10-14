package com.web.serviceedu.controller.front;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sun.xml.internal.messaging.saaj.packaging.mime.util.QEncoderStream;
import com.web.commonutils.RParadigm;
import com.web.serviceedu.entity.EduCourse;
import com.web.serviceedu.entity.EduTeacher;
import com.web.serviceedu.service.EduCourseService;
import com.web.serviceedu.service.EduTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/eduservice/indexfront")
@CrossOrigin
public class IndexFrontController {

    @Autowired
    EduCourseService eduCourseService;

    @Autowired
    EduTeacherService eduTeacherService;

    //查询前八门课程 前四门讲师
    @GetMapping("/index")
    public RParadigm index(){
//        QueryWrapper<EduCourse> wrapperCourse = new QueryWrapper<>();
//        wrapperCourse.orderByDesc("id");
//        wrapperCourse.last("limit 8");
//
//        List<EduCourse> courseList = eduCourseService.list(wrapperCourse);

        List<EduCourse> courseList = eduCourseService.findPopularCourse();



//        QueryWrapper<EduTeacher> wrapperTeacher = new QueryWrapper<>();
//        wrapperTeacher.orderByDesc("id");
//        wrapperTeacher.last("limit 4");
//        List<EduTeacher> teacherList = eduTeacherService.list(wrapperTeacher);

        List<EduTeacher> teacherList = eduTeacherService.findPopularTeacher();

        return RParadigm.ok().data("courseList", courseList).data("teacherList", teacherList);
    }
}
