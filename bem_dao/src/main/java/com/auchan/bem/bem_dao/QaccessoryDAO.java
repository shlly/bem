package com.auchan.bem.bem_dao;

import java.util.List;

import com.auchan.bem.bem_pojo.entity.File;
import com.auchan.bem.bem_pojo.entity.Qaccessory;

/**
 *问题附件dao方法
 * 
 * @date 2016-03-15
 * @author 林亮亮
 *
 */
public interface QaccessoryDAO {
	/**
	 * 插入附件
	 * 
	 * @param  Qaccessory qaccessary
	 * @return int 影响行数
	 */
    public int insertQaccessory(Qaccessory qaccessory);

    /**
	 * 通过问题id获取附件
	 * 
	 * @param 
	 * @return 
	 */
    public List<Qaccessory> selectById(Integer q_no);
    
    
    /**
   	 * 通过主键获取附件
   	 * 
   	 * @param 
   	 * @return 
   	 */
    public Qaccessory selectByPrimaryKey(Integer aid);
    
}
	