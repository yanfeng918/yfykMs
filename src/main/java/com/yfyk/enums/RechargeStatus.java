package com.yfyk.enums;

/**
 * Created by yanfeng on 2016/6/13.
 */
public enum RechargeStatus {

    APPLY("待审核",1),CHECKING("审核中",2),SUCCESS("成功",3),FAIL("失败",4);
    private String outername;
    private int value;
    private RechargeStatus(String outername,int value){
        this.outername = outername;
        this.value = value;
    }
    public String getOutername() {
        return outername;
    }
    public int getValue() {
        return value;
    }
}
