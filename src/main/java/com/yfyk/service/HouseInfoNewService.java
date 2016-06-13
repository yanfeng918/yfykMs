package com.yfyk.service;

import com.yfyk.bean.Pager;
import com.yfyk.dto.request.GetHouseInfoNewListRequest;
import com.yfyk.entity.HouseInfoNew;

/**
 * Created by yanfeng on 2016/6/13.
 */
public interface HouseInfoNewService {
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
    void add(HouseInfoNew houseInfo);

    /**
     * 房源信息list
     * @param request
     * @return
     */
    Pager<HouseInfoNew> list(GetHouseInfoNewListRequest request);
}
