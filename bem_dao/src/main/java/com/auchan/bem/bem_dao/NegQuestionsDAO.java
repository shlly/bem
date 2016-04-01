package com.auchan.bem.bem_dao;

import com.auchan.bem.bem_pojo.entity.NegQuestions;

/**
 * 对应dao方法
 * 
 * @date 2016-03-29
 * @author linliangliang
 *
 */
public interface NegQuestionsDAO {
    /**
     * 保存负毛利问题
     */
    int saveNegQuestion(NegQuestions negQuestion);
    
    /**
     * 获取负毛利问题信息
     * @param q_no
     * @return
     */
    NegQuestions selectByQno(Integer q_no);
}