package com.yfyk.entity;

public class Agent {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_agent.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_agent.mobile
     *
     * @mbggenerated
     */
    private String mobile;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_agent.id
     *
     * @return the value of t_agent.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_agent.id
     *
     * @param id the value for t_agent.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_agent.mobile
     *
     * @return the value of t_agent.mobile
     *
     * @mbggenerated
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_agent.mobile
     *
     * @param mobile the value for t_agent.mobile
     *
     * @mbggenerated
     */
    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }
}