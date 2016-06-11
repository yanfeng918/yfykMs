package com.yfyk.utils;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.ClassPathResource;

import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * Utils - 系统设置
 */
@SuppressWarnings("unchecked")
public final class Dom4jUtils {

	/**
	 * 不可实例化
	 */
	private Dom4jUtils() {
	}

	public static String getAttribute(String name) {

			try {
				File shopxxXmlFile = new ClassPathResource("/yjbadmin.xml").getFile();
				Document document = new SAXReader().read(shopxxXmlFile);
				List<Element> elements = document.selectNodes("/yjbadmin/setting");
				for (Element element : elements) {
					if(name.equals(element.attributeValue("name"))){
						return element.attributeValue("value");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return "";
	}
	
	
	public static void main(String[] args) {
		//System.out.println(getAttribute("siteUrl"));
		System.out.println("aa"+(new Date().getTime())+"bb");
	}
}