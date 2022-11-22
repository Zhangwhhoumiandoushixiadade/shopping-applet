package com.xcx.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xcx.entity.OrderDetail;
import com.xcx.entity.R;
import com.xcx.service.IOrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/***
 * 管理员订单详情 controller控制器
 *
 */

@RestController
@RequestMapping("/admin/orderDetail")
public class AdminOrderDetailController {
    @Autowired
    private IOrderDetailService orderDetailService;

    /***
     * 根据订单号，查询订单详情
     * @param id
     * @return
     */
    @RequestMapping("/list/{id}")
    public R list(@PathVariable(value = "id") Integer id) {
        List<OrderDetail> orderDetailList = orderDetailService.list(new QueryWrapper<OrderDetail>().eq("mId", id));
        Map<String, Object> map = new HashMap<>();
        map.put("list", orderDetailList);
        return R.ok(map);
    }
}
