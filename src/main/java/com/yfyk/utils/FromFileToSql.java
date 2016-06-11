package com.yfyk.utils;

import org.springframework.core.io.ClassPathResource;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;


public class FromFileToSql {
	
	
	public static void main(String[] args) {
		try {
			FileReader fr = new FileReader(new ClassPathResource("/youhuiquan.txt").getFile());
			BufferedReader bf =new BufferedReader(fr);
			String valueString = null;
			int i=0;
		    while ((valueString=bf.readLine())!=null){
		    	if((i++)==0){
		    		System.out.println(valueString);
		    	}else {
		    		//break;
				}
			   
		    }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
