package com.auchan.bem.bem_web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.auchan.bem.bem_service.BaseDataService;

import net.sf.json.JSONArray;

/**
 * 基础数据查询controller
 * 
 * @url /base
 * @date 2016-03-14
 * @author 郑冉
 *
 */
@Controller  
@RequestMapping("base")
public class BaseDataController {
	
	@Resource
	BaseDataService baseDataService;
	
	/**
	 * 获取处
	 * 
	 * @url /base/getDivisions
	 * @method get/post
	 * @return json 处列表
	 * @date 2016-03-03
	 */
	@RequestMapping("getDivisions")
	@ResponseBody
	public String getDivisions() {
		return JSONArray.fromObject(baseDataService.getDivision()).toString();
	}
	
	/**
	 * 获取部门
	 * 
	 * @param divisionNo 处编号
	 * @url /base/getSections
	 * @method get/post
	 * @return json 部门列表
	 * @date 2016-03-03
	 */
	@RequestMapping("getSections")
	@ResponseBody
	public String getSections(Short divisionNo) {
		return JSONArray.fromObject(baseDataService.getSection(divisionNo)).toString();
	}
	
	/**
	 * 获取门店
	 * 
	 * @url /base/getStores
	 * @method get/post
	 * @return json 门店列表
	 * @date 2016-03-14
	 */
	@RequestMapping("getStores")
	@ResponseBody
	public String getStores() {
		return JSONArray.fromObject(baseDataService.getStore()).toString();
	}
}
