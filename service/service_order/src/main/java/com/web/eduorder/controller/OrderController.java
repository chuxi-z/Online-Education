package com.web.eduorder.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.web.commonutils.JwtUtils;
import com.web.commonutils.RParadigm;
import com.web.eduorder.entity.Order;
import com.web.eduorder.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.querydsl.QuerydslUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 订单 前端控制器
 * </p>
 *
 * @author ZD
 * @since 2020-10-11
 */
@RestController
@RequestMapping("/eduorder/order")
@CrossOrigin
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/createOrder/{courseId}")
    public RParadigm createOrder(@PathVariable String courseId, HttpServletRequest request){
        String orderNumber = orderService.saveOrder(courseId, JwtUtils.getMemberIdByJwtToken(request));
        return RParadigm.ok().data("orderId", orderNumber);
    }

    @GetMapping("/getOrderInfo/{orderNo}")
    public RParadigm getOrderInfo(@PathVariable String orderNo){
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("order_no", orderNo);

        Order order = orderService.getOne(wrapper);
        return RParadigm.ok().data("order", order);
    }



}

