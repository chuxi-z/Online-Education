package com.web.eduorder.service.impl;

import com.web.commonutils.CourseFrontInfoVoOrder;
import com.web.commonutils.MemberInfoRemoteOrder;
import com.web.eduorder.Utils.OrderNoUtil;
import com.web.eduorder.client.EduClient;
import com.web.eduorder.client.UcenterClient;
import com.web.eduorder.entity.Order;
import com.web.eduorder.mapper.OrderMapper;
import com.web.eduorder.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单 服务实现类
 * </p>
 *
 * @author ZD
 * @since 2020-10-11
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

    @Autowired
    private EduClient eduClient;

    @Autowired
    private UcenterClient ucenterClient;

    @Override
    public String saveOrder(String courseId, String memberIdByJwtToken) {
        //远程获取课程详情
        CourseFrontInfoVoOrder courseInfoOrder = eduClient.getCourseInfoOrder(courseId);

        //远程获取用户详情
        MemberInfoRemoteOrder memberInfo = ucenterClient.getMemberInfo(memberIdByJwtToken);

        Order order = new Order();
        order.setOrderNo(OrderNoUtil.getOrderNo());
        order.setCourseId(courseId);
        order.setCourseTitle(courseInfoOrder.getTitle());
        order.setCourseCover(courseInfoOrder.getCover());
        order.setTeacherName(courseInfoOrder.getTeacherName());
        order.setTotalFee(courseInfoOrder.getPrice());

        order.setMemberId(memberIdByJwtToken);
        order.setMobile(memberInfo.getMobile());
        order.setNickname(memberInfo.getNickname());

        order.setStatus(0); //支付状态 未支付
        order.setPayType(1); //支付类型 微信

        baseMapper.insert(order);

        return order.getOrderNo();
    }
}
