package com.xcx.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xcx.entity.Order;
import com.xcx.entity.OrderDetail;
import com.xcx.entity.PageBean;
import com.xcx.entity.R;
import com.xcx.service.IOrderDetailService;
import com.xcx.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/***
 * 管理员 订单 controller控制器
 */

@RestController
@RequestMapping("/admin/order")
public class AdminOrderController {
    @Autowired
    private IOrderService orderService;

    @Autowired
    private IOrderDetailService orderDetailService;


    /***
     * 根据条件分页查询
     * @param pageBean
     * @return
     */
    @RequestMapping("/list")
    public R list(@RequestBody PageBean pageBean) {
        Map<String, Object> map = new HashMap<>();
        map.put("orderNo", pageBean.getQuery().trim());
        map.put("start", pageBean.getStart());
        map.put("pageSize", pageBean.getPageSize());

        List<Order> orderList = orderService.list(map);
        Long total = orderService.getTotal(map);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("orderList", orderList);
        resultMap.put("total", total);
        return R.ok(resultMap);

    }

    /***
     *更新订单状态
     * @param order
     * @return
     */
    @PostMapping("/updateStatus")
    public R updateStatus(@RequestBody Order order) {
        Order resultOrder = orderService.getById(order.getId());
        resultOrder.setStatus(order.getStatus());
        orderService.saveOrUpdate(resultOrder);
        return R.ok();
    }

    @GetMapping("/delete/{id}")
    private R delete(@PathVariable(value = "id") Integer id) {
        //删除订单详细信息表
        orderDetailService.remove(new QueryWrapper<OrderDetail>().eq("mId",id));
        orderService.removeById(id);
        return R.ok();
    }
}
