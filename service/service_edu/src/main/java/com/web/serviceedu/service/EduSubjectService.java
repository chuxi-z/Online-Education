package com.web.serviceedu.service;

import com.web.serviceedu.entity.EduSubject;
import com.baomidou.mybatisplus.extension.service.IService;
import com.web.serviceedu.entity.subject.FirstSubject;
import com.web.serviceedu.entity.subject.SecondSubject;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 课程科目 服务类
 * </p>
 *
 * @author ZD
 * @since 2020-09-25
 */
@CrossOrigin
public interface EduSubjectService extends IService<EduSubject> {

    void saveSubject(MultipartFile file, EduSubjectService eduSubjectService);

    List<FirstSubject> getAllSubject();

}
