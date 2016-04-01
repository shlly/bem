package com.auchan.bem.bem_service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.auchan.bem.bem_dao.AuthorizeDAO;
import com.auchan.bem.bem_dao.LdapDAO;
import com.auchan.bem.bem_pojo.entity.Function;
import com.auchan.bem.bem_pojo.entity.Role;
import com.auchan.bem.bem_pojo.entity.UserRole;
import com.auchan.bem.bem_service.AuthorizeService;
import com.auchan.bem.bem_util.LdapUtil;

@Service
public class AuthorizeServiceImpl implements AuthorizeService {
	
	@Resource
	private AuthorizeDAO authorizeDAO;

	@Override
	public List<Role> getRole() {
		return authorizeDAO.selectRole();
	}

	@Override
	public List<Function> getFunction() {
		return authorizeDAO.selectFunction();
	}

	@Override
	public List<UserRole> getUserRole() {
		return authorizeDAO.selectUserRole();
	}

	@Override
	public boolean delAuth(Integer id) {
		if (id != null)
			return authorizeDAO.deleteUserRole(id) == 0 ? false : true;
		else
			return false;
	}

	@Override
	public UserRole addUserRole(String username, Short roleId) throws Exception {
		if (LdapDAO.getLdapDAO().searchUid(username, 10).size() == 1) {
			UserRole userRole = new UserRole();
			Role role = new Role();
			role.setId(roleId);
			userRole.setUsername(username);
			userRole.setRole(role);
			userRole.setCreateUser(LdapUtil.getUserName());
			if (authorizeDAO.insertUserRole(userRole) == 1)
				return userRole;
		}
		return null;
	}
}
