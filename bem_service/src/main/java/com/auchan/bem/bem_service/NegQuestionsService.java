package com.auchan.bem.bem_service;

import com.auchan.bem.bem_pojo.entity.NegQuestions;

/**
 * Q&Aservice接口
 * 
 * @date 2016-03-08
 * @author 林亮亮
 *
 */
public interface NegQuestionsService {
	
	/**
	 * 保存neg问题
	 */
	public int saveNegQuestion(NegQuestions negQuestion);
	
	/**
	 * 获取neg问题信息
	 * @param q_no
	 * @return
	 */
	public NegQuestions selectByQno(Integer q_no);
}
