package com.cl.order.model.aftersales;

import java.util.Date;

public class AcceptLog {
    private Integer id;

    private String acceptCode;

    private Byte logTypeId;

    private String logContent;

    private String createPerson;

    private Date createDate;

    private String createIp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAcceptCode() {
        return acceptCode;
    }

    public void setAcceptCode(String acceptCode) {
        this.acceptCode = acceptCode;
    }

    public Byte getLogTypeId() {
        return logTypeId;
    }

    public void setLogTypeId(Byte logTypeId) {
        this.logTypeId = logTypeId;
    }

    public String getLogContent() {
        return logContent;
    }

    public void setLogContent(String logContent) {
        this.logContent = logContent;
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

    public String getCreateIp() {
        return createIp;
    }

    public void setCreateIp(String createIp) {
        this.createIp = createIp;
    }
}