package com.yfyk.common.service.impl;

import com.yfyk.bean.Pager;
import com.yfyk.common.service.HouseInfoValidService;
import com.yfyk.dao.extend.HouseInfoValidExtendMapper;
import com.yfyk.dto.request.GetHouseInfoValidListRequest;
import com.yfyk.entity.HouseInfoValid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yanfeng on 2016/6/12.
 */
@Service
public class HouseInfoValidServiceImpl implements HouseInfoValidService{

    @Autowired
    private HouseInfoValidExtendMapper houseInfoValidExtendMapper;

    @Override
    public Pager<HouseInfoValid> list(GetHouseInfoValidListRequest request) {
        request.webParamConvert();
        List<HouseInfoValid> houseInfoList = houseInfoValidExtendMapper.getHouseInfoList(request);
        int houseInfoListCount = houseInfoValidExtendMapper.getHouseInfoListCount(request);
        Pager<HouseInfoValid> pager = new Pager<HouseInfoValid>();
        pager.setPageNumber(request.getPageNumber());
        pager.setPageSize(request.getPageSize());
        pager.setList(houseInfoList);
        pager.setTotalCount(houseInfoListCount);
        return pager;
    }
}
