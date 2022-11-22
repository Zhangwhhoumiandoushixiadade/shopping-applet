package com.xcx.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xcx.entity.Product;

import java.util.List;
import java.util.Map;


/*
* 商品Map接口
* */
public interface ProductMapper extends BaseMapper<Product> {


    Long getTotal(Map<String, Object> map);

    List<Product> list(Map<String, Object> map);

    void add(Product product);

    void update(Product product);

    Product findById(Integer id);
}
