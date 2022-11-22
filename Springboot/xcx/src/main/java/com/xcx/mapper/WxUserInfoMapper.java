package com.xcx.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xcx.entity.WxUserInfo;

/***
 * 商品大类 Map接口
 */
public interface WxUserInfoMapper extends BaseMapper<WxUserInfo> {

    public WxUserInfo findByOpenId(String openId);
}
