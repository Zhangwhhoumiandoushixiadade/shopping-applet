package com.xcx.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 * @author Administrator
 *
 */
public class DateUtil {

	/**
	 * 日期对象转字符串
	 * @param date
	 * @param format
	 * @return
	 */
	public static String formatDate(Date date,String format){
		String result="";
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		if(date!=null){
			result=sdf.format(date);
		}
		return result;
	}
	
	/**
	 * 字符串转日期对象
	 * @param str
	 * @param format
	 * @return
	 * @throws Exception
	 */
	public static Date formatString(String str,String format) throws Exception{
		if(StringUtil.isEmpty(str)){
			return null;
		}
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		return sdf.parse(str);
	}
	
	public static String getCurrentDateStr(){
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmssSSSSSSSSS");
		return sdf.format(date);
	}
	
	public static String getCurrentDatePath()throws Exception{
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd/");
		return sdf.format(date);
	}
	
	public static void main(String[] args) {
		try {
			System.out.println(getCurrentDateStr());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
