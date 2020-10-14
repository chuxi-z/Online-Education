package com.web.educms.controller;

import com.web.commonutils.RParadigm;
import com.web.educms.entity.CrmBanner;
import com.web.educms.service.CrmBannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/educms/bannerFront")
@CrossOrigin
public class BannerFrontController {

    @Autowired
    CrmBannerService crmBannerService;

    @GetMapping("/getAllBanner")
    public RParadigm getAllBanner(){
        List<CrmBanner> list = crmBannerService.getAllBanner();
        return RParadigm.ok().data("list", list);
    }
}
