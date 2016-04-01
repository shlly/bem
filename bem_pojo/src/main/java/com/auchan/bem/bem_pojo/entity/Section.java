package com.auchan.bem.bem_pojo.entity;

import java.util.Date;

public class Section {
    private Short sectionNo;

    private String name;

    private String enName;

    private Short deptNo;

    private Short divisionNo;

    private String usr;

    private Short status;

    private Date changedDate;

    private Short active;

    public Short getSectionNo() {
        return sectionNo;
    }

    public void setSectionNo(Short sectionNo) {
        this.sectionNo = sectionNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getEnName() {
        return enName;
    }

    public void setEnName(String enName) {
        this.enName = enName == null ? null : enName.trim();
    }

    public Short getDeptNo() {
        return deptNo;
    }

    public void setDeptNo(Short deptNo) {
        this.deptNo = deptNo;
    }

    public Short getDivisionNo() {
        return divisionNo;
    }

    public void setDivisionNo(Short divisionNo) {
        this.divisionNo = divisionNo;
    }

    public String getUsr() {
        return usr;
    }

    public void setUsr(String usr) {
        this.usr = usr == null ? null : usr.trim();
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Date getChangedDate() {
        return changedDate;
    }

    public void setChangedDate(Date changedDate) {
        this.changedDate = changedDate;
    }

    public Short getActive() {
        return active;
    }

    public void setActive(Short active) {
        this.active = active;
    }
}