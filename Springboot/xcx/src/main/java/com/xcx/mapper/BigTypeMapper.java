package com.xcx.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xcx.entity.BigType;


/*
 * 商品大类 Map接口
 * */
public interface BigTypeMapper extends BaseMapper<BigType> {

    public BigType findById(Integer id);
}
