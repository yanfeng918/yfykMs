package com.yfyk.service;

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
}
