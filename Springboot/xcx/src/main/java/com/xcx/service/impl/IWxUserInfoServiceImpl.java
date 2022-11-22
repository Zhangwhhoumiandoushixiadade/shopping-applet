package com.xcx.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xcx.entity.BigType;
import com.xcx.entity.WxUserInfo;
import com.xcx.mapper.BigTypeMapper;
import com.xcx.mapper.WxUserInfoMapper;
import com.xcx.service.IBigTypeService;
import com.xcx.service.IWxUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 * 微信用户 Service实现类
 * */

@Service("wxUserInfoService")
public class IWxUserInfoServiceImpl extends ServiceImpl<WxUserInfoMapper, WxUserInfo> implements IWxUserInfoService {

    @Autowired
    private WxUserInfoMapper wxUserInfoMapper;
}
