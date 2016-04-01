package com.auchan.bem.bem_pojo.entity;

import java.util.Date;

public class Qreply {
	private Integer  rid;
	private Integer ttitleno;
	private String content;
	private String ldapid;
	private Date createDate;
	public Integer getId() {
		return rid;
	}
	public void setId(Integer id) {
		this.rid = id;
	}
	public Integer getTtitleno() {
		return ttitleno;
	}
	public void setTtitleno(Integer ttitleno) {
		this.ttitleno = ttitleno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
