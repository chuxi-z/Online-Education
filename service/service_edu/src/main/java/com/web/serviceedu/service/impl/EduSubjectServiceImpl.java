package com.web.serviceedu.service.impl;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.web.serviceedu.entity.EduSubject;
import com.web.serviceedu.entity.excel.SubjectData;
import com.web.serviceedu.entity.subject.FirstSubject;
import com.web.serviceedu.entity.subject.SecondSubject;
import com.web.serviceedu.listener.SubjectExcelListener;
import com.web.serviceedu.mapper.EduSubjectMapper;
import com.web.serviceedu.service.EduSubjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Wrapper;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 课程科目 服务实现类
 * </p>
 *
 * @author ZD
 * @since 2020-09-25
 */
@Service
@CrossOrigin
public class EduSubjectServiceImpl extends ServiceImpl<EduSubjectMapper, EduSubject> implements EduSubjectService {

//    @Autowired
//    EduSubjectService eduSubjectService;

    @Override
    public void saveSubject(MultipartFile file, EduSubjectService eduSubjectService) {
        try {
            InputStream inputStream = file.getInputStream();
            EasyExcel.read(inputStream, SubjectData.class, new SubjectExcelListener(eduSubjectService)).sheet().doRead();
        }catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<FirstSubject> getAllSubject() {
        QueryWrapper<EduSubject> wrapper = new QueryWrapper<>();
        wrapper.eq("parent_id", "0");
        List<EduSubject> first = baseMapper.selectList(wrapper);

        QueryWrapper<EduSubject> wrapperSecond = new QueryWrapper<>();
        wrapper.ne("parent_id", "0");
        List<EduSubject> second = baseMapper.selectList(wrapperSecond);

        List<FirstSubject> finalSubject = new ArrayList<>();

        for(EduSubject f : first){
            FirstSubject firstSubject = new FirstSubject();
//            firstSubject.setId(f.getId());
//            firstSubject.setTitle(f.getTitle());
            BeanUtils.copyProperties(f, firstSubject);

            List<SecondSubject> children = new ArrayList<>();
            for(EduSubject s : second){
                if(s.getParentId().equals(f.getId())) {
                    SecondSubject secondSubject = new SecondSubject();
//                    secondSubject.setId(s.getId());
//                    secondSubject.setTitle(s.getTitle());
                    BeanUtils.copyProperties(s, secondSubject);
                    children.add(secondSubject);
                }
            }
            firstSubject.setChildren(children);
            finalSubject.add(firstSubject);
        }

        return finalSubject;
    }
}
