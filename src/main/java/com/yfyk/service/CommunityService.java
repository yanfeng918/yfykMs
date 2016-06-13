package com.yfyk.service;

import com.yfyk.entity.Community;

/**
 * Created by yanfeng on 2016/6/13.
 */
public interface CommunityService {

    Community findByName(String name);

}
