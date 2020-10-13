package com.online_education.service_edu.controller;


import com.online_education.common_utils.R;
import com.online_education.service_edu.entity.EduTeacher;
import com.online_education.service_edu.service.EduTeacherService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 讲师 前端控制器
 * </p>
 *
 * @author XD
 * @since 2020-09-08
 */

@Api("Teacher")
@RestController
@RequestMapping("/service_edu/edu-teacher")
//http://localhost:8080/service_edu/edu-teacher/findAll
public class EduTeacherController {
    @Autowired
    private EduTeacherService teacherService;

    //1.查询教师表中所有数据
    @ApiOperation("Query All data of Teacher table")
    @GetMapping("findAll")
    public R findAllTeacher(){
        //调用service
        List<EduTeacher> list = teacherService.list(null);
        return R.ok().data("items", list);
    }

    //2.逻辑删除教师
    @ApiOperation("Logic Delete Teacher by id")
    @DeleteMapping("{id}")
    public R removeById(@ApiParam(name = "id", value = "Teacher ID", required = true) @PathVariable String id){
        boolean flag = teacherService.removeById(id);
        if(flag){
            return R.ok();
        }else {
            return R.error();
        }
    }

}

