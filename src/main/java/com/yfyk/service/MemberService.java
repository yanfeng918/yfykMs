package com.yfyk.service;

import com.yfyk.entity.Admin;

import java.util.List;

/**
 * Created by yanfeng on 16/6/10.
 */
public interface MemberService {

    void addBalance(float amount,long memberId) ;

    void minusBalance(float amount, long memberId) ;
}
