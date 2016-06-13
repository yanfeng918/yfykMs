package com.yfyk.service;

import com.yfyk.entity.HouseInfoProperty;

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
}
