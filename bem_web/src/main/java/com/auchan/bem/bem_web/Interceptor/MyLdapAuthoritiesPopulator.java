package com.auchan.bem.bem_web.Interceptor;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.ldap.core.DirContextOperations;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.ldap.userdetails.LdapAuthoritiesPopulator;
import org.springframework.stereotype.Component;

import com.auchan.bem.bem_dao.AuthorizeDAO;
import com.auchan.bem.bem_dao.StoreDAO;
import com.auchan.bem.bem_pojo.entity.Role;
import com.auchan.bem.bem_pojo.entity.Store;

@Component
public class MyLdapAuthoritiesPopulator implements LdapAuthoritiesPopulator {
	
	@Resource
	StoreDAO storeDAO;
	@Resource
	AuthorizeDAO authorizeDAO;
	
	@Override
    public Collection<? extends GrantedAuthority> getGrantedAuthorities(
                    DirContextOperations userData, String username) {
            Collection<GrantedAuthority> gas = new HashSet<GrantedAuthority>();
            
            
            
            // 获取用户所在门店
            if (userData.getStringAttribute("Location") != null
            		&& !userData.getStringAttribute("Location").equals("")) {
                Short location = -1;
	            try {
	            	location = Short.valueOf(userData.getStringAttribute("Location"));
	            } catch(Exception e) {
	            	location = 0;
	            }
	            // 获取用户门店信息
	            Store store = storeDAO.selectByStoreNo(location);
	            if (store != null) {
	            	gas.add(new SimpleGrantedAuthority("STORE_" + store.getStoreNo()));
	            	// 自动权限
//	            	if (store.getStoreNo() == 0)
//	            		gas.add(new SimpleGrantedAuthority("ROLE_HO"));
//	            	else
//	            		gas.add(new SimpleGrantedAuthority("ROLE_STORE"));
	            	// 获取用户特殊角色
	            	List<Role> roles = authorizeDAO.selectRoleByUserName(username);
	            	if (roles != null && roles.size() > 0) {
	            		for(Role role : roles)
	            			gas.add(new SimpleGrantedAuthority(role.getSymbol()));
	            	}
	            }
            }
            else
            	gas.add(new SimpleGrantedAuthority("ROLE_ANOMYMOUS"));
            
//            gas.add(new SimpleGrantedAuthority(userData.getStringAttribute("uidNumber")));
//            gas.add(new SimpleGrantedAuthority(userData.getStringAttribute("gidNumber")));
//            gas.add(new SimpleGrantedAuthority(userData.getStringAttribute("Division")));
//            gas.add(new SimpleGrantedAuthority(userData.getStringAttribute("Location")));
//            gas.add(new SimpleGrantedAuthority(userData.getStringAttribute("cn"))); // 中文姓名拼音
//            gas.add(new SimpleGrantedAuthority(userData.getStringAttribute("mail")));
            return gas;
    }
}
