package com.auchan.bem.bem_service;

import java.util.List;

import com.auchan.bem.bem_pojo.entity.Questions;
import com.auchan.bem.bem_pojo.entity.SortAttribute;

/**
 * Q&Aservice接口
 * 
 * @date 2016-03-08
 * @author 林亮亮
 *
 */
public interface QuestionsService {
	/**
	 * TOPIC查询问题
	 * 
	 * @date 2016-03-08
	 * @author 林亮亮
	 *
	 */
	public List<Questions> searchQuestions(Integer orgno);
	
	/**
	 * TOPIC查询问题（分页）
	 * @param topicNo
	 * @param sort
	 * @return
	 */
	public List<Questions> searchQuestionsSort(Integer topicNo, SortAttribute sort);
	
	
	
	/**
	 * 保存问题
	 * 
	 * @date 2016-03-15
	 * @author 林亮亮
	 *
	 */
	public int saveQuestion(Questions question);

	/**
	 * 获取某个问题详情信息
	 * 
	 * @date 2016-03-15
	 * @author 林亮亮
	 *
	 */
	public Questions getDetail(Integer q_no);
	
	
	/**
	 * 条件查询问题总数
	 * 
	 * @date 2016-03-21
	 * @author 林亮亮
	 *
	 */
	public int searchAllQuestions(Questions question, String dateFrom,String dateTo);
	
	/**
	 * 条件查询问题列表(分页)
	 * 
	 * 
	 * @author 林亮亮
	 *
	 */
	public List<Questions>searchAllQuestionsSort(Questions question, String dateFrom,String dateTo, SortAttribute sort);
	
	/**
	 * 关闭问题
	 * @param q_no
	 * @date 2016-03-30
	 * @author 林亮亮
	 */
	public void closeQuestion(Integer q_no);
}
