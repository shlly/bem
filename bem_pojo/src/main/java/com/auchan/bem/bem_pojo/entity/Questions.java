package com.auchan.bem.bem_pojo.entity;

import java.util.Date;

public class Questions {
	private Integer q_no;
	private String title;
	private String ldapid;
	private Date cdate;
	private String content;
	private Integer org_no;
	private Integer status;
	private Integer divisionNo;
	private Integer sectionNo;
	private Qreply qreply;
	private Section section;
	private Division division;
	
	public Integer getQ_no() {
		return q_no;
	}
	public void setQ_no(Integer q_no) {
		this.q_no = q_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLdapid() {
		return ldapid;
	}
	public void setLdapid(String ldapid) {
		this.ldapid = ldapid;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getOrg_no() {
		return org_no;
	}
	public void setOrg_no(Integer org_no) {
		this.org_no = org_no;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getDivisionNo() {
		return divisionNo;
	}
	public void setDivisionNo(Integer divisionNo) {
		this.divisionNo = divisionNo;
	}
	public Integer getSectionNo() {
		return sectionNo;
	}
	public void setSectionNo(Integer sectionNo) {
		this.sectionNo = sectionNo;
	}
	public Qreply getQreply() {
		return qreply;
	}
	public void setQreply(Qreply qreply) {
		this.qreply = qreply;
	}
	public Section getSection() {
		return section;
	}
	public void setSection(Section section) {
		this.section = section;
	}
	public Division getDivision() {
		return division;
	}
	public void setDivision(Division division) {
		this.division = division;
	}
	
}
