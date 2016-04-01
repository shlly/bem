package com.auchan.bem.bem_web.controller;

import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 登录、登出controller
 * 
 * @url /
 * @date 2016-02-22
 * @author 郑冉
 *
 */
@Controller  
@RequestMapping("")
public class LoginController {
	
	/**
	 * 网站首页，跳转登陆页
	 * 
	 * @url /
	 * @method get/post
	 * @return login.jsp
	 * @date 2016-02-22
	 * @author 郑冉
	 */
	@RequestMapping("")
	public String index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getHeader("X-Requested-With") != null 
				&& "XMLHttpRequest".equals( request.getHeader("X-Requested-With").toString())) {
			PrintWriter out=response.getWriter();
			out.close();
		}
		return "login";
	}

	/**
	 * 404错误页面
	 * 
	 * @url /error/404
	 * @method get/post
	 * @return 404.jsp
	 * @date 2016-02-24
	 * @author 郑冉
	 */
	@RequestMapping("error/404")
	public String error404(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getHeader("X-Requested-With") != null 
				&& "XMLHttpRequest".equals( request.getHeader("X-Requested-With").toString())) {
			PrintWriter out=response.getWriter();
			out.close();
		}
		return "404";
	}

	/**
	 * 403错误页面
	 * 
	 * @url /error/403
	 * @method get/post
	 * @return 403.jsp
	 * @date 2016-03-22
	 * @author 郑冉
	 */
	@RequestMapping("error/403")
	public String error403(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getHeader("X-Requested-With") != null 
				&& "XMLHttpRequest".equals( request.getHeader("X-Requested-With").toString())) {
			PrintWriter out=response.getWriter();
			out.close();
		}
		return "403";
	}

	/**
	 * 500错误页面
	 * 
	 * @url /error/500
	 * @method get/post
	 * @return 500.jsp
	 * @date 2016-02-24
	 * @author 郑冉
	 */
	@RequestMapping("error/500")
	public String error500(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getHeader("X-Requested-With") != null 
				&& "XMLHttpRequest".equals( request.getHeader("X-Requested-With").toString())) {
			PrintWriter out=response.getWriter();
			out.close();
		}
		return "500";
	}
	
	/**
	 * 跳转登陆页
	 * 
	 * @url /login
	 * @method get
	 * @return login.jsp
	 * @date 2016-02-26
	 * @author 郑冉
	 */
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginGet(HttpServletRequest request, HttpServletResponse response,
			ModelMap model, boolean error) throws Exception {
		if (request.getHeader("X-Requested-With") != null 
				&& "XMLHttpRequest".equals( request.getHeader("X-Requested-With").toString())) {
			PrintWriter out=response.getWriter();
			out.close();
		}
		model.addAttribute("error", error);
		return "login";
	}
	
	/**
	 * 进入系统功能首页
	 * 
	 * @url /home
	 * @method get/post
	 * @return home.jsp
	 * @date 2016-02-22
	 * @author 郑冉
	 */
	@RequestMapping("home")
	public String home(ModelMap model, Principal principal) {
		model.addAttribute("pageTitle", "首页/Home");
		return "home";
	}
}