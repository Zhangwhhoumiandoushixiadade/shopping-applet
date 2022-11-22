package com.xcx.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xcx.entity.OrderDetail;
import com.xcx.mapper.OrderDetailMapper;
import com.xcx.service.IOrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 * 订单细节 Service实现类
 * */

@Service("orderDetail")
public class IOrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements IOrderDetailService {

    @Autowired
    private OrderDetailMapper orderDetailMapper;
}
