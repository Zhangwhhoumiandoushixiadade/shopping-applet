package com.xcx.entity;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 微信用户信息实体
 * */
@Data
@TableName("t_wxUserInfo")
public class WxUserInfo implements Serializable {
    public Integer id;

    public String openid; //用户唯一标识

    public String nickName; //用户昵称

    public String avatarUrl; //用户头像的URL

    @JsonSerialize(using = CustomDateTimeSerializer.class)
    public Date registerDate; //注册日期

    @JsonSerialize(using = CustomDateTimeSerializer.class)
    public Date lastLoginDate; //最后登录日期

    @TableField(select = false,exist = false)
    public String code; //微信用户code，前端传过来
}
