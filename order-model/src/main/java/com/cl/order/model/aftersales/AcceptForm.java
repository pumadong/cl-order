package com.cl.order.model.aftersales;

import java.math.BigDecimal;
import java.util.Date;

public class AcceptForm {
    private String acceptCode;

    private String formCode;

    private Byte returnTypeId;

    private Integer consigneeId;

    private BigDecimal returnMoney;

    private BigDecimal exchangeMoney;

    private Integer warehouseId;

    private String warehouseName;

    private String exchangeFormCode;

    private Byte reasonId;

    private String reasonName;

    private Byte status;

    private String createPerson;

    private Date createDate;

    private String updatePerson;

    private Date updateDate;

    public String getAcceptCode() {
        return acceptCode;
    }

    public void setAcceptCode(String acceptCode) {
        this.acceptCode = acceptCode;
    }

    public String getFormCode() {
        return formCode;
    }

    public void setFormCode(String formCode) {
        this.formCode = formCode;
    }

    public Byte getReturnTypeId() {
        return returnTypeId;
    }

    public void setReturnTypeId(Byte returnTypeId) {
        this.returnTypeId = returnTypeId;
    }

    public Integer getConsigneeId() {
        return consigneeId;
    }

    public void setConsigneeId(Integer consigneeId) {
        this.consigneeId = consigneeId;
    }

    public BigDecimal getReturnMoney() {
        return returnMoney;
    }

    public void setReturnMoney(BigDecimal returnMoney) {
        this.returnMoney = returnMoney;
    }

    public BigDecimal getExchangeMoney() {
        return exchangeMoney;
    }

    public void setExchangeMoney(BigDecimal exchangeMoney) {
        this.exchangeMoney = exchangeMoney;
    }

    public Integer getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Integer warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }

    public String getExchangeFormCode() {
        return exchangeFormCode;
    }

    public void setExchangeFormCode(String exchangeFormCode) {
        this.exchangeFormCode = exchangeFormCode;
    }

    public Byte getReasonId() {
        return reasonId;
    }

    public void setReasonId(Byte reasonId) {
        this.reasonId = reasonId;
    }

    public String getReasonName() {
        return reasonName;
    }

    public void setReasonName(String reasonName) {
        this.reasonName = reasonName;
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