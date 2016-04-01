package com.auchan.bem.bem_pojo.entity;

public class Store {
    private Short storeNo;

    private String name;

    private Short status;

    private String guiAddress;

    private Integer postNo;

    private String phoneNo;

    private String faxNo;

    private String areaNo;

    private String areaName;

    public Short getStoreNo() {
        return storeNo;
    }

    public void setStoreNo(Short storeNo) {
        this.storeNo = storeNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public String getGuiAddress() {
        return guiAddress;
    }

    public void setGuiAddress(String guiAddress) {
        this.guiAddress = guiAddress == null ? null : guiAddress.trim();
    }

    public Integer getPostNo() {
        return postNo;
    }

    public void setPostNo(Integer postNo) {
        this.postNo = postNo;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo == null ? null : phoneNo.trim();
    }

    public String getFaxNo() {
        return faxNo;
    }

    public void setFaxNo(String faxNo) {
        this.faxNo = faxNo == null ? null : faxNo.trim();
    }

    public String getAreaNo() {
        return areaNo;
    }

    public void setAreaNo(String areaNo) {
        this.areaNo = areaNo == null ? null : areaNo.trim();
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName == null ? null : areaName.trim();
    }
}