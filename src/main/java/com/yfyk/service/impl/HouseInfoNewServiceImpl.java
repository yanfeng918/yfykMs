package com.yfyk.service.impl;

import com.yfyk.dao.extend.HouseInfoNewExtendMapper;
import com.yfyk.entity.HouseInfoNew;
import com.yfyk.entity.HouseInfoNewExample;
import com.yfyk.service.HouseInfoNewService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yanfeng on 2016/6/13.
 */
@Service
public class HouseInfoNewServiceImpl implements HouseInfoNewService {

    @Autowired
    private HouseInfoNewExtendMapper houseInfoNewExtendMapper;
    @Override
    public boolean isHouseExist(String mobile, String ban, String roomNumber) {
        if (StringUtils.isEmpty(mobile)||StringUtils.isEmpty(ban)||StringUtils.isEmpty(roomNumber)){
            return false;
        }
        HouseInfoNewExample houseInfoPropertyExample = new HouseInfoNewExample();
        houseInfoPropertyExample.or().andMobileEqualTo(mobile).andBanEqualTo(ban).andRoomnumberEqualTo(roomNumber);
        List<HouseInfoNew> houseInfoProperties = houseInfoNewExtendMapper.selectByExample(houseInfoPropertyExample);
        if (houseInfoProperties==null||houseInfoProperties.size()==0)
            return false;
        return true;
    }
}
