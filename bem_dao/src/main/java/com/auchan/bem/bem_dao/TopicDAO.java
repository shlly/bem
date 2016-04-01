package com.auchan.bem.bem_dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.auchan.bem.bem_pojo.entity.Topic;

/**
 * 主题类对应dao方法
 * 
 * @date 2016-03-03
 * @author 郑冉
 *
 */
public interface TopicDAO {
	
	/**
	 * 根据主题编号删除主题
	 * 
	 * @param topicNo 主题编号
	 * @return int 影响行数
	 */
    public int deleteByPrimaryKey(Short topicNo);
    
    /**
	 * 插入主题
	 * 
	 * @param topic 主题类
	 * @return int 影响行数
	 */
    public int insertTopic(Topic topic);
    
    /**
	 * 获取主题编号
	 * 
	 * @return Short 主题编号
	 */
    public Short selectTopicNo();
    
    /**
	 * 通过主题编号获取主题
	 * 
	 * @param topicNo 主题编号
	 * @return Topic 主题类
	 */
    public Topic selectByPrimaryKey(Short topicNo);
    
    /**
	 * 根据主题编号修改主题信息
	 * <p>若status不为空则会更新所有子主题</p>
	 * 
	 * @param topic 主题类
	 * @return int 影响行数
	 */
    public int updateTopic(Topic topic);
    
    /**
     * 获取一级主题
     * 
     * @param topicNo 上级主题编号（查询顶层主题则为空）
     * @return List&lt;Topic&gt; 主题列表
     */
    public List<Topic> selectTopicByParentNo(Short topicNo);
    
    /**
     * 下移单层主题等级
     * 
     * @param startLevel 开始等级（取得到）
     * @param endLevel 结束等级（取得到）
	 * @return int 影响行数
     */
    public int updateDownImportantLevel(@Param("startLevel")Short startLevel, @Param("endLevel")Short endLevel);
    
    /**
     * 上移单层主题等级
     * 
     * @param startLevel 开始等级（取得到）
     * @param endLevel 结束等级（取得到）
	 * @return int 影响行数
     */
    public int updateUpImportantLevel(@Param("startLevel")Short startLevel, @Param("endLevel")Short endLevel);
    
    /**
     * 更新下层主题等级
     * 
	 * @return int 影响行数
     */
    public int updateChildImportantLevel();
}