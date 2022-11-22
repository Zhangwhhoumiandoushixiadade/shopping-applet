package com.xcx.constant;

public class SystemConstant {
    /**
     *  token
     * */
    public static final int JWT_ERRCODE_NULL = 4000; //Token不存在
    public static final int JWT_ERRCODE_EXPIRE = 4001; //token过期

    public static final int JWT_ERRCODE_FAIL = 4002;  //验证不通过


    /**
     * JWT
     * */
    public static final String JWT_SECERT="1d68788e0dd2fec37065e41af173ddaa"; //密钥
    public static final long JWT_TTL=24*60 * 60 * 1000; //token有效时间
}
