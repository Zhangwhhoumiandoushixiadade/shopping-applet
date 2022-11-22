package com.xcx.entity;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单主表
 * */

@TableName("t_order")
@Data
public class Order {
    private Integer id;//编号

    private String orderNo; //订单号

    private String userId; // orderId微信用户的id

    @TableField(select = false)
    private WxUserInfo wxUserInfo; // 微信用户

    private BigDecimal totalPrice; // 总价

    private String address; //收获地址

    private String consignee; //收货人

    private String telNumber; // 联系电话

    @JsonSerialize(using = CustomDateTimeSerializer.class)
    private Date createDate; //订单创建日期

    @JsonSerialize(using = CustomDateTimeSerializer.class)
    private Date payDate;// 支付时间

    private Integer status; //订单支付状态 1 未支付   2 已支付/待收货   3 退款/退货

    @TableField(select = false,exist = false)
    private OrderDetail[] goods; //订单商品详情
}
