package com.web.serviceedu.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.web.servicebase.exceptionHandler.customizeException;
import com.web.serviceedu.entity.EduSubject;
import com.web.serviceedu.entity.excel.SubjectData;
import com.web.serviceedu.service.EduSubjectService;

import javax.security.auth.Subject;

public class SubjectExcelListener extends AnalysisEventListener<SubjectData> {

    public EduSubjectService subjectService;

    public SubjectExcelListener(){}
    public SubjectExcelListener(EduSubjectService subjectService){
        this.subjectService = subjectService;
    }

    //一行一行读取 excel
    @Override
    public void invoke(SubjectData subjectData, AnalysisContext analysisContext) {
        if(subjectData == null){
            throw new customizeException(20001, "File data exception...");
        }

        EduSubject oneSubject = this.existOneSubject(subjectData.getOneSubjectName(), subjectService);

        if(oneSubject == null){
            oneSubject = new EduSubject();
            oneSubject.setParentId("0");
            oneSubject.setTitle(subjectData.getOneSubjectName());
            subjectService.save(oneSubject);
//            System.out.println("One===="+oneSubject.getTitle());
        }
//        else{
//            System.out.println("One===="+oneSubject.getTitle());
//        }

        String pid = oneSubject.getId();
        EduSubject twoSubject = this.existTwoSubject(subjectData.getTwoSubjectName(), subjectService, pid);

        if(twoSubject == null){
            twoSubject = new EduSubject();
            twoSubject.setParentId(pid);
            twoSubject.setTitle(subjectData.getTwoSubjectName());
            subjectService.save(twoSubject);
//            System.out.println("two===="+ twoSubject.getTitle());
        }
//        else{
//            System.out.println("two===="+ twoSubject.getTitle());
//        }

    }

    private EduSubject existOneSubject(String name, EduSubjectService subjectService){
        QueryWrapper<EduSubject> wrapper = new QueryWrapper<>();
        wrapper.eq("title", name);
        wrapper.eq("parent_id", "0");
        EduSubject one = subjectService.getOne(wrapper);
        return one;
    }

    private EduSubject existTwoSubject(String name, EduSubjectService subjectService, String pid){
        QueryWrapper<EduSubject> wrapper = new QueryWrapper<>();
        wrapper.eq("title", name);
        wrapper.eq("parent_id", pid);
        EduSubject two = subjectService.getOne(wrapper);
        return two;
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}
