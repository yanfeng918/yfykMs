package com.yfyk.service;

import com.yfyk.bean.Pager;
import com.yfyk.dto.request.GetHouseInfoValidListRequest;
import com.yfyk.entity.HouseInfoValid;

/**
 * Created by yanfeng on 2016/6/12.
 */
public interface HouseInfoValidService {


    Pager<HouseInfoValid> list(GetHouseInfoValidListRequest request);

    /**
     * 是否已经存在该房源
     * @param mobile
     * @param ban
     * @param roomNumber
     * @return
     */
    boolean isHouseExist(String mobile, String ban, String roomNumber);

    /**
     * 添加房源信息
     * @param houseInfo
     */
    void add(HouseInfoValid houseInfo);
}
