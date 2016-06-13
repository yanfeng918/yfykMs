package com.yfyk.service;

import com.yfyk.entity.Community;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring-config.xml")
public class CommunityServiceTest {
	@Autowired
	private CommunityService communityService;
	@Test
	public void findByName(){
		Community community = communityService.findByName("陆家嘴中央公寓");
		if (community!=null)
			System.out.println("----------------------------------"+community.getAreaId());
	}
}
