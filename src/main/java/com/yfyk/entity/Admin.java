package com.yfyk.entity;

import java.util.Date;

public class Admin {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.createDate
     *
     * @mbggenerated
     */
    private Date createdate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.modifyDate
     *
     * @mbggenerated
     */
    private Date modifydate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.department
     *
     * @mbggenerated
     */
    private String department;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.email
     *
     * @mbggenerated
     */
    private String email;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.isEnabled
     *
     * @mbggenerated
     */
    private Boolean isenabled;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.isLocked
     *
     * @mbggenerated
     */
    private Boolean islocked;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.lockedDate
     *
     * @mbggenerated
     */
    private Date lockeddate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.loginDate
     *
     * @mbggenerated
     */
    private Date logindate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.loginFailureCount
     *
     * @mbggenerated
     */
    private Integer loginfailurecount;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.loginIp
     *
     * @mbggenerated
     */
    private String loginip;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.name
     *
     * @mbggenerated
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.password
     *
     * @mbggenerated
     */
    private String password;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.username
     *
     * @mbggenerated
     */
    private String username;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_admin.check_city_id
     *
     * @mbggenerated
     */
    private Integer checkCityId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.id
     *
     * @return the value of t_admin.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.id
     *
     * @param id the value for t_admin.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.createDate
     *
     * @return the value of t_admin.createDate
     *
     * @mbggenerated
     */
    public Date getCreatedate() {
        return createdate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.createDate
     *
     * @param createdate the value for t_admin.createDate
     *
     * @mbggenerated
     */
    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.modifyDate
     *
     * @return the value of t_admin.modifyDate
     *
     * @mbggenerated
     */
    public Date getModifydate() {
        return modifydate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.modifyDate
     *
     * @param modifydate the value for t_admin.modifyDate
     *
     * @mbggenerated
     */
    public void setModifydate(Date modifydate) {
        this.modifydate = modifydate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.department
     *
     * @return the value of t_admin.department
     *
     * @mbggenerated
     */
    public String getDepartment() {
        return department;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.department
     *
     * @param department the value for t_admin.department
     *
     * @mbggenerated
     */
    public void setDepartment(String department) {
        this.department = department == null ? null : department.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.email
     *
     * @return the value of t_admin.email
     *
     * @mbggenerated
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.email
     *
     * @param email the value for t_admin.email
     *
     * @mbggenerated
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.isEnabled
     *
     * @return the value of t_admin.isEnabled
     *
     * @mbggenerated
     */
    public Boolean getIsenabled() {
        return isenabled;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.isEnabled
     *
     * @param isenabled the value for t_admin.isEnabled
     *
     * @mbggenerated
     */
    public void setIsenabled(Boolean isenabled) {
        this.isenabled = isenabled;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.isLocked
     *
     * @return the value of t_admin.isLocked
     *
     * @mbggenerated
     */
    public Boolean getIslocked() {
        return islocked;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.isLocked
     *
     * @param islocked the value for t_admin.isLocked
     *
     * @mbggenerated
     */
    public void setIslocked(Boolean islocked) {
        this.islocked = islocked;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.lockedDate
     *
     * @return the value of t_admin.lockedDate
     *
     * @mbggenerated
     */
    public Date getLockeddate() {
        return lockeddate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.lockedDate
     *
     * @param lockeddate the value for t_admin.lockedDate
     *
     * @mbggenerated
     */
    public void setLockeddate(Date lockeddate) {
        this.lockeddate = lockeddate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.loginDate
     *
     * @return the value of t_admin.loginDate
     *
     * @mbggenerated
     */
    public Date getLogindate() {
        return logindate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.loginDate
     *
     * @param logindate the value for t_admin.loginDate
     *
     * @mbggenerated
     */
    public void setLogindate(Date logindate) {
        this.logindate = logindate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.loginFailureCount
     *
     * @return the value of t_admin.loginFailureCount
     *
     * @mbggenerated
     */
    public Integer getLoginfailurecount() {
        return loginfailurecount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.loginFailureCount
     *
     * @param loginfailurecount the value for t_admin.loginFailureCount
     *
     * @mbggenerated
     */
    public void setLoginfailurecount(Integer loginfailurecount) {
        this.loginfailurecount = loginfailurecount;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.loginIp
     *
     * @return the value of t_admin.loginIp
     *
     * @mbggenerated
     */
    public String getLoginip() {
        return loginip;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.loginIp
     *
     * @param loginip the value for t_admin.loginIp
     *
     * @mbggenerated
     */
    public void setLoginip(String loginip) {
        this.loginip = loginip == null ? null : loginip.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.name
     *
     * @return the value of t_admin.name
     *
     * @mbggenerated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.name
     *
     * @param name the value for t_admin.name
     *
     * @mbggenerated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.password
     *
     * @return the value of t_admin.password
     *
     * @mbggenerated
     */
    public String getPassword() {
        return password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.password
     *
     * @param password the value for t_admin.password
     *
     * @mbggenerated
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.username
     *
     * @return the value of t_admin.username
     *
     * @mbggenerated
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.username
     *
     * @param username the value for t_admin.username
     *
     * @mbggenerated
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_admin.check_city_id
     *
     * @return the value of t_admin.check_city_id
     *
     * @mbggenerated
     */
    public Integer getCheckCityId() {
        return checkCityId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_admin.check_city_id
     *
     * @param checkCityId the value for t_admin.check_city_id
     *
     * @mbggenerated
     */
    public void setCheckCityId(Integer checkCityId) {
        this.checkCityId = checkCityId;
    }
}