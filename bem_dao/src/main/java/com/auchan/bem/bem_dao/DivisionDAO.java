package com.auchan.bem.bem_dao;

import java.util.List;

import com.auchan.bem.bem_pojo.entity.Division;
import com.auchan.bem.bem_pojo.entity.Section;

/**
 * 处类/部门类对应dao方法
 * 
 * @date 2016-03-03
 * @author 郑冉
 *
 */
public interface DivisionDAO {
    
    /**
	 * 通过处编号获取处
	 * 
	 * @param divisionNo 处编号
	 * @return Division 处类
	 */
    public Division selectDivisionByPrimaryKey(Short divisionNo);
    
    /**
     * 获取所有处
     * 
     * @return List&lt;Division&gt; 处列表
     */
    public List<Division> selectAll();
    
    /**
     * 根据处编号获取部门
     * 
     * @param divisionNo 处编号
     * @return List&lt;Section&gt; 部门列表
     */
    public List<Section> selectSectionByDivisionNo(Short divisionNo);
}