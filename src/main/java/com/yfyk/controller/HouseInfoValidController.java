package com.yfyk.controller;


import com.yfyk.bean.Pager;
import com.yfyk.service.CommunityService;
import com.yfyk.service.HouseInfoValidService;
import com.yfyk.dto.request.GetHouseInfoValidListRequest;
import com.yfyk.entity.HouseInfoProperty;
import com.yfyk.entity.HouseInfoValid;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

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