package com.auchan.bem.bem_dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.auchan.bem.bem_pojo.entity.Qreply;

/**
 * 回复对应dao方法
 * 
 * @date 2016-03-15
 * @author 林亮亮
 *
 */
public interface QreplyDAO {
    /**
	 * 通过id获取回复内容
	 * @param id qreply表的id
	 * @return Qreply 
	 */
    public List<Qreply> selectByPrimaryKey(@Param("ttitleno")Integer q_no);
    
    /**
	 * 添加回复内容
	 * @param id qreply表的id
	 * @return 
	 */
   int saveQreply(Qreply qreply);

}
	