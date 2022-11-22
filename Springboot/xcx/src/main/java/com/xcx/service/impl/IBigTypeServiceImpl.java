package com.xcx.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xcx.entity.BigType;
import com.xcx.entity.Product;
import com.xcx.mapper.BigTypeMapper;
import com.xcx.mapper.ProductMapper;
import com.xcx.service.IBigTypeService;
import com.xcx.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 * 商品大类 Service实现类
 * */

@Service("bigTypeService")
public class IBigTypeServiceImpl extends ServiceImpl<BigTypeMapper, BigType> implements IBigTypeService {

    @Autowired
    private BigTypeMapper bigTypeMapper;
}
