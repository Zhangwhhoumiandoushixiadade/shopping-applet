package com.xcx.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xcx.entity.BigType;
import com.xcx.entity.SmallType;

import java.util.List;
import java.util.Map;


/*
 * 商品小类 Map接口
 * */
public interface SmallTypeMapper extends BaseMapper<SmallType> {

    List<SmallType> list(Map<String, Object> map);

    Long getTotal(Map<String, Object> map);

    public SmallType findById(Integer id);
}
