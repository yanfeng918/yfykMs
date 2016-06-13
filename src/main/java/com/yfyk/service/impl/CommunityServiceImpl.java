package com.yfyk.service.impl;

import com.yfyk.dao.extend.CommunityExtendMapper;
import com.yfyk.entity.Community;
import com.yfyk.entity.CommunityExample;
import com.yfyk.service.CommunityService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yanfeng on 2016/6/13.
 */
@Service
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private CommunityExtendMapper communityExtendMapper;

    @Override
    public Community findByName(String name) {
        if (StringUtils.isEmpty(name))
            return null;
        CommunityExample example = new CommunityExample();
        example.or().andNameEqualTo(name);
        List<Community> communities = communityExtendMapper.selectByExample(example);
        if (communities==null||communities.size()==0)
            return null;
        return communities.get(0);
    }
}
