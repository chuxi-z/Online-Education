package com.web.eduorder.service;

import com.web.eduorder.entity.PayLog;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 支付日志表 服务类
 * </p>
 *
 * @author ZD
 * @since 2020-10-11
 */
public interface PayLogService extends IService<PayLog> {

    Map<String, Object> createQR(String orderNo);

    Map<String, String> queryPayStatus(String orderNo);

    void updateOrderStatus(Map<String, String> map);
}
