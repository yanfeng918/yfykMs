package com.yfyk.service;

import com.yfyk.bean.Pager;
import com.yfyk.dto.request.GetHouseInfoValidListRequest;
import com.yfyk.entity.HouseInfoValid;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring-config.xml")
public class HouseInfoCrawlServiceTest {
	@Autowired
	private HouseInfoValidService validService;
	@Test
	public void addCollection(){

		GetHouseInfoValidListRequest request = new GetHouseInfoValidListRequest();
		request.setPageNumber(2);
		request.setPageSize(5);
		Pager<HouseInfoValid> list = validService.list(request);
		System.out.print(list);
	}
}
