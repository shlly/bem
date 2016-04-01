package com.auchan.bem.bem_service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.auchan.bem.bem_dao.QuestionsDAO;
import com.auchan.bem.bem_pojo.entity.Questions;
import com.auchan.bem.bem_pojo.entity.SortAttribute;
import com.auchan.bem.bem_service.QuestionsService;
import com.auchan.bem.bem_util.LdapUtil;


/**
 * Q&Aservice 实现类
 * @author linliangliang
 *
 */
@Service
public class QuestionsServiceImpl implements QuestionsService {
@Resource
QuestionsDAO questionsDAO;

@Override
public List<Questions> searchQuestions(Integer orgno) {
	return questionsDAO.selectByTopic(orgno);
	}

@Override
public int saveQuestion(Questions question) {
	String user=LdapUtil.getUserName();
	question.setLdapid(user);
	return questionsDAO.saveQuestion(question);
		
}

@Override
public Questions getDetail(Integer q_no) {
	
	return questionsDAO.selectByPrimaryKey(q_no);
}

@Override
public int searchAllQuestions(Questions question, String dateFrom, String dateTo) {

	return questionsDAO.selectQuestions(question,dateFrom,dateTo);
}

@Override
public List<Questions> searchQuestionsSort(Integer orgno, SortAttribute sort) {
	
	return questionsDAO.selectByTopicSort(orgno,sort);
}

@Override
public List<Questions> searchAllQuestionsSort(Questions question,
		String dateFrom, String dateTo, SortAttribute sort) {
	return questionsDAO.selectQuestionsSort(question,dateFrom,dateTo,sort);
}

@Override
public void closeQuestion(Integer q_no) {
	questionsDAO.closeQuestion(q_no);
}
}
