package com.yfyk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="index")
public class IndexController {
	

	@RequestMapping(value="/")
	public String home(Model model) {
		return "common/main";
	}
	@RequestMapping(value="other")
	public String other() {
		return "index/home";
	}
	
}
