package com.xcx.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xcx.entity.SmallType;
import com.xcx.mapper.SmallTypeMapper;
import com.xcx.service.ISmallTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/*
 * 商品小类 Service实现类
 * */

@Service("smallTypeService")
public class ISmallTypeServiceImpl extends ServiceImpl<SmallTypeMapper, SmallType> implements ISmallTypeService {

    @Autowired
    private SmallTypeMapper smallTypeMapper;

    @Override
    public Long getTotal(Map<String, Object> map) {
        return smallTypeMapper.getTotal(map);
    }

    @Override
    public List<SmallType> list(Map<String, Object> map) {
        return smallTypeMapper.list(map);
    }
}
