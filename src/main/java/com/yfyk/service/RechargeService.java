package com.yfyk.service;

import com.yfyk.bean.Pager;
import com.yfyk.dto.request.finance.GetRechargeListRequest;
import com.yfyk.dto.response.GetRechargeListResponse;
import com.yfyk.entity.Recharge;

/**
 * Created by yanfeng on 2016/6/13.
 */
public interface RechargeService {
    Pager<GetRechargeListResponse> list(GetRechargeListRequest request);

    Recharge  get(int id);

    int update(Recharge recharge);
}
