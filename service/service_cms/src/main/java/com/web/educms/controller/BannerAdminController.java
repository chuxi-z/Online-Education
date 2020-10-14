package com.web.educms.controller;


import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.web.commonutils.RParadigm;
import com.web.educms.entity.CrmBanner;
import com.web.educms.service.CrmBannerService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 首页banner表 前端控制器
 * </p>
 *
 * @author ZD
 * @since 2020-10-08
 */
@RestController
@RequestMapping("/educms/bannerAdmin")
@CrossOrigin
public class BannerAdminController {

    @Autowired
    CrmBannerService crmBannerService;

    @GetMapping("/pageBanner/{page}/{limit}")
    public RParadigm pageBanner(@PathVariable Long page,
                                @PathVariable Long limit){
        Page<CrmBanner> pageBanner = new Page<>();
        crmBannerService.page(pageBanner, null);
        return RParadigm.ok().data("items", pageBanner.getRecords()).data("total", pageBanner.getTotal());
    }

    @GetMapping("/getBanner/{id}")
    public RParadigm getBanner(@PathVariable String id) {
        CrmBanner banner = crmBannerService.getById(id);
        return RParadigm.ok().data("item", banner);
    }

    @PostMapping("/saveBanner")
    public RParadigm saveBanner(@RequestBody CrmBanner banner) {
        crmBannerService.save(banner);
        return RParadigm.ok();
    }

    @PutMapping("/updateBanner")
    public RParadigm updateById(@RequestBody CrmBanner banner) {
        crmBannerService.updateById(banner);
        return RParadigm.ok();
    }


    @DeleteMapping("/removeBanner/{id}")
    public RParadigm removeBanner(@PathVariable String id) {
        crmBannerService.removeById(id);
        return RParadigm.ok();
    }
}

