package com.xcx.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xcx.entity.Order;
import com.xcx.properties.WeixinpayProperties;
import com.xcx.service.IOrderService;
import com.xcx.util.MD5Util;
import com.xcx.util.XmlUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

/**
 * 微信支付Controller
 *
 * @author java1234_小锋
 * @site www.java1234.com
 * @company 南通小锋网络科技有限公司
 * @create 2022-04-10 9:28
 */
@Controller
@RequestMapping("/weixinpay")
public class WeixinpayController {

    @Autowired
    private IOrderService orderService;

    @Autowired
    private WeixinpayProperties weixinpayProperties;


    private final static Logger logger = LoggerFactory.getLogger(WeixinpayController.class);

    /**
     * 微信支付服务器异步通知
     *
     */
    @RequestMapping("/notifyUrl")
//    public synchronized void notifyUrl(HttpServletRequest request) throws Exception {
    public synchronized void notifyUrl( @RequestBody String orderNo) throws Exception {

//        logger.info("notifyUrl");
//        // 第一步 获取数据
//        InputStream inputStream;
//        StringBuffer sb=new StringBuffer();
//        inputStream = request.getInputStream();
//        String s;
//        BufferedReader in=new BufferedReader(new InputStreamReader(inputStream,"UTF-8"));
//        while(((s=in.readLine())!=null)){
//            sb.append(s);
//        }
//        in.close();
//        inputStream.close();
//        logger.info("sb:"+sb.toString());
//
//        // 解析xml成map
//        Map<String,String> m=new HashMap<>();
//        m= XmlUtil.doXMLParse(sb.toString());
//
//        // 过滤空 设置TreeMap
//        SortedMap<Object,Object> packageParams=new TreeMap<>();
//        Iterator<String> it = m.keySet().iterator();
//        while(it.hasNext()){
//            String parameter = it.next();
//            String parameterValue = m.get(parameter);
//
//            String v="";
//            if(parameterValue!=null){
//                v=parameterValue.trim();
//            }
//            packageParams.put(parameter,v);
//        }
//        logger.info("packageParams:"+packageParams);
//
//        // 微信支付的API秘钥
//        String key = weixinpayProperties.getKey();
//
//        String out_trade_no= (String) packageParams.get("out_trade_no");
//
//        if(isTenpaySign("UTF-8",packageParams,key)){
//            logger.info("验证签名通过");
//            if("SUCCESS".equals(packageParams.get("result_code"))){
//                Order order = orderService.getOne(new QueryWrapper<Order>().eq("orderNo", out_trade_no));
//                if(order!=null && order.getStatus()==1){
//                    order.setPayDate(new Date());
//                    order.setStatus(2); // 设置已经支付状态
//                    orderService.saveOrUpdate(order);
//                    logger.info(out_trade_no+"：微信服务器异步修改订单状态成功");
//                }
//            }
//        }else{
//            logger.info(out_trade_no+":微信服务器异步验证失败！");
//        }
        Order order = orderService.getOne(new QueryWrapper<Order>().eq("orderNo", orderNo));
        order.setPayDate(new Date());
        order.setStatus(2); // 设置已经支付状态
        orderService.saveOrUpdate(order);

    }


    /**
     * 是否签名正确,规则是:按参数名称a-z排序,遇到空值的参数不参加签名。
     *
     * @return boolean
     */
    public static boolean isTenpaySign(String characterEncoding, SortedMap<Object, Object> packageParams, String API_KEY) {
        StringBuffer sb = new StringBuffer();
        Set es = packageParams.entrySet();
        Iterator it = es.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            String k = (String) entry.getKey();
            String v = (String) entry.getValue();
            if (!"sign".equals(k) && null != v && !"".equals(v)) {
                sb.append(k + "=" + v + "&");
            }
        }
        sb.append("key=" + API_KEY);

        //算出摘要
        String mysign = MD5Util.MD5Encode(sb.toString(), characterEncoding).toLowerCase();
        String tenpaySign = ((String) packageParams.get("sign")).toLowerCase();

        return tenpaySign.equals(mysign);
    }
}
