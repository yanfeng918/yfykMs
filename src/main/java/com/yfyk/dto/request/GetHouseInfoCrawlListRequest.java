package com.yfyk.dto.request;

/**
 * Created by yanfeng on 16/6/11.
 */
public class GetHouseInfoCrawlListRequest {

    private String mobile;

    private String community;

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getCommunity() {
        return community;
    }

    public void setCommunity(String community) {
        this.community = community;
    }
}
