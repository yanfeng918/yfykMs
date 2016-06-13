package com.yfyk.service.impl;

import com.yfyk.dao.extend.AgentExtendMapper;
import com.yfyk.entity.Agent;
import com.yfyk.entity.AgentExample;
import com.yfyk.service.AgentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yanfeng on 2016/6/13.
 */

@Service
public class AgentServiceImpl implements AgentService {

    @Autowired
    private AgentExtendMapper agentExtendMapper;
    @Override
    public boolean isAgent(String mobile) {
        if (StringUtils.isNotEmpty(mobile)){
            AgentExample example = new AgentExample();
            example.or().andMobileEqualTo(mobile);
            List<Agent> agents = agentExtendMapper.selectByExample(example);
            if (agents==null || agents.size()==0)
                return false;
            return true;
        }
        return false;
    }
}
