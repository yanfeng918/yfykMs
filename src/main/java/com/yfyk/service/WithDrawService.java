package com.yfyk.service;

import com.yfyk.bean.Pager;
import com.yfyk.dto.request.GetWithDrawListRequest;
import com.yfyk.dto.request.finance.GetRechargeListRequest;
import com.yfyk.dto.response.GetRechargeListResponse;
import com.yfyk.dto.response.GetWithDrawListResponse;
import com.yfyk.entity.Recharge;
import com.yfyk.entity.WithDraw;

/**
 * Created by yanfeng on 2016/6/13.
 */
public interface WithDrawService {

    Pager<GetWithDrawListResponse> list(GetWithDrawListRequest request);

    void add(WithDraw withDraw);

}
