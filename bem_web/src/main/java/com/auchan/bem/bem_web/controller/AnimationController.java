package com.auchan.bem.bem_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 活动controller
 * 
 * @url /animation
 * @date 2016-03-31
 * @author 郑冉
 *
 */
@Controller  
@RequestMapping("animation")
public class AnimationController {
	
	/**
	 * 所有animation
	 * <p>animation首页</p>
	 * 
	 * @url /animation, /animation/all
	 * @method get/post
	 * @return animation/index.jsp
	 * @date 2016-03-31
	 */
	@RequestMapping({"", "all"})
	public String allAnimation(ModelMap model) {
		model.addAttribute("pageTitle", "所有活动/All Animation");
		model.addAttribute("breadcrumbs", new String[][] {{"Animation", "animation"}, {"All Animation"}});
		model.addAttribute("leftbar", "9");
		return "animation/index";
	}
	
	/**
	 * 我的animation
	 * 
	 * @url /animation/my
	 * @method get/post
	 * @return animation/index.jsp
	 * @date 2016-03-31
	 */
	@RequestMapping("my")
	public String myAnimation(ModelMap model) {
		model.addAttribute("pageTitle", "我的活动/My Animation");
		model.addAttribute("breadcrumbs", new String[][] {{"Animation", "animation"}, {"My Animation"}});
		model.addAttribute("leftbar", "10");
		return "animation/index";
	}
	
	/**
	 * 新建animation
	 * 
	 * @url /animation/new
	 * @method get
	 * @return animation/new.jsp
	 * @date 2016-03-31
	 */
	@RequestMapping(value="new", method=RequestMethod.GET)
	public String newAnimation(ModelMap model) {
		model.addAttribute("pageTitle", "我的活动/My Animation");
		model.addAttribute("breadcrumbs", new String[][]
				{{"Animation", "animation"}, {"My Animation", "animation/my"}, {"New Animation"}});
		model.addAttribute("leftbar", "11");
		return "animation/new";
	}
	
	/**
	 * animation详情页
	 * 
	 * @url /animation/{animationNo}
	 * @method get/post
	 * @return animation/animationDetail.jsp
	 * @date 2016-03-31
	 */
	@RequestMapping("{animationNo}")
	public String animationDetail(ModelMap model,
			@PathVariable("animationNo") Integer animationNo) {
		model.addAttribute("pageTitle", "活动/Animation: " + animationNo);
		model.addAttribute("breadcrumbs", new String[][] {{"Animation", "animation"}, {"Detail"}});
		model.addAttribute("leftbar", "9");
		return "animation/animationDetail";
	}
	
	/**
	 * animation详情页
	 * 
	 * @url /animation/{animationNo}
	 * @method get/post
	 * @return animation/animationDetail.jsp
	 * @date 2016-03-31
	 */
	@RequestMapping("{animationNo}/{topicNo}")
	public String topicDetail(ModelMap model,
			@PathVariable("animationNo") Integer animationNo,
			@PathVariable("topicNo") Integer topicNo) {
		model.addAttribute("pageTitle", "活动/Animation: " + animationNo + " - " + topicNo);
		model.addAttribute("breadcrumbs", new String[][]
				{{"Animation", "animation"}, {"Detail", "animation/" + animationNo}, {"Topic"}});
		model.addAttribute("leftbar", "9");
		return "animation/topicDetail";
	}
}
