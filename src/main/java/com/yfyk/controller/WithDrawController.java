package com.yfyk.controller;

import com.yfyk.bean.Pager;
import com.yfyk.dto.request.GetWithDrawListRequest;
import com.yfyk.dto.request.finance.GetRechargeListRequest;
import com.yfyk.dto.response.GetRechargeListResponse;
import com.yfyk.dto.response.GetWithDrawListResponse;
import com.yfyk.entity.Recharge;
import com.yfyk.entity.WithDraw;
import com.yfyk.enums.RechargeStatus;
import com.yfyk.service.MemberService;
import com.yfyk.service.RechargeService;
import com.yfyk.service.WithDrawService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;

@Controller
@RequestMapping(value="withDraw")
public class WithDrawController {
	
	@Autowired
	private WithDrawService withDrawService;

	@Autowired
	private MemberService memberService;

	@RequestMapping(value="/list")
	public String list(Model model, GetWithDrawListRequest request) {
		Pager<GetWithDrawListResponse> list = withDrawService.list(request);
		model.addAttribute("pager",list);
		return "withDraw/list";
	}


	@RequestMapping(value="/add")
	public String add(Model model, GetWithDrawListRequest request) {
		return "withDraw/add";
	}

	@RequestMapping(value="/save")
	public String save(Model model, WithDraw withDraw) {
		Object id= SecurityUtils.getSubject().getSession().getAttribute("id");
		withDraw.setMemberId(Integer.parseInt(id.toString()));
		withDraw.setStatus(RechargeStatus.SUCCESS.name());
		withDraw.setCreatedate(new Date());
		withDrawService.add(withDraw);
		return "redirect:list";
	}







}
