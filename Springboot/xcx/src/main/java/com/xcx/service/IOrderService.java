package com.xcx.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xcx.entity.Order;

import java.util.List;
import java.util.Map;

/*
* 订单主表 Service接口
* */
public interface IOrderService extends IService<Order> {

    /***
     * 根据条件分页查询订单记录数据
     * @return
     */
    List<Order> list(Map<String,Object> map);

    /***
     * 根据条件查询订单总记录数
     * @return
     */
    Long getTotal(Map<String,Object> map);
}
