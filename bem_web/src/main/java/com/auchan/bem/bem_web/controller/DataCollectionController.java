package com.auchan.bem.bem_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 数据收集controller
 * @url /
 * @date 2016-02-26
 * @author 林亮亮
 */
@Controller  
@RequestMapping("data_collection")
public class DataCollectionController {

	/**
	 * 跳转至data collection主页
	 * 
	 * @url /
	 * @method get/post
	 * @return 
	 * @date 2016-03-31
	 * @author 林亮亮
	 */
	@RequestMapping("")
	public String  forum(ModelMap model,Short org_no){
		model.addAttribute("pageTitle", "数据收集");
		model.addAttribute("breadcrumbs", new String[][] {{"data collection"}});
		model.addAttribute("leftbar", "7");
		return "dataCollection/index";
	}
	
	

}