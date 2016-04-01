package com.auchan.bem.bem_web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.auchan.bem.bem_pojo.entity.Topic;
import com.auchan.bem.bem_service.TopicService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 组织controller
 * 
 * @url /topic
 * @date 2016-02-22
 * @author 郑冉
 *
 */
@Controller  
@RequestMapping("topic")
public class TopicController {

	@Resource
	TopicService topicService;
	
	/**
	 * 获取主题
	 * 
	 * @param topicNo 父主题编号
	 * @param isChild 是否获取子主题
	 * @url /topic/getTopics
	 * @method get/post
	 * @return json 主题列表
	 * @date 2016-02-29
	 */
	@RequestMapping("getTopics")
	@ResponseBody
	public String getTopics(Short topicNo, Boolean isChild) {
		if (isChild == null)
			isChild = false;
		return JSONArray.fromObject(topicService.getTopicByParentNo(topicNo, isChild)).toString();
	}
	
	/**
	 * 添加主题
	 * 
	 * @param topic.name 主题名称
	 * @param topic.enName 主题英文名
	 * @param topic.parentTopicNo 父主题编号
	 * @param topic.canQuestion 是否能提问
	 * @param topic.importantLevel 主题等级
	 * @url /topic/addTopic
	 * @method post
	 * @return json 主题对象
	 * @date 2016-03-29
	 */
	@RequestMapping(value="addTopic", method=RequestMethod.POST)
	@ResponseBody
	public String addTopic(@ModelAttribute Topic topic) {
		if (topicService.addTopic(topic))
			return JSONObject.fromObject(topic).toString();
		else
			return null;
	}
	
	/**
	 * 修改主题
	 * 
	 * @param topic.topicNo 主题编号
	 * @param topic.name 主题名称
	 * @param topic.enName 主题英文名
	 * @param topic.parentTopicNo 父主题编号
	 * @param topic.canQuestion 是否能提问
	 * @param topic.importantLevel 主题等级
	 * @url /topic/editTopic
	 * @method post
	 * @return json 主题对象
	 * @date 2016-03-29
	 */
	@RequestMapping(value="editTopic", method=RequestMethod.POST)
	@ResponseBody
	public String editTopic(@ModelAttribute Topic topic) {
		if (topicService.editTopic(topic))
			return JSONObject.fromObject(topic).toString();
		else
			return null;
	}
	
	/**
	 * 删除主题
	 * 
	 * @param topicNo 主题编号
	 * @url /topic/deleteTopic
	 * @method post
	 * @return boolean 是否成功
	 * @date 2016-03-30
	 */
	@RequestMapping(value="deleteTopic", method=RequestMethod.POST)
	@ResponseBody
	public boolean deleteTopic(Short topicNo) {
		return topicService.deleteTopic(topicNo);
	}
}
