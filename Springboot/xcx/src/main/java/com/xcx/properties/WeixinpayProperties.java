package com.xcx.properties;


import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
* 微信支付配置文件
* */

@Component
@ConfigurationProperties(prefix = "weixinpayconfig")
@Data
public class WeixinpayProperties {
    private String appid;//公众号ID

    private String mch_id;//商户号

    private String key; //商户的key【API密钥】

    private String url; //api请求地址

    private String notify_url; //服务器异步通知页面路径
}
