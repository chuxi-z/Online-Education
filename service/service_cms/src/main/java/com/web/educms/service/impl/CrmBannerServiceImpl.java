package com.web.educms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.web.educms.entity.CrmBanner;
import com.web.educms.mapper.CrmBannerMapper;
import com.web.educms.service.CrmBannerService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 首页banner表 服务实现类
 * </p>
 *
 * @author ZD
 * @since 2020-10-08
 */
@Service
public class CrmBannerServiceImpl extends ServiceImpl<CrmBannerMapper, CrmBanner> implements CrmBannerService {

    @Cacheable(key = "'selectIndexList'", value = "banner")
    @Override
    public List<CrmBanner> getAllBanner() {
        QueryWrapper<CrmBanner> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("id");
        wrapper.last("limit 2");

        List<CrmBanner> banners = baseMapper.selectList(wrapper);

        return banners;
    }
}
