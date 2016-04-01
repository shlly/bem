package com.auchan.bem.bem_service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.auchan.bem.bem_pojo.entity.Qreply;

/**
 * Q&Aservice接口
 * 
 * @date 2016-03-08
 * @author 林亮亮
 *
 */
public interface QreplyService {
	/**
	 * 获取单个问题的所有回复
	 * 
	 * @date 2016-03-15
	 * @author 林亮亮
	 *
	 */
	public List<Qreply> getQreply(Integer ttitleno);
	
	
	/**
	 * 添加一条回复
	 * 
	 * @date 2016-03-15
	 * @author 林亮亮
	 *
	 */
	public int saveQreply(Qreply qreply,Integer q_no);
}
