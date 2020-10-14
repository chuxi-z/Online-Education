package com.web.serviceedu.controller.front;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.web.commonutils.CourseFrontInfoVoOrder;
import com.web.commonutils.RParadigm;
import com.web.serviceedu.entity.EduCourse;
import com.web.serviceedu.entity.chapter.ChapterVo;
import com.web.serviceedu.entity.frontVo.courseFrontVo;
import com.web.serviceedu.entity.frontVo.CourseFrontInfoVo;
import com.web.serviceedu.service.EduChapterService;
import com.web.serviceedu.service.EduCourseService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
@RequestMapping("/eduservice/courseFront")
public class courseFrontController {

    @Autowired
    private EduCourseService eduCourseService;

    @Autowired
    private EduChapterService eduChapterService;

    @PostMapping("/getFrontCoursePage/{page}/{limit}")
    public RParadigm getFrontCoursePage(@PathVariable Long page, @PathVariable Long limit,
                                        @RequestBody(required = false) courseFrontVo courseQuery){
        Page<EduCourse> coursePage = new Page<>(page, limit);

        Map<String, Object> map = eduCourseService.getCourseFrontPage(coursePage, courseQuery);
        return RParadigm.ok().data(map);
    }


    @GetMapping("/getFrontCourseInfo/{courseId}")
    public RParadigm getFrontCourseInfo(@PathVariable String courseId){
        //查询课程所有基本信息
        CourseFrontInfoVo courseInfoVo = eduCourseService.getBaseCourseInfo(courseId);

        //所有章节 小节
        List<ChapterVo> chapterVoList = eduChapterService.getChapterVoById(courseId);

        return RParadigm.ok().data("courseInfoVo", courseInfoVo).data("chapterVoList", chapterVoList);
    }

    //远程传送课程信息到order
    @PostMapping("/getCourseInfoOrder/{id}")
    public CourseFrontInfoVoOrder getCourseInfoOrder(@PathVariable String id){
        CourseFrontInfoVo courseInfo = eduCourseService.getBaseCourseInfo(id);
        CourseFrontInfoVoOrder courseOrder = new CourseFrontInfoVoOrder();
        BeanUtils.copyProperties(courseInfo, courseOrder);
        return courseOrder;
    }
}
