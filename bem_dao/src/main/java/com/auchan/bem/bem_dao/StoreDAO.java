package com.auchan.bem.bem_dao;

import java.util.List;

import com.auchan.bem.bem_pojo.entity.Store;

/**
 * 门店类对应dao方法
 * 
 * @date 2016-03-22
 * @author 郑冉
 *
 */
public interface StoreDAO {
	
	/**
	 * 获取门店信息
	 * 
	 * @return List&lt;Store&gt; 区域列表
	 * @date 2016-03-22
	 */
    List<Store> selectAll();
    
    /**
     * 获取门店信息
     * 
     * @param storeNo 门店号
     * @return Store 门店类
     * @date 2016-03-22
     */
    Store selectByStoreNo(Short storeNo);
}