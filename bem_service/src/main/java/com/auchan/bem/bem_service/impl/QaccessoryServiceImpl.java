package com.auchan.bem.bem_service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auchan.bem.bem_dao.QaccessoryDAO;
import com.auchan.bem.bem_pojo.entity.Qaccessory;
import com.auchan.bem.bem_service.QaccessoryService;
import com.auchan.bem.bem_util.LdapUtil;
/**
 * Q&Aservice 实现类
 * @author linliangliang
 *
 */
@Service
public class QaccessoryServiceImpl implements QaccessoryService {
@Resource
QaccessoryDAO qaccessoryDAO;


@Override
public int saveQaccessory(List<String> list,Integer q_no) {
	Qaccessory qaccessory=new Qaccessory();
	for(String fileName:list){
		qaccessory.setTtitleno(q_no);
		qaccessory.setAname(fileName);
		qaccessory.setLdapid(LdapUtil.getUserName());
		qaccessoryDAO.insertQaccessory(qaccessory);
	}
	return 0;
}


@Override
public List<Qaccessory> getQaccessory(Integer q_no) {
	List<Qaccessory> a=qaccessoryDAO.selectById(q_no);
	return qaccessoryDAO.selectById(q_no);
}


@Override
public Qaccessory selectByPrimaryKey(Integer aid) {
	return qaccessoryDAO.selectByPrimaryKey(aid);
}

}
