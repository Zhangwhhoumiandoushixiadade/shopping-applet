package com.xcx.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xcx.entity.BigType;
import com.xcx.entity.ProductSwiperImage;
import com.xcx.mapper.BigTypeMapper;
import com.xcx.mapper.ProductSwiperImageMapper;
import com.xcx.service.IBigTypeService;
import com.xcx.service.IProductSwiperImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 * 商品轮播图 Service实现类
 * */

@Service("productSwiperImage")
public class IProductSwiperImageServiceImpl extends ServiceImpl<ProductSwiperImageMapper, ProductSwiperImage> implements IProductSwiperImageService {

    @Autowired
    private ProductSwiperImageMapper productSwiperImageMapper;
}
