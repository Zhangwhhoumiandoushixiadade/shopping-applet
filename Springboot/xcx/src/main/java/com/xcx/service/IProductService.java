package com.xcx.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xcx.entity.Product;

import java.util.List;
import java.util.Map;

/*
* 商品Service接口
* */
public interface IProductService extends IService<Product> {

    Long getTotal(Map<String, Object> map);


    List<Product> list(Map<String, Object> map);

    void add(Product product);

    void update(Product product);

    Product findById(Integer id);
}
