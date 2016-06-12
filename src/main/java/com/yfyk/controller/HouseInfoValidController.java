package com.yfyk.controller;


import com.yfyk.bean.Pager;
import com.yfyk.common.service.HouseInfoValidService;
import com.yfyk.dao.extend.HouseInfoValidExtendMapper;
import com.yfyk.dto.request.GetHouseInfoValidListRequest;
import com.yfyk.entity.HouseInfoValid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Controller - 地区
 */
@Controller
@RequestMapping("/houseInfoValid")
public class HouseInfoValidController {


	@Autowired
	private HouseInfoValidService houseInfoValidService;

	@RequestMapping(value="/list")
	public String home(Model model, GetHouseInfoValidListRequest request) {
		Pager<HouseInfoValid> list = houseInfoValidService.list(request);
		model.addAttribute("pager", list);
		return "/houseInfo/list";
	}

	
}