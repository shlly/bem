package com.auchan.bem.bem_dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.auchan.bem.bem_pojo.entity.Function;
import com.auchan.bem.bem_pojo.entity.Role;
import com.auchan.bem.bem_pojo.entity.UserRole;

/**
 * 权限dao方法
 * 
 * @date 2016-03-28
 * @author 郑冉
 *
 */
public interface AuthorizeDAO {
	
	/**
	 * 根据用户名获取角色信息
	 * 
	 * @param username 用户名
	 * @return List&lt;Role&gt; 角色列表
	 */
	public List<Role> selectRoleByUserName(@Param("username")String username);
	
	/**
	 * 返回所有角色
	 * 
	 * @return List&lt;Role&gt; 角色列表
	 * @date 2016-03-28
	 */
	public List<Role> selectRole();
	
	/**
	 * 返回所有功能
	 * 
	 * @return List&lt;Function&gt; 功能列表
	 * @date 2016-03-28
	 */
	public List<Function> selectFunction();
	
	/**
	 * 返回所有用户-角色
	 * 
	 * @return List&lt;UserRole&gt; 用户-角色列表
	 * @date 2016-03-28
	 */
	public List<UserRole> selectUserRole();
	
	/**
	 * 删除用户-权限
	 * 
	 * @param id 用户-权限id
	 * @return int 影响行数
	 * @date 2016-03-28
	 */
	public int deleteUserRole(Integer id);
	
	/**
	 * 插入用户-角色
	 * 
	 * @param userRole.username 用户名
	 * @param userRole.role.id 角色ID
	 * @return int 影响行数
	 * @date 2016-03-28
	 */
	public int insertUserRole(UserRole userRole);
}
