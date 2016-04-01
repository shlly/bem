package com.auchan.bem.bem_web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.auchan.bem.bem_dao.LdapDAO;
import com.auchan.bem.bem_pojo.entity.UserRole;
import com.auchan.bem.bem_service.AuthorizeService;

import net.sf.json.JSONArray;

/**
 * 权限管理controller
 * 
 * @url /auth
 * @date 2016-03-24
 * @author 郑冉
 *
 */
@Controller  
@RequestMapping("auth")
public class AuthorizeController {
	
	@Resource
	AuthorizeService authorizeService;
	
	/**
	 * 获取角色
	 * 
	 * @url /auth/getRoles
	 * @method get/post
	 * @return json 角色列表
	 * @date 2016-03-28
	 */
	@RequestMapping("getRoles")
	@ResponseBody
	public String getRoles() {
		return JSONArray.fromObject(authorizeService.getRole()).toString();
	}
	
	/**
	 * 获取功能
	 * 
	 * @url /auth/getFunctions
	 * @method get/post
	 * @return json 功能列表
	 * @date 2016-03-28
	 */
	@RequestMapping("getFunctions")
	@ResponseBody
	public String getFunctions() {
		return JSONArray.fromObject(authorizeService.getFunction()).toString();
	}
	
	/**
	 * 获取所有用户名
	 * 
	 * @url /auth/getUserName
	 * @method get/post
	 * @param uid 用户名
	 * @return json 用户名列表
	 * @date 2016-03-24
	 */
	@RequestMapping("getUserName")
	@ResponseBody
	public String getUserName(String uid) throws Exception {
		return JSONArray.fromObject(LdapDAO.getLdapDAO().searchUid("*" + uid + "*", 10)).toString();
	}
	
	/**
	 * 获取用户-权限
	 * 
	 * @url /auth/getUserRole
	 * @method get/post
	 * @return json 用户-权限列表
	 * @date 2016-03-28
	 */
	@RequestMapping("getUserRole")
	@ResponseBody
	public String getUserRole() {
		return JSONArray.fromObject(authorizeService.getUserRole()).toString();
	}
	
	/**
	 * 删除用户-权限
	 * 
	 * @url /auth/delAuth
	 * @method post
	 * @param id 用户-权限id
	 * @return boolean 是否成功
	 * @date 2016-03-28
	 */
	@RequestMapping(value="delAuth", method=RequestMethod.POST)
	@ResponseBody
	public boolean delAuth(Integer id) {
		return authorizeService.delAuth(id);
	}
	
	/**
	 * 添加用户-权限
	 * 
	 * @url /auth/addAuth
	 * @method post
	 * @param username 用户名
	 * @param roleId 角色id
	 * @return Integer 用户-权限id
	 * @date 2016-03-28
	 */
	@RequestMapping(value="addAuth", method=RequestMethod.POST)
	@ResponseBody
	public Integer addAuth(String username, Short roleId) throws Exception {
		UserRole userRole = authorizeService.addUserRole(username, roleId);
		if (userRole == null)
			return null;
		else
			return userRole.getId();
	}
}
