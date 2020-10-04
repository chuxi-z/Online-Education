package com.web.serviceedu.controller;


import com.web.commonutils.RParadigm;
import com.web.serviceedu.entity.EduChapter;
import com.web.serviceedu.entity.chapter.ChapterVo;
import com.web.serviceedu.service.EduChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author ZD
 * @since 2020-09-29
 */
@RestController
@RequestMapping("/eduservice/chapter")
@CrossOrigin
public class EduChapterController {

    @Autowired
    EduChapterService eduChapterService;

    @GetMapping("/getChapterVideo/{courseId}")
    public RParadigm findAll(@PathVariable("courseId") String id){
        List<ChapterVo> list = eduChapterService.getChapterVoById(id);
        return RParadigm.ok().data("allChapterVo", list);
    }

    @PostMapping("/addChapter")
    public RParadigm addChapter(@RequestBody EduChapter eduChapter){
        eduChapterService.save(eduChapter);
        return RParadigm.ok();
    }

    @GetMapping("/getChapterInfo/{chapterId}")
    public RParadigm getChapter(@PathVariable String chapterId){
        EduChapter chapter = eduChapterService.getById(chapterId);
        return RParadigm.ok().data("chapterInfo", chapter);
    }

    @PostMapping("/updateChapter")
    public RParadigm getChapter(@RequestBody EduChapter eduChapter){
        eduChapterService.updateById(eduChapter);
        return RParadigm.ok();
    }

    @DeleteMapping("/deleteChapter/{chapterId}")
    public RParadigm deleteChapter(@PathVariable String chapterId){
       boolean delete = eduChapterService.deleteChapterInfo(chapterId);
       if(delete){
            return RParadigm.ok();
       }
       return RParadigm.error();
    }
}

