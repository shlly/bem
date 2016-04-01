package com.auchan.bem.bem_pojo.entity;

import java.math.BigDecimal;

public class NegQuestions {
	private Integer nid;
	private Integer q_no;
	private Integer itemNo;
	private Integer supNo;
	private String  itemName;
	private String supName;
	private BigDecimal price;
	private Integer storeNo1;
	private BigDecimal price1;
	private BigDecimal price2;
	private Integer  storeNo2;
	private String competitor;
	private BigDecimal w3price;
	private BigDecimal w2price;
	private BigDecimal w1price;
	private BigDecimal w0price;
	private String urgent;
	private Store store;
	private Section section;
	private Division division;
	
	
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
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
	}
	public Integer getNid() {
		return nid;
	}
	public void setNid(Integer nid) {
		this.nid = nid;
	}
	public Integer getQ_no() {
		return q_no;
	}
	public void setQ_no(Integer q_no) {
		this.q_no = q_no;
	}
	public Integer getItemNo() {
		return itemNo;
	}
	public void setItemNo(Integer itemNo) {
		this.itemNo = itemNo;
	}
	public Integer getSupNo() {
		return supNo;
	}
	public void setSupNo(Integer supNo) {
		this.supNo = supNo;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Integer getStoreNo1() {
		return storeNo1;
	}
	public void setStoreNo1(Integer storeNo1) {
		this.storeNo1 = storeNo1;
	}
	public BigDecimal getPrice1() {
		return price1;
	}
	public void setPrice1(BigDecimal price1) {
		this.price1 = price1;
	}
	public BigDecimal getPrice2() {
		return price2;
	}
	public void setPrice2(BigDecimal price2) {
		this.price2 = price2;
	}
	public Integer getStoreNo2() {
		return storeNo2;
	}
	public void setStoreNo2(Integer storeNo2) {
		this.storeNo2 = storeNo2;
	}
	public String getCompetitor() {
		return competitor;
	}
	public void setCompetitor(String competitor) {
		this.competitor = competitor;
	}
	public BigDecimal getW3price() {
		return w3price;
	}
	public void setW3price(BigDecimal w3price) {
		this.w3price = w3price;
	}
	public BigDecimal getW2price() {
		return w2price;
	}
	public void setW2price(BigDecimal w2price) {
		this.w2price = w2price;
	}
	public BigDecimal getW1price() {
		return w1price;
	}
	public void setW1price(BigDecimal w1price) {
		this.w1price = w1price;
	}
	public BigDecimal getW0price() {
		return w0price;
	}
	public void setW0price(BigDecimal w0price) {
		this.w0price = w0price;
	}
	public String getUrgent() {
		return urgent;
	}
	public void setUrgent(String urgent) {
		this.urgent = urgent;
	}
	
	
}
