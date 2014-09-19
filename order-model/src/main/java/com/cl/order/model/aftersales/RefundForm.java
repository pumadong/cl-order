package com.cl.order.model.aftersales;

import java.math.BigDecimal;
import java.util.Date;

public class RefundForm {
    private String refundCode;

    private String formCode;

    private String returnCode;

    private Integer memberId;

    private Byte refundTypeId;

    private Byte paymentTypeId;

    private BigDecimal refundMoney;

    private Byte status;

    private String createPerson;

    private Date createDate;

    private String updatePerson;

    private Date updateDate;

    public String getRefundCode() {
        return refundCode;
    }

    public void setRefundCode(String refundCode) {
        this.refundCode = refundCode;
    }

    public String getFormCode() {
        return formCode;
    }

    public void setFormCode(String formCode) {
        this.formCode = formCode;
    }

    public String getReturnCode() {
        return returnCode;
    }

    public void setReturnCode(String returnCode) {
        this.returnCode = returnCode;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Byte getRefundTypeId() {
        return refundTypeId;
    }

    public void setRefundTypeId(Byte refundTypeId) {
        this.refundTypeId = refundTypeId;
    }

    public Byte getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(Byte paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
    }

    public BigDecimal getRefundMoney() {
        return refundMoney;
    }

    public void setRefundMoney(BigDecimal refundMoney) {
        this.refundMoney = refundMoney;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public String getCreatePerson() {
        return createPerson;
    }

    public void setCreatePerson(String createPerson) {
        this.createPerson = createPerson;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdatePerson() {
        return updatePerson;
    }

    public void setUpdatePerson(String updatePerson) {
        this.updatePerson = updatePerson;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}