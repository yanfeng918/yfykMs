package com.yfyk.service;

/**
 * Created by yanfeng on 2016/6/13.
 */
public interface AgentService {
    /**
     * 通过手机号码判断是否是经纪人号码
     * @param mobile
     * @return
     */
    boolean isAgent(String mobile);
}
