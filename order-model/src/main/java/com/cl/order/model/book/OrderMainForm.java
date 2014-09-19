package com.cl.order.model.book;

import java.math.BigDecimal;
import java.util.Date;

public class OrderMainForm {
    private String formCode;

    private Integer orderTypeId;

    private Integer memberId;

    private Integer consigneeId;

    private BigDecimal totalPrice;

    private BigDecimal goodsPrice;

    private BigDecimal deliverPrice;

    private BigDecimal paidPrice;

    private Byte paymentTypeId;

    private String paymentTypeName;

    private Byte paymentStatus;

    private Byte sourceRefId;

    private Byte sourcePosId;

    private String createPerson;

    private Date createDate;

    private String updatePerson;

    private Date updateDate;

    public String getFormCode() {
        return formCode;
    }

    public void setFormCode(String formCode) {
        this.formCode = formCode;
    }

    public Integer getOrderTypeId() {
        return orderTypeId;
    }

    public void setOrderTypeId(Integer orderTypeId) {
        this.orderTypeId = orderTypeId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getConsigneeId() {
        return consigneeId;
    }

    public void setConsigneeId(Integer consigneeId) {
        this.consigneeId = consigneeId;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public BigDecimal getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(BigDecimal goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public BigDecimal getDeliverPrice() {
        return deliverPrice;
    }

    public void setDeliverPrice(BigDecimal deliverPrice) {
        this.deliverPrice = deliverPrice;
    }

    public BigDecimal getPaidPrice() {
        return paidPrice;
    }

    public void setPaidPrice(BigDecimal paidPrice) {
        this.paidPrice = paidPrice;
    }

    public Byte getPaymentTypeId() {
        return paymentTypeId;
    }

    public void setPaymentTypeId(Byte paymentTypeId) {
        this.paymentTypeId = paymentTypeId;
    }

    public String getPaymentTypeName() {
        return paymentTypeName;
    }

    public void setPaymentTypeName(String paymentTypeName) {
        this.paymentTypeName = paymentTypeName;
    }

    public Byte getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(Byte paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Byte getSourceRefId() {
        return sourceRefId;
    }

    public void setSourceRefId(Byte sourceRefId) {
        this.sourceRefId = sourceRefId;
    }

    public Byte getSourcePosId() {
        return sourcePosId;
    }

    public void setSourcePosId(Byte sourcePosId) {
        this.sourcePosId = sourcePosId;
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