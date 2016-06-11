package com.yfyk.service;

import com.yfyk.entity.Admin;

import java.util.List;

/**
 * Created by yanfeng on 16/6/10.
 */
public interface AdminService {

    Admin findByUsername(String username);

    List<String> findAuthorities(long id);

    int update(Admin admin);
}
