package com.yfyk.common.dto;

import java.util.List;

/**
 * Created by yanfeng on 2016/6/12.
 */
public class BasePagerRequestDto {

    // 排序方式
    public enum OrderType{
        asc, desc
    }

    public static final Integer MAX_PAGE_SIZE = 500;// 每页最大记录数限制

    private Integer pageNumber = 1;// 当前页码
    private Integer pageOffset = 0;//
    private Integer pageSize = 20;// 每页记录数

    private String property;// 查找属性名称
    private String keyword;// 查找关键字
    private String sort = "createDate";// 排序字段
    private String order = "desc";// 排序方式


    public void webParamConvert() {
        if (pageOffset==0){
            if (pageSize != null && pageNumber != null) {
                pageOffset = pageSize * (pageNumber - 1);
            }
        }
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        if (pageNumber < 1) {
            pageNumber = 1;
        }
        this.pageNumber = pageNumber;
    }

    public Integer getPageOffset() {
        return pageOffset;
    }

    public void setPageOffset(Integer pageOffset) {
        this.pageOffset = pageOffset;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }


    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public void setPageSize(Integer pageSize) {
        if (pageSize < 1) {
            pageSize = 1;
        } else if(pageSize > MAX_PAGE_SIZE) {
            pageSize = MAX_PAGE_SIZE;
        }
        this.pageSize = pageSize;
    }
}
