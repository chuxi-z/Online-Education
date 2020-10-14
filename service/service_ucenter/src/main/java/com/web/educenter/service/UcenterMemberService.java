package com.web.educenter.service;

import com.web.educenter.entity.UcenterMember;
import com.baomidou.mybatisplus.extension.service.IService;
import com.web.educenter.entity.vo.RegisterVo;

/**
 * <p>
 * 会员表 服务类
 * </p>
 *
 * @author ZD
 * @since 2020-10-09
 */
public interface UcenterMemberService extends IService<UcenterMember> {

    String login(UcenterMember ucenterMember);

    void register(RegisterVo registerVo);

    UcenterMember countByOpenId(String openid);
}
