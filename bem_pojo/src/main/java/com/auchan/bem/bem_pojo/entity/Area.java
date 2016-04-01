package com.auchan.bem.bem_pojo.entity;

import java.util.List;

public class Area {
    private String areaNo;

    private String areaName;

    private String parentNo;

    private String status;

    private String leaves;
    
    private List<Area> childArea;
    
    private List<Store> stores;

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

    public String getParentNo() {
        return parentNo;
    }

    public void setParentNo(String parentNo) {
        this.parentNo = parentNo == null ? null : parentNo.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getLeaves() {
        return leaves;
    }

    public void setLeaves(String leaves) {
        this.leaves = leaves == null ? null : leaves.trim();
    }

	public List<Area> getChildArea() {
		return childArea;
	}

	public void setChildArea(List<Area> childArea) {
		this.childArea = childArea;
	}

	public List<Store> getStores() {
		return stores;
	}

	public void setStores(List<Store> stores) {
		this.stores = stores;
	}
}