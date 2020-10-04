package com.web.serviceedu.controller;


import com.web.commonutils.RParadigm;
import com.web.serviceedu.entity.subject.FirstSubject;
import com.web.serviceedu.entity.subject.SecondSubject;
import com.web.serviceedu.service.EduSubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 课程科目 前端控制器
 * </p>
 *
 * @author ZD
 * @since 2020-09-25
 */
@RestController
@RequestMapping("/eduservice/subject")
@CrossOrigin
public class EduSubjectController {

    @Autowired
    EduSubjectService eduSubjectService;

    @PostMapping("/addSubject")
    public RParadigm addSubject(MultipartFile file){
        eduSubjectService.saveSubject(file, eduSubjectService);

        return RParadigm.ok();
    }

    @GetMapping("/getAllSubject")
    public RParadigm getAllSubject(){
        List<FirstSubject> list = eduSubjectService.getAllSubject();

        return RParadigm.ok().data("list", list);
    }
}

