package com.yfyk.service.impl;

import com.yfyk.dao.extend.HouseInfoPropertyExtendMapper;
import com.yfyk.entity.HouseInfoProperty;
import com.yfyk.entity.HouseInfoPropertyExample;
import com.yfyk.service.HouseInfoPropertyService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yanfeng on 2016/6/13.
 */
@Service
public class HouseInfoPropertyServiceImpl implements HouseInfoPropertyService {

    @Autowired
    private HouseInfoPropertyExtendMapper houseInfoPropertyExtendMapper;
    @Override
    public boolean isHouseExist(String mobile, String ban, String roomNumber) {
        if (StringUtils.isEmpty(mobile)||StringUtils.isEmpty(ban)||StringUtils.isEmpty(roomNumber)){
            return false;
        }
        HouseInfoPropertyExample houseInfoPropertyExample = new HouseInfoPropertyExample();
        houseInfoPropertyExample.or().andMobileEqualTo(mobile).andBanEqualTo(ban).andRoomnumberEqualTo(roomNumber);
        List<HouseInfoProperty> houseInfoProperties = houseInfoPropertyExtendMapper.selectByExample(houseInfoPropertyExample);
        if (houseInfoProperties==null||houseInfoProperties.size()==0)
            return false;
        return true;
    }

    @Override
    public void add(HouseInfoProperty houseInfoProperty) {
        if (houseInfoProperty!=null)
            houseInfoPropertyExtendMapper.insertSelective(houseInfoProperty);
    }
}
