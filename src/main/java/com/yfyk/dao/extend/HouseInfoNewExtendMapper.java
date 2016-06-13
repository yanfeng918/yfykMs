package com.yfyk.dao.extend;

import com.yfyk.dao.mbg.HouseInfoNewMapper;
import com.yfyk.dto.request.GetHouseInfoNewListRequest;
import com.yfyk.entity.HouseInfoNew;

import java.util.List;


public interface HouseInfoNewExtendMapper extends HouseInfoNewMapper {

    List<HouseInfoNew> getHouseInfoList(GetHouseInfoNewListRequest request);

    int getHouseInfoListCount(GetHouseInfoNewListRequest request);
}