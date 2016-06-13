package com.yfyk.service;

import com.yfyk.bean.Pager;
import com.yfyk.dto.request.GetHouseInfoPropertyListRequest;
import com.yfyk.dto.request.GetHouseInfoValidListRequest;
import com.yfyk.entity.HouseInfoProperty;
import com.yfyk.entity.HouseInfoValid;

/**
 * Created by yanfeng on 2016/6/13.
 */
public interface HouseInfoPropertyService {
    /**
     * 是否已经存在该房源
     * @param mobile
     * @param ban
     * @param roomNumber
     * @return
     */
    boolean isHouseExist(String mobile,String ban,String roomNumber);

    /**
     * 添加房源信息
     * @param houseInfoProperty
     */
    void add(HouseInfoProperty houseInfoProperty);

    /**
     * 房源信息list
     * @param request
     * @return
     */
    Pager<HouseInfoProperty> list(GetHouseInfoPropertyListRequest request);
}
