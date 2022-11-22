package com.xcx.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xcx.entity.Admin;
import com.xcx.mapper.AdminMapper;
import com.xcx.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 管理员账号 Service实现类
 * */

@Service("admin")
public class IAdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements IAdminService {

    @Autowired
    private AdminMapper adminMapper;
}
