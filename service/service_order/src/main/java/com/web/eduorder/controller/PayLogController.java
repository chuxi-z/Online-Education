package com.web.eduorder.controller;


import com.web.commonutils.RParadigm;
import com.web.eduorder.service.OrderService;
import com.web.eduorder.service.PayLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 * 支付日志表 前端控制器
 * </p>
 *
 * @author ZD
 * @since 2020-10-11
 */
@RestController
@RequestMapping("/eduorder/paylog")
@CrossOrigin
public class PayLogController {

    @Autowired
    private PayLogService payLogService;

    @GetMapping("/createQRcode/{orderNo}")
    public RParadigm createQRcode(@PathVariable String orderNo){

        Map<String, Object> map =  payLogService.createQR(orderNo);
        return RParadigm.ok().data(map);
    }

    @GetMapping("/queryPayStatus/{orderNo}")
    public RParadigm queryPayStatus(@PathVariable String orderNo){
        //查询订单信息
        Map<String, String> map = payLogService.queryPayStatus(orderNo);
        if (map == null){
            return RParadigm.error().message("订单出错了");
        }

        if(map.get("trade_state").equals("SUCCESS")){
            //添加支付记录 并更新订单状态
            payLogService.updateOrderStatus(map);
            System.out.println("*****"+map);
            return RParadigm.ok().message("订单成功");
        }
        return RParadigm.ok().code(25000).message("正在支付");
    }
}

