package com.web.serviceedu.service;

import com.web.serviceedu.entity.EduChapter;
import com.baomidou.mybatisplus.extension.service.IService;
import com.web.serviceedu.entity.chapter.ChapterVo;

import java.util.List;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author ZD
 * @since 2020-09-29
 */
public interface EduChapterService extends IService<EduChapter> {

    List<ChapterVo> getChapterVoById(String id);

    boolean deleteChapterInfo(String chapterId);

    void removeChapterByCourseId(String courseId);
}
