package com.yfyk.common.entity;

import org.springframework.format.annotation.DateTimeFormat;


import javax.validation.groups.Default;
import java.io.Serializable;
import java.util.Date;

/**
 * 实体类 - 基类
 */

public class BaseEntity implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long id;// ID
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createDate;// 创建日期
	//@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date modifyDate;// 修改日期
	
	
	/**
	 * 保存验证组
	 */
	public interface Save extends Default {

	}


	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}


	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


}