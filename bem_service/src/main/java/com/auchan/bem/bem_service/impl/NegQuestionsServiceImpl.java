package com.auchan.bem.bem_service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.auchan.bem.bem_dao.NegQuestionsDAO;
import com.auchan.bem.bem_pojo.entity.NegQuestions;
import com.auchan.bem.bem_service.NegQuestionsService;
/**
 * 负毛利问题实现类
 * @author linliangliang
 *
 */
@Service
public class NegQuestionsServiceImpl implements NegQuestionsService {
	@Resource
	NegQuestionsDAO negquestionsDAO;
	
	@Override
	public int saveNegQuestion(NegQuestions negQuestion) {
		return negquestionsDAO.saveNegQuestion(negQuestion); 
		
	}

	@Override
	public NegQuestions selectByQno(Integer q_no) {

		return negquestionsDAO.selectByQno(q_no);
	}
}