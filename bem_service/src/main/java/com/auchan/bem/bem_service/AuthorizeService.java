package com.auchan.bem.bem_service;

import java.util.List;

import com.auchan.bem.bem_pojo.entity.Function;
import com.auchan.bem.bem_pojo.entity.Role;
import com.auchan.bem.bem_pojo.entity.UserRole;

/**
 * 权限管理service接口
 * 
 * @date 2016-03-28
 * @author 郑冉
 *
 */
public interface AuthorizeService {
	
	/**
	 * 获取所有角色信息
	 * 
	 * @return List&lt;Role&gt; 角色列表
	 * @date 2016-03-28
	 */
	public List<Role> getRole();
	
	/**
	 * 获取所有功能
	 * 
	 * @return List&lt;Function&gt; 功能列表
	 * @date 2016-03-28
	 */
	public List<Function> getFunction();
	
	/**
	 * 获取所有用户-角色
	 * 
	 * @return List&lt;UserRole&gt; 角色列表
	 * @date 2016-03-28
	 */
	public List<UserRole> getUserRole();
	
	/**
	 * 删除用户-权限
	 * 
	 * @param id 用户-权限id
	 * @return boolean 是否成功
	 * @date 2016-03-28
	 */
	public boolean delAuth(Integer id);
	
	/**
	 * 添加用户-权限
	 * 
	 * @param username 用户名
	 * @param roleId 角色id
	 * @return UserRole 用户-权限对象
	 * @date 2016-03-28
	 */
	public UserRole addUserRole(String username, Short roleId) throws Exception;
}
