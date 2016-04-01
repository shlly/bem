package com.auchan.bem.bem_pojo.entity;

import java.util.Date;

public class Qaccessory {
	private Integer aid;
	private Integer ttitleno;
	private String aname;
	private Directory directory;
	private String ldapid;
	private Date createDate;
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public Integer getTtitleno() {
		return ttitleno;
	}
	public void setTtitleno(Integer ttitleno) {
		this.ttitleno = ttitleno;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public Directory getDirectory() {
		return directory;
	}
	public void setDirectory(Directory directory) {
		this.directory = directory;
	}
	public String getLdapid() {
		return ldapid;
	}
	public void setLdapid(String ldapid) {
		this.ldapid = ldapid;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}