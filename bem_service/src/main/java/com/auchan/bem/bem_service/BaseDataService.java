package com.auchan.bem.bem_service;

import java.util.List;

import com.auchan.bem.bem_pojo.entity.Area;
import com.auchan.bem.bem_pojo.entity.Division;
import com.auchan.bem.bem_pojo.entity.Section;

/**
 * 基础数据service接口
 * 
 * @date 2016-03-14
 * @author 郑冉
 *
 */
public interface BaseDataService {
	
	/**
     * 获取处
     * 
     * @return List&lt;Division&gt; 处列表
     */
	public List<Division> getDivision();
	
	/**
	 * 获取部门
	 * 
	 * @param divisionNo 处编号
	 * @return List&lt;Section&gt; 部门列表
	 */
	public List<Section> getSection(Short divisionNo);
	
	/**
	 * 获取区域及门店
	 * 
	 * @return List&lt;Area&gt; 区域列表
	 */
	public List<Area> getStore();
}
