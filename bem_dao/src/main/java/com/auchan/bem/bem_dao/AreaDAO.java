package com.auchan.bem.bem_dao;

import java.util.List;

import com.auchan.bem.bem_pojo.entity.Area;

/**
 * 区域类对应dao方法
 * 
 * @date 2016-03-22
 * @author 郑冉
 *
 */
public interface AreaDAO {
	
	/**
	 * 获取区域以及门店信息
	 * 
	 * @return List&lt;Area&gt; 区域列表
	 * @date 2016-03-22
	 */
    List<Area> selectAll();
}