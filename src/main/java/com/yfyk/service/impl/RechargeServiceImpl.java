package com.yfyk.service.impl;

import com.yfyk.bean.Pager;
import com.yfyk.dao.extend.RechargeExtendMapper;
import com.yfyk.dto.request.finance.GetRechargeListRequest;
import com.yfyk.dto.response.GetRechargeListResponse;
import com.yfyk.entity.Recharge;
import com.yfyk.service.RechargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yanfeng on 2016/6/13.
 */
@Service
public class RechargeServiceImpl implements RechargeService {

    @Autowired
    private RechargeExtendMapper rechargeExtendMapper;

    @Override
    public Pager<GetRechargeListResponse> list(GetRechargeListRequest request) {

        request.webParamConvert();
        List<GetRechargeListResponse> rechargeList = rechargeExtendMapper.getRechargeList(request);
        int count = rechargeExtendMapper.getRechargeListCount(request);

        Pager<GetRechargeListResponse> pager = new Pager<>();
        pager.setPageNumber(request.getPageNumber());
        pager.setPageSize(request.getPageSize());
        pager.setList(rechargeList);
        pager.setTotalCount(count);
        return pager;
    }

    @Override
    public Recharge get(int id) {
        return rechargeExtendMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(Recharge recharge) {
        return rechargeExtendMapper.updateByPrimaryKeySelective(recharge);
    }
}
