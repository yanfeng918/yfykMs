package com.yfyk.service.impl;

import com.yfyk.bean.Pager;
import com.yfyk.dao.extend.RechargeExtendMapper;
import com.yfyk.dao.extend.WithDrawExtendMapper;
import com.yfyk.dto.request.GetWithDrawListRequest;
import com.yfyk.dto.request.finance.GetRechargeListRequest;
import com.yfyk.dto.response.GetRechargeListResponse;
import com.yfyk.dto.response.GetWithDrawListResponse;
import com.yfyk.entity.Recharge;
import com.yfyk.entity.WithDraw;
import com.yfyk.service.RechargeService;
import com.yfyk.service.WithDrawService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yanfeng on 2016/6/13.
 */
@Service
public class WithDrawServiceImpl implements WithDrawService {

    @Autowired
    private WithDrawExtendMapper withDrawExtendMapper;

    @Override
    public Pager<GetWithDrawListResponse> list(GetWithDrawListRequest request) {

        request.webParamConvert();
        List<GetWithDrawListResponse> list = withDrawExtendMapper.getWithDrawList(request);
        int count = withDrawExtendMapper.getWithDrawListCount(request);

        Pager<GetWithDrawListResponse> pager = new Pager<>();
        pager.setPageNumber(request.getPageNumber());
        pager.setPageSize(request.getPageSize());
        pager.setList(list);
        pager.setTotalCount(count);
        return pager;
    }

    @Override
    public void add(WithDraw withDraw) {
        if (withDraw!=null){
            withDrawExtendMapper.insertSelective(withDraw);
        }
    }

}
