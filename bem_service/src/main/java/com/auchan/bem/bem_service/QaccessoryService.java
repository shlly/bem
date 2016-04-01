package com.auchan.bem.bem_service;

import java.io.File;
import java.util.List;

import com.auchan.bem.bem_pojo.entity.Qaccessory;


/**
 * Q&Aservice接口
 * 
 * @date 2016-03-08
 * @author 林亮亮
 *
 */
public interface QaccessoryService {
	
	/**
	 * 附件存入表中
	 * 
	 * @date 2016-03-18
	 * @author 林亮亮
	 *
	 */
	int saveQaccessory(List<String> list, Integer q_no);
	
	/**
	 * 按问题id查询附件信息
	 * 
	 * @date 2016-03-22
	 * @author 林亮亮
	 *
	 */
	List<Qaccessory> getQaccessory(Integer q_no); 
	
	/**
	 * 按查询附件id查询附件信息
	 * 
	 * @date 2016-03-22
	 * @author 林亮亮
	 *
	 */
	Qaccessory selectByPrimaryKey(Integer aid);
}
