package com.yfyk.common.service;

import com.yfyk.bean.Pager;
import com.yfyk.dto.request.GetHouseInfoValidListRequest;
import com.yfyk.entity.HouseInfoValid;

/**
 * Created by yanfeng on 2016/6/12.
 */
public interface HouseInfoValidService {
    Pager<HouseInfoValid> list(GetHouseInfoValidListRequest request);
}
