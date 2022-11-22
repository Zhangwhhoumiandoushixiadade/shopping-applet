package com.xcx.controller.admin;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xcx.entity.Admin;
import com.xcx.entity.R;
import com.xcx.entity.PageBean;
import com.xcx.entity.WxUserInfo;
import com.xcx.service.IAdminService;
import com.xcx.service.IWxUserInfoService;
import com.xcx.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 后台管理--用户 controller
 */

@RestController
@RequestMapping("admin/user")
public class AdminUserController {

    @Autowired
    private IWxUserInfoService wxUserInfoService;

    @Autowired
    private IAdminService adminService;

    /**
     * 根据条件分页拆查询用户信息
     */
    @RequestMapping("/list")
    public R list(@RequestBody PageBean pageBean) {
        System.out.println(pageBean);
        String query = pageBean.getQuery().trim();
        Page<WxUserInfo> page = new Page<>(pageBean.getPageNum(), pageBean.getPageSize());
        Page<WxUserInfo> pageResult = wxUserInfoService.page(page, new QueryWrapper<WxUserInfo>().like(StringUtil.isNotEmpty(query), "nickName", query));
        Map<String, Object> map = new HashMap<>();
        map.put("userList", pageResult.getRecords());
        map.put("total", pageResult.getTotal());
        return R.ok(map);
    }



}
