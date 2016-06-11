package com.yfyk.dto;

/**
 * Created by fddxiaohui on 2015/8/18.
 */
public class BaseDto {
    /**开始时间**/
    private String beginDate;
    /**结束时间**/
    private String endDate;
    /**会员id**/
    private long memberId;
    /**分页的页码大小**/
    private int pageSize;
    /**分页的偏移量 pageSize*(pageNun-1) **/
    private int pageOffset;
    /**页码**/
    private int pageNumber;
    /**排序字段**/
    private String sort;
    /**排序升降序**/
    private String order;

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public long getMemberId() {
        return memberId;
    }

    public void setMemberId(long memberId) {
        this.memberId = memberId;
    }

    public String getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageOffset() {
		return pageOffset;
	}

	public void setPageOffset(int pageOffset) {
		this.pageOffset = pageOffset;
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
    
}
