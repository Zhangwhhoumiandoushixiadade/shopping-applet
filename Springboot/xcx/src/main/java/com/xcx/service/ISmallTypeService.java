package com.xcx.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xcx.entity.SmallType;

import java.util.List;
import java.util.Map;

/*
* 商品小类 Service接口
* */
public interface ISmallTypeService extends IService<SmallType> {

    Long getTotal(Map<String, Object> map);

    List<SmallType> list(Map<String, Object> map);
}
