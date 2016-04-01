package com.auchan.bem.bem_service;

import java.util.List;

import com.auchan.bem.bem_pojo.entity.Topic;

/**
 * 主题service接口
 * 
 * @date 2016-02-23
 * @author 郑冉
 *
 */
public interface TopicService {
	
	/**
	 * 初始化主题的本地目录
	 * @date 2016-03-29
	 */
	public void initTopicDirectory();
	
	/**
     * 获取主题
     * 
     * @param topicNo 上级主题编号（查询顶层主题则为空）
     * @param isChild 是否载入下级主题
     * @return List&lt;Topic&gt; 主题列表
     */
	public List<Topic> getTopicByParentNo(Short topicNo, boolean isChild);
	
	/**
	 * 插入主题
	 * 
	 * @param topic 主题类
	 * @return boolean 是否成功
	 * @date 2016-03-29
	 */
	public boolean addTopic(Topic topic);
	
	/**
	 * 修改主题
	 * 
	 * @param topic 主题类
	 * @return boolean 是否成功
	 * @date 2016-03-29
	 */
	public boolean editTopic(Topic topic);
	
	
	/**
	 * 主键获得topic
	 * @param topicNo 主题编号
	 * @return topic 主体对象
	 * @date 2016-03-30
	 */
	public Topic getTopic(Short topicNo);
	
	/**
	 * 删除主题
	 * 
	 * @param topicNo 主题编号
	 * @return boolean 是否成功
	 * @date 2016-03-30
	 */
	public boolean deleteTopic(Short topicNo);
}
