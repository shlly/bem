package com.auchan.bem.bem_pojo.entity;

import java.util.List;

public class Division {
    private Short divisionNo;

    private String name;

    private String enName;

    private String emailName;
    
    private List<Section> sections;

    public Short getDivisionNo() {
        return divisionNo;
    }

    public void setDivisionNo(Short divisionNo) {
        this.divisionNo = divisionNo;
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

    public String getEmailName() {
        return emailName;
    }

    public void setEmailName(String emailName) {
        this.emailName = emailName == null ? null : emailName.trim();
    }

	public List<Section> getSections() {
		return sections;
	}

	public void setSections(List<Section> sections) {
		this.sections = sections;
	}
}