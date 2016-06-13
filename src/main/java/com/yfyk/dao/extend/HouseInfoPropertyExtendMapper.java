package com.yfyk.dao.extend;

import com.yfyk.dao.mbg.HouseInfoPropertyMapper;
import com.yfyk.dto.request.GetHouseInfoPropertyListRequest;
import com.yfyk.entity.HouseInfoProperty;

import java.util.List;


public interface HouseInfoPropertyExtendMapper extends HouseInfoPropertyMapper {

    List<HouseInfoProperty> getHouseInfoList(GetHouseInfoPropertyListRequest request);

    int getHouseInfoListCount(GetHouseInfoPropertyListRequest request);

}