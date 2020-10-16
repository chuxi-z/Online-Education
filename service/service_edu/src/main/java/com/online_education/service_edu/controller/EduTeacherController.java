package com.online_education.service_edu.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.online_education.common_utils.R;
import com.online_education.service_edu.entity.vo.TeacherQuery;
import com.online_education.service_edu.service.EduTeacherService;
import com.online_education.service_edu.entity.EduTeacher;
import com.online_education.servicebase.exceptionHandler.OnlineEducationException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
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


//@CrossOrigin(allowCredentials="true",maxAge = 3600)
@Api("Teacher")
@RestController
@CrossOrigin
@RequestMapping("/service_edu/edu-teacher")
//http://localhost:8888/service_edu/edu-teacher/findAll
public class EduTeacherController {
    @Autowired
    private EduTeacherService teacherService;

    //1.Query All Data of Teacher table
    @ApiOperation("Query All data of Teacher table")
    @GetMapping("findAll")
    public R findAllTeacher() {
        //调用service
        List<EduTeacher> list = teacherService.list(null);
        try {
            int i = 5 / 0;
        } catch (Exception e) {
            throw new OnlineEducationException(20001, "OnlineEducationException");
        }
        //int i = 5/0; //Test Global Exception& Arithmetic Exception
        return R.ok().data("items", list);
    }

    //2.Logic Delete Teacher by ID
    @ApiOperation("Logic Delete Teacher by id")
    @DeleteMapping("{id}")
    public R removeById(@ApiParam(name = "id", value = "Teacher ID", required = true) @PathVariable String id) {
        boolean flag = teacherService.removeById(id);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    //3. Query All Data of Teacher table by paging
    @ApiOperation("Query All data of Teacher table by paging")
    @GetMapping("PageTeacher{current}/{limit}")
    public R pageListTeacher(@PathVariable long current, @PathVariable long limit) {
        Page<EduTeacher> pageTeacher = new Page<>(current, limit);
        teacherService.page(pageTeacher, null);

        long total = pageTeacher.getTotal();
        List<EduTeacher> records = pageTeacher.getRecords();

        return R.ok().data("total", total).data("rows", records);
//        Map map = new HashMap();
//        map.put("total", total);
//        map.put("rows", records);
//        return R.ok().data(map);
    }

    //4. Query All Data of Teacher table by fuzzy
    @PostMapping("PageTeacherCondition/{current}/{limit}")
    public R pageTeacherCondition(@PathVariable long current, @PathVariable long limit,
                                  @RequestBody TeacherQuery teacherQuery) {
        Page<EduTeacher> pageTeacher = new Page<>(current, limit);

        QueryWrapper<EduTeacher> wrapper = new QueryWrapper<>();
        String name = teacherQuery.getName();
        Integer level = teacherQuery.getLevel();
        String begin = teacherQuery.getBegin();
        String end = teacherQuery.getEnd();
        if (!StringUtils.isEmpty(name)) {
            wrapper.like("name", name);
        }
        if (!StringUtils.isEmpty(level)) {
            wrapper.eq("level", level);
        }
        if (!StringUtils.isEmpty(begin)) {
            wrapper.ge("gmt_create", begin);
        }
        if (!StringUtils.isEmpty(end)) {
            wrapper.le("gmt_create", end);
        }
        teacherService.page(pageTeacher, wrapper);

        long total = pageTeacher.getTotal();
        List<EduTeacher> records = pageTeacher.getRecords();
        return R.ok().data("total", total).data("rows", records);
    }

    //5. Add Teacher
    // Don't input id and time
    @PostMapping("addTeacher")
    public R addTeacher(@RequestBody EduTeacher eduTeacher) {
        boolean save = teacherService.save(eduTeacher);
        if (save) {
            return R.ok();
        } else {
            return R.error();
        }
    }

    //6. Query by id
    @GetMapping("getTeacher/{id}")
    public R getTeacher(@PathVariable String id) {
        EduTeacher teacher = teacherService.getById(id);
        return R.ok().data("teacher", teacher);
    }

    //7. Update
    // Don't input time
    @PostMapping("updateTeacher")
    public R updateTeacher(@RequestBody EduTeacher eduTeacher) {
        boolean flag = teacherService.updateById(eduTeacher);
        if (flag) {
            return R.ok();
        } else {
            return R.error();
        }
    }


}

