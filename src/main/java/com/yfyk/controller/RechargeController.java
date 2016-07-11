package com.yfyk.controller;

import com.yfyk.bean.Pager;
import com.yfyk.dto.request.finance.GetRechargeListRequest;
import com.yfyk.dto.response.GetRechargeListResponse;
import com.yfyk.entity.HouseInfoNew;
import com.yfyk.entity.Recharge;
import com.yfyk.enums.RechargeStatus;
import com.yfyk.service.MemberService;
import com.yfyk.service.RechargeService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value="recharge")
public class RechargeController {
	
	@Autowired
	private RechargeService rechargeService;

	@Autowired
	private MemberService memberService;

	@RequestMapping(value="/list")
	public String list(Model model, GetRechargeListRequest request) {
//		Pager<GetRechargeListResponse> list = rechargeService.list(request);
//		model.addAttribute("pager",list);
		return "recharge/list";
	}

	@RequestMapping(value="/getList")
	@ResponseBody
	public Pager<GetRechargeListResponse> getList(GetRechargeListRequest request) {
		Pager<GetRechargeListResponse> pager = rechargeService.list(request);
		List<GetRechargeListResponse> list = pager.getList();
		GetRechargeListResponse[] data = list.toArray(new GetRechargeListResponse[list.size()]);
		pager.setData(data);
		return pager;
	}

	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(int id, ModelMap model) {
//		Long adminId=(Long) SecurityUtils.getSubject().getSession().getAttribute("id");
		Recharge recharge=rechargeService.get(id);
		if(recharge.getStatus().equals(RechargeStatus.APPLY.getOutername())) {
			recharge.setStatus(RechargeStatus.CHECKING.getOutername());
			rechargeService.update(recharge);
		}
		model.addAttribute("recharge",recharge);
		return "/recharge/edit";
	}

	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Recharge recharge) {

		Recharge precharge = rechargeService.get(recharge.getId());
		//审核状态为成功
		if(precharge.getStatus().equals(RechargeStatus.SUCCESS.name())){
			//再次修改状态依然为成功
			precharge.setCheckcontent(recharge.getCheckcontent());
			precharge.setStatus(recharge.getStatus());
			precharge.setCheckdate(new Date());
			rechargeService.update(precharge);
			if(recharge.getStatus().equals(RechargeStatus.SUCCESS.name())){
				return "redirect:list";
			}
			//成功修改为不成功，则回滚
			memberService.minusBalance(precharge.getAmount(),precharge.getMemberId());
			return "redirect:list";
		}

		precharge.setCheckcontent(recharge.getCheckcontent());
		precharge.setStatus(recharge.getStatus());
		precharge.setCheckdate(new Date());
		rechargeService.update(precharge);

		//审核逻辑： 在审核通过的情况之下，信息的发布者的账户余额增加
		if(precharge.getStatus().equals(RechargeStatus.SUCCESS.name())){
			Float amount = precharge.getAmount();
			//账户余额增加
			memberService.addBalance(amount,precharge.getMemberId());
		}
		return "redirect:list";
	}


}
