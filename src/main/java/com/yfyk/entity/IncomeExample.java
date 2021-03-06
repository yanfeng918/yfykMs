package com.yfyk.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class IncomeExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table t_income
     *
     * @mbggenerated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table t_income
     *
     * @mbggenerated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table t_income
     *
     * @mbggenerated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_income
     *
     * @mbggenerated
     */
    public IncomeExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_income
     *
     * @mbggenerated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_income
     *
     * @mbggenerated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_income
     *
     * @mbggenerated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_income
     *
     * @mbggenerated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_income
     *
     * @mbggenerated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_income
     *
     * @mbggenerated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_income
     *
     * @mbggenerated
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_income
     *
     * @mbggenerated
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_income
     *
     * @mbggenerated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_income
     *
     * @mbggenerated
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table t_income
     *
     * @mbggenerated
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andCreatedateIsNull() {
            addCriterion("createDate is null");
            return (Criteria) this;
        }

        public Criteria andCreatedateIsNotNull() {
            addCriterion("createDate is not null");
            return (Criteria) this;
        }

        public Criteria andCreatedateEqualTo(Date value) {
            addCriterion("createDate =", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateNotEqualTo(Date value) {
            addCriterion("createDate <>", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateGreaterThan(Date value) {
            addCriterion("createDate >", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateGreaterThanOrEqualTo(Date value) {
            addCriterion("createDate >=", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateLessThan(Date value) {
            addCriterion("createDate <", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateLessThanOrEqualTo(Date value) {
            addCriterion("createDate <=", value, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateIn(List<Date> values) {
            addCriterion("createDate in", values, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateNotIn(List<Date> values) {
            addCriterion("createDate not in", values, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateBetween(Date value1, Date value2) {
            addCriterion("createDate between", value1, value2, "createdate");
            return (Criteria) this;
        }

        public Criteria andCreatedateNotBetween(Date value1, Date value2) {
            addCriterion("createDate not between", value1, value2, "createdate");
            return (Criteria) this;
        }

        public Criteria andModifydateIsNull() {
            addCriterion("modifyDate is null");
            return (Criteria) this;
        }

        public Criteria andModifydateIsNotNull() {
            addCriterion("modifyDate is not null");
            return (Criteria) this;
        }

        public Criteria andModifydateEqualTo(Date value) {
            addCriterion("modifyDate =", value, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateNotEqualTo(Date value) {
            addCriterion("modifyDate <>", value, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateGreaterThan(Date value) {
            addCriterion("modifyDate >", value, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateGreaterThanOrEqualTo(Date value) {
            addCriterion("modifyDate >=", value, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateLessThan(Date value) {
            addCriterion("modifyDate <", value, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateLessThanOrEqualTo(Date value) {
            addCriterion("modifyDate <=", value, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateIn(List<Date> values) {
            addCriterion("modifyDate in", values, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateNotIn(List<Date> values) {
            addCriterion("modifyDate not in", values, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateBetween(Date value1, Date value2) {
            addCriterion("modifyDate between", value1, value2, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateNotBetween(Date value1, Date value2) {
            addCriterion("modifyDate not between", value1, value2, "modifydate");
            return (Criteria) this;
        }

        public Criteria andAmountIsNull() {
            addCriterion("amount is null");
            return (Criteria) this;
        }

        public Criteria andAmountIsNotNull() {
            addCriterion("amount is not null");
            return (Criteria) this;
        }

        public Criteria andAmountEqualTo(Float value) {
            addCriterion("amount =", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotEqualTo(Float value) {
            addCriterion("amount <>", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountGreaterThan(Float value) {
            addCriterion("amount >", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountGreaterThanOrEqualTo(Float value) {
            addCriterion("amount >=", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountLessThan(Float value) {
            addCriterion("amount <", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountLessThanOrEqualTo(Float value) {
            addCriterion("amount <=", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountIn(List<Float> values) {
            addCriterion("amount in", values, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotIn(List<Float> values) {
            addCriterion("amount not in", values, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountBetween(Float value1, Float value2) {
            addCriterion("amount between", value1, value2, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotBetween(Float value1, Float value2) {
            addCriterion("amount not between", value1, value2, "amount");
            return (Criteria) this;
        }

        public Criteria andMemberIdIsNull() {
            addCriterion("member_id is null");
            return (Criteria) this;
        }

        public Criteria andMemberIdIsNotNull() {
            addCriterion("member_id is not null");
            return (Criteria) this;
        }

        public Criteria andMemberIdEqualTo(Integer value) {
            addCriterion("member_id =", value, "memberId");
            return (Criteria) this;
        }

        public Criteria andMemberIdNotEqualTo(Integer value) {
            addCriterion("member_id <>", value, "memberId");
            return (Criteria) this;
        }

        public Criteria andMemberIdGreaterThan(Integer value) {
            addCriterion("member_id >", value, "memberId");
            return (Criteria) this;
        }

        public Criteria andMemberIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("member_id >=", value, "memberId");
            return (Criteria) this;
        }

        public Criteria andMemberIdLessThan(Integer value) {
            addCriterion("member_id <", value, "memberId");
            return (Criteria) this;
        }

        public Criteria andMemberIdLessThanOrEqualTo(Integer value) {
            addCriterion("member_id <=", value, "memberId");
            return (Criteria) this;
        }

        public Criteria andMemberIdIn(List<Integer> values) {
            addCriterion("member_id in", values, "memberId");
            return (Criteria) this;
        }

        public Criteria andMemberIdNotIn(List<Integer> values) {
            addCriterion("member_id not in", values, "memberId");
            return (Criteria) this;
        }

        public Criteria andMemberIdBetween(Integer value1, Integer value2) {
            addCriterion("member_id between", value1, value2, "memberId");
            return (Criteria) this;
        }

        public Criteria andMemberIdNotBetween(Integer value1, Integer value2) {
            addCriterion("member_id not between", value1, value2, "memberId");
            return (Criteria) this;
        }

        public Criteria andIncomefromIsNull() {
            addCriterion("incomeFrom is null");
            return (Criteria) this;
        }

        public Criteria andIncomefromIsNotNull() {
            addCriterion("incomeFrom is not null");
            return (Criteria) this;
        }

        public Criteria andIncomefromEqualTo(Integer value) {
            addCriterion("incomeFrom =", value, "incomefrom");
            return (Criteria) this;
        }

        public Criteria andIncomefromNotEqualTo(Integer value) {
            addCriterion("incomeFrom <>", value, "incomefrom");
            return (Criteria) this;
        }

        public Criteria andIncomefromGreaterThan(Integer value) {
            addCriterion("incomeFrom >", value, "incomefrom");
            return (Criteria) this;
        }

        public Criteria andIncomefromGreaterThanOrEqualTo(Integer value) {
            addCriterion("incomeFrom >=", value, "incomefrom");
            return (Criteria) this;
        }

        public Criteria andIncomefromLessThan(Integer value) {
            addCriterion("incomeFrom <", value, "incomefrom");
            return (Criteria) this;
        }

        public Criteria andIncomefromLessThanOrEqualTo(Integer value) {
            addCriterion("incomeFrom <=", value, "incomefrom");
            return (Criteria) this;
        }

        public Criteria andIncomefromIn(List<Integer> values) {
            addCriterion("incomeFrom in", values, "incomefrom");
            return (Criteria) this;
        }

        public Criteria andIncomefromNotIn(List<Integer> values) {
            addCriterion("incomeFrom not in", values, "incomefrom");
            return (Criteria) this;
        }

        public Criteria andIncomefromBetween(Integer value1, Integer value2) {
            addCriterion("incomeFrom between", value1, value2, "incomefrom");
            return (Criteria) this;
        }

        public Criteria andIncomefromNotBetween(Integer value1, Integer value2) {
            addCriterion("incomeFrom not between", value1, value2, "incomefrom");
            return (Criteria) this;
        }

        public Criteria andHouseinfoIdIsNull() {
            addCriterion("houseInfo_id is null");
            return (Criteria) this;
        }

        public Criteria andHouseinfoIdIsNotNull() {
            addCriterion("houseInfo_id is not null");
            return (Criteria) this;
        }

        public Criteria andHouseinfoIdEqualTo(Integer value) {
            addCriterion("houseInfo_id =", value, "houseinfoId");
            return (Criteria) this;
        }

        public Criteria andHouseinfoIdNotEqualTo(Integer value) {
            addCriterion("houseInfo_id <>", value, "houseinfoId");
            return (Criteria) this;
        }

        public Criteria andHouseinfoIdGreaterThan(Integer value) {
            addCriterion("houseInfo_id >", value, "houseinfoId");
            return (Criteria) this;
        }

        public Criteria andHouseinfoIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("houseInfo_id >=", value, "houseinfoId");
            return (Criteria) this;
        }

        public Criteria andHouseinfoIdLessThan(Integer value) {
            addCriterion("houseInfo_id <", value, "houseinfoId");
            return (Criteria) this;
        }

        public Criteria andHouseinfoIdLessThanOrEqualTo(Integer value) {
            addCriterion("houseInfo_id <=", value, "houseinfoId");
            return (Criteria) this;
        }

        public Criteria andHouseinfoIdIn(List<Integer> values) {
            addCriterion("houseInfo_id in", values, "houseinfoId");
            return (Criteria) this;
        }

        public Criteria andHouseinfoIdNotIn(List<Integer> values) {
            addCriterion("houseInfo_id not in", values, "houseinfoId");
            return (Criteria) this;
        }

        public Criteria andHouseinfoIdBetween(Integer value1, Integer value2) {
            addCriterion("houseInfo_id between", value1, value2, "houseinfoId");
            return (Criteria) this;
        }

        public Criteria andHouseinfoIdNotBetween(Integer value1, Integer value2) {
            addCriterion("houseInfo_id not between", value1, value2, "houseinfoId");
            return (Criteria) this;
        }

        public Criteria andIncometypeIsNull() {
            addCriterion("incomeType is null");
            return (Criteria) this;
        }

        public Criteria andIncometypeIsNotNull() {
            addCriterion("incomeType is not null");
            return (Criteria) this;
        }

        public Criteria andIncometypeEqualTo(String value) {
            addCriterion("incomeType =", value, "incometype");
            return (Criteria) this;
        }

        public Criteria andIncometypeNotEqualTo(String value) {
            addCriterion("incomeType <>", value, "incometype");
            return (Criteria) this;
        }

        public Criteria andIncometypeGreaterThan(String value) {
            addCriterion("incomeType >", value, "incometype");
            return (Criteria) this;
        }

        public Criteria andIncometypeGreaterThanOrEqualTo(String value) {
            addCriterion("incomeType >=", value, "incometype");
            return (Criteria) this;
        }

        public Criteria andIncometypeLessThan(String value) {
            addCriterion("incomeType <", value, "incometype");
            return (Criteria) this;
        }

        public Criteria andIncometypeLessThanOrEqualTo(String value) {
            addCriterion("incomeType <=", value, "incometype");
            return (Criteria) this;
        }

        public Criteria andIncometypeLike(String value) {
            addCriterion("incomeType like", value, "incometype");
            return (Criteria) this;
        }

        public Criteria andIncometypeNotLike(String value) {
            addCriterion("incomeType not like", value, "incometype");
            return (Criteria) this;
        }

        public Criteria andIncometypeIn(List<String> values) {
            addCriterion("incomeType in", values, "incometype");
            return (Criteria) this;
        }

        public Criteria andIncometypeNotIn(List<String> values) {
            addCriterion("incomeType not in", values, "incometype");
            return (Criteria) this;
        }

        public Criteria andIncometypeBetween(String value1, String value2) {
            addCriterion("incomeType between", value1, value2, "incometype");
            return (Criteria) this;
        }

        public Criteria andIncometypeNotBetween(String value1, String value2) {
            addCriterion("incomeType not between", value1, value2, "incometype");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table t_income
     *
     * @mbggenerated do_not_delete_during_merge
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table t_income
     *
     * @mbggenerated
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}