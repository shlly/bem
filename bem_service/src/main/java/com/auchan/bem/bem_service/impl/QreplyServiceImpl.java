package com.auchan.bem.bem_service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.auchan.bem.bem_dao.QreplyDAO;
import com.auchan.bem.bem_pojo.entity.Qreply;
import com.auchan.bem.bem_service.QreplyService;
import com.auchan.bem.bem_util.LdapUtil;
/**
 * Q&Aservice 实现类
 * @author linliangliang
 *
 */
@Service
public class QreplyServiceImpl implements QreplyService {
@Resource
QreplyDAO qreplyDAO;

@Override
public List<Qreply> getQreply(Integer ttitleno) {
	
	return qreplyDAO.selectByPrimaryKey(ttitleno);
	}

@Override
public int saveQreply(Qreply qreply,Integer q_no) {
	qreply.setLdapid(LdapUtil.getUserName());
	qreply.setTtitleno(q_no);
	return qreplyDAO.saveQreply(qreply);
}
}
