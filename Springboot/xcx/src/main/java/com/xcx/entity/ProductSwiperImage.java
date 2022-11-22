package com.xcx.entity;


import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("t_product_swiper_image")
@Data
public class ProductSwiperImage {
    private Integer id; // 编号
    private String image; // 图片名称
    private Integer sort; //排列序号，从小到大
    private Integer productId; //所需产品
}
