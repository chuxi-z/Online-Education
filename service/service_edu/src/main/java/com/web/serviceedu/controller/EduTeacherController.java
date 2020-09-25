package com.web.serviceedu.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.web.commonutils.RParadigm;
import com.web.servicebase.exceptionHandler.customizeException;
import com.web.serviceedu.entity.EduTeacher;
import com.web.serviceedu.entity.vo.TeacherQuery;
import com.web.serviceedu.service.EduTeacherService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ZD
 * @since 2020-09-15
 */

@Api(description = "lecturer Management")
@RestController
@RequestMapping("/eduservice/teacher")
@CrossOrigin
public class EduTeacherController {

    @Autowired
    private EduTeacherService eduTeacherService;

    @ApiOperation(value = "select all lecturer")
    @GetMapping("/findAll")
    public RParadigm findAllTeacher(){
        List<EduTeacher> list = eduTeacherService.list(null);

        return RParadigm.ok().data("items", list);
    }

    @DeleteMapping("/{id}")
    public RParadigm deleteTeacher(@PathVariable("id") String id){
        boolean remove = eduTeacherService.removeById(id);
        if(remove){
            return RParadigm.ok();
        }
        return RParadigm.error();
    }

    @GetMapping("/pageTeacher/{current}/{size}")
    public RParadigm pageListTeacher(@PathVariable("current") long current,
                                     @PathVariable("size") long size){
        Page<EduTeacher> teacherPage = new Page<>(current, size);
        eduTeacherService.page(teacherPage, null);
        long total = teacherPage.getTotal();
        List<EduTeacher> records = teacherPage.getRecords();

        return RParadigm.ok().data("total", total).data("record", records);
    }


    @PostMapping("/pageTeacherCondition/{current}/{size}")
    public RParadigm TeacherCondition(@PathVariable("current") long current,
                                      @PathVariable("size") long size,
                                      @RequestBody(required = false) TeacherQuery query){
        Page<EduTeacher> teacherPage = new Page<>(current, size);
        QueryWrapper<EduTeacher> wrapper = new QueryWrapper<>();

        String name = query.getName();
        Integer level = query.getLevel();
        String begin = query.getBegin();
        String end = query.getEnd();
        if(!StringUtils.isEmpty(name)){
            wrapper.like("name", name);
        }
        if(!StringUtils.isEmpty(level)){
            wrapper.eq("level", level);
        }
        if(!StringUtils.isEmpty(begin)){
            wrapper.ge("gmt_create", begin);
        }
        if(!StringUtils.isEmpty(end)){
            wrapper.le("gmt_create", end);
        }
        wrapper.orderByDesc("gmt_create");

        eduTeacherService.page(teacherPage, wrapper);
        long total = teacherPage.getTotal();
        List<EduTeacher> records = teacherPage.getRecords();

        return RParadigm.ok().data("total", total).data("record", records);
    }

    @PostMapping("/addTeacher")
    public RParadigm addTeacher(@RequestBody EduTeacher eduTeacher){
        boolean save = eduTeacherService.save(eduTeacher);
        if(save){
            return RParadigm.ok();
        }
        return RParadigm.error();
    }

    @GetMapping("/getTeacher/{id}")
    public RParadigm getTeacher(@PathVariable("id") String id){
        EduTeacher teacher = eduTeacherService.getById(id);
//        try {
//            int r = 10/0;
//        }
//        catch (Exception e){
//            throw new customizeException(20001, "start custimized exception...");
//        }
        return RParadigm.ok().data("teacher", teacher);
    }

    @PostMapping("/updateTeacher")
    public RParadigm updateTeacher(@RequestBody EduTeacher eduTeacher){
        boolean update = eduTeacherService.updateById(eduTeacher);
        if(update){
            return RParadigm.ok();
        }
        return RParadigm.error();
    }

}

