package com.yfyk.service.impl;

import com.yfyk.bean.Pager;
import com.yfyk.entity.HouseInfoNew;
import com.yfyk.entity.HouseInfoNewExample;
import com.yfyk.entity.HouseInfoValidExample;
import com.yfyk.service.HouseInfoValidService;
import com.yfyk.dao.extend.HouseInfoValidExtendMapper;
import com.yfyk.dto.request.GetHouseInfoValidListRequest;
import com.yfyk.entity.HouseInfoValid;
import org.apache.commons.lang3.StringUtils;
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



    @Override
    public boolean isHouseExist(String mobile, String ban, String roomNumber) {
        if (StringUtils.isEmpty(mobile)||StringUtils.isEmpty(ban)||StringUtils.isEmpty(roomNumber)){
            return false;
        }
        HouseInfoValidExample houseInfoPropertyExample = new HouseInfoValidExample();
        houseInfoPropertyExample.or().andMobileEqualTo(mobile).andBanEqualTo(ban).andRoomnumberEqualTo(roomNumber);
        List<HouseInfoValid> houseInfoProperties = houseInfoValidExtendMapper.selectByExample(houseInfoPropertyExample);
        if (houseInfoProperties==null||houseInfoProperties.size()==0)
            return false;
        return true;
    }

    @Override
    public void add(HouseInfoValid houseInfo) {
        if (houseInfo!=null)
            houseInfoValidExtendMapper.insertSelective(houseInfo);
    }
}
