package com.auchan.bem.bem_dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.auchan.bem.bem_pojo.entity.File;
import com.auchan.bem.bem_pojo.entity.Questions;
import com.auchan.bem.bem_pojo.entity.SortAttribute;

/**
 * 文件类对应dao方法
 * 
 * @date 2016-02-24
 * @author linliangliang
 *
 */
public interface QuestionsDAO {
	
	/**
	 * 通过文件所属topic获取问题列表信息
	 * 
	 * @param org_no 
	 * @return list
	 */
    public List<Questions> selectByTopic(@Param("orgno")Integer topicNo);
    
    
    /**
	 * 通过文件所属topic获取问题列表信息(分页)
	 * 
	 * @param org_no 
	 * @return list
	 */
	public List<Questions> selectByTopicSort(@Param("orgno")Integer topicNo, @Param("sort")SortAttribute sort);

    
    /**
     * 保存提出的问题（非负毛利）
     */
    int saveQuestion(Questions question);
    
    
    /**
	 * 通过问题q_no获取文件
	 * 
	 * @param q_no 问题表主键
	 * @return Questions 
	 */
    public Questions selectByPrimaryKey(@Param("q_no")Integer q_no);
    
    

	/**
	 * 条件查询问题总数
	 * @param questions
	 * @param startDates
	 * @param endDate
	 * @return
	 */
	public int selectQuestions(@Param("questions")Questions questions, @Param("startDate")String startDate, 
			@Param("endDate")String endDate);


	/**
	 * 条件查询问题分页
	 * @param question
	 * @param dateFrom
	 * @param dateTo
	 * @param sort
	 * @return
	 */
	public List<Questions> selectQuestionsSort(@Param("questions")Questions question,
			 @Param("startDate")String dateFrom, @Param("endDate")String dateTo, @Param("sort")SortAttribute sort);

	
	/**
	 * 关闭问题
	 * @param q_no
	 */
	public void closeQuestion(@Param("q_no")Integer q_no);
}
