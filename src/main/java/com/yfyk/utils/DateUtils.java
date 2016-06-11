package com.yfyk.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {
	public static Date parse(String date){
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date res = null;
		try {
			res = sdf.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public static String getTomorrow(){
		Date date = new Date();
		date.setDate(date.getDate()+1);
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	
	public static String getToday(){
		Date date = new Date();
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	
	public static String getYesterday(){ 
		Date date = new Date();
		date.setDate(date.getDate()-1);
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	public static String getThreeDaysAgo(){
		Date date = new Date();
		date.setDate(date.getDate()-3);
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	public static String getTwoDaysAgo(){
		Date date = new Date();
		date.setDate(date.getDate()-2);
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	public static String getLastWeek(){
		Date date = new Date();
		date.setDate(date.getDate()-7);
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	
	public static String getLastMonth(){
		Date date = new Date();
		date.setMonth(date.getMonth() - 1);
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	public static String getLongAgo(){
		Date date = new Date();
		date.setYear(date.getYear() - 5);
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	//获取当月号
	public static int getDay(){
		Calendar c = Calendar.getInstance();
		int datenum=c.get(Calendar.DATE);
		return datenum;
	}
	public static void main(String[] args) {
		System.out.println(getLastMonth());
		Date d = new Date();
		Calendar c = Calendar.getInstance();
		int datenum=c.get(Calendar.DATE);
		System.out.println(datenum);
	}
}
