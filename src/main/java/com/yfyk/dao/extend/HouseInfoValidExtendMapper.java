package com.yfyk.dao.extend;

import com.yfyk.dao.mbg.HouseInfoValidMapper;
import com.yfyk.dto.request.GetHouseInfoValidListRequest;
import com.yfyk.entity.HouseInfoValid;

import java.util.List;


public interface HouseInfoValidExtendMapper extends HouseInfoValidMapper {

    List<HouseInfoValid> getHouseInfoList(GetHouseInfoValidListRequest request);

    int getHouseInfoListCount(GetHouseInfoValidListRequest request);

}