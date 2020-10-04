package com.web.serviceedu.controller;


import com.web.commonutils.RParadigm;
import com.web.serviceedu.entity.EduCourse;
import com.web.serviceedu.entity.vo.CourseInfoVo;
import com.web.serviceedu.entity.vo.CoursePublishVo;
import com.web.serviceedu.service.EduCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author ZD
 * @since 2020-09-29
 */
@RestController
@RequestMapping("/eduservice/course")
@CrossOrigin
public class EduCourseController {

    @Autowired
    EduCourseService eduCourseService;

    @PostMapping("/addCourseInfo")
    public RParadigm addCourseInfo(@RequestBody CourseInfoVo courseInfoVo){

        String id = eduCourseService.saveCourseInfo(courseInfoVo);
        return RParadigm.ok().data("Cid", id);
    }

    @GetMapping("/getCourseInfo/{courseId}")
    public RParadigm getCourseInfo(@PathVariable("courseId") String id){
        CourseInfoVo courseInfoVo = eduCourseService.getCourseInfo(id);
        return RParadigm.ok().data("courseInfoVo", courseInfoVo);
    }

    @PostMapping("/updateCourseInfo")
    public RParadigm updateCourseInfo(@RequestBody CourseInfoVo courseInfoVo){
        eduCourseService.updateByInfo(courseInfoVo);
        return RParadigm.ok();
    }


    @GetMapping("/getPublishInfo/{id}")
    public RParadigm getPublishInfo(@PathVariable String id){
        CoursePublishVo coursePublishVo = eduCourseService.getPublishInfo(id);
        return RParadigm.ok().data("coursePublishVo", coursePublishVo);
    }

    @PostMapping("/publishCourse/{id}")
    public RParadigm publishCourse(@PathVariable String id){
        EduCourse eduCourse = new EduCourse();
        eduCourse.setId(id);
        eduCourse.setStatus("Normal");
        eduCourseService.updateById(eduCourse);
        return RParadigm.ok();
    }
}

