package com.yfyk.service.impl;

import com.yfyk.dao.mbg.AdminMapper;
import com.yfyk.entity.Admin;
import com.yfyk.entity.AdminExample;
import com.yfyk.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yanfeng on 16/6/10.
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin findByUsername(String username) {
        AdminExample example = new AdminExample();
        example.or().andUsernameEqualTo(username);
        List<Admin> admins = adminMapper.selectByExample(example);
        return admins.get(0);
    }

    @Override
    public List<String> findAuthorities(long id) {


        return null;
    }

    @Override
    public int update(Admin admin) {
        return adminMapper.updateByPrimaryKeySelective(admin);
    }
}
