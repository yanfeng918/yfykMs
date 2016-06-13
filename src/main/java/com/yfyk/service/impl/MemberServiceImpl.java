package com.yfyk.service.impl;

import com.yfyk.dao.extend.MemberExtendMapper;
import com.yfyk.entity.Member;
import com.yfyk.entity.MemberExample;
import com.yfyk.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by yanfeng on 2016/6/13.
 */
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberExtendMapper memberExtendMapper;

    @Override
    public void addBalance(float amount,long memberId) {
        MemberExample example = new MemberExample();
        example.or().andIdEqualTo((int)memberId);
        Member member = new Member();
        member.setBalance(member.getBalance()+amount);
        memberExtendMapper.updateByExampleSelective(member, example);
    }

    @Override
    public void minusBalance(float amount, long memberId) {
        amount = 0-amount;
        addBalance(amount,memberId);
    }
}
