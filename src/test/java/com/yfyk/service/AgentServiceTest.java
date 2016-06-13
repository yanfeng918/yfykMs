package com.yfyk.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring-config.xml")
public class AgentServiceTest {
	@Autowired
	private AgentService agentService;
	@Test
	public void isAgent(){
		boolean agent = agentService.isAgent("13122045162");
		boolean agent1 = agentService.isAgent("13167185567");
		System.out.print("----------------------------------"+agent1);
	}
}
