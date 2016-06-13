package com.yfyk.dao.extend;

import com.yfyk.dao.mbg.RechargeMapper;
import com.yfyk.dto.request.finance.GetRechargeListRequest;
import com.yfyk.dto.response.GetRechargeListResponse;

import java.util.List;


public interface RechargeExtendMapper extends RechargeMapper{

    List<GetRechargeListResponse> getRechargeList(GetRechargeListRequest request);

    int getRechargeListCount(GetRechargeListRequest request);

}