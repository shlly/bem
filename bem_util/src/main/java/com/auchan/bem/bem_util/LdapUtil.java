package com.auchan.bem.bem_util;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * ldap操作类
 * <p>无需创建实体对象。</p>
 * 
 * @dependence spring-security，spring-security-ldap
 * @maven spring-security，spring-security-ldap
 * @date 2016-03-24
 * @author 郑冉
 *
 */
public class LdapUtil {
	
	/**
	 * 获取用户名
	 * 
	 * @param principal
	 * @return String 用户名
	 */
	public static String getUserName(Principal principal) {
        if (principal == null) {
            return null;
        }
        else {
//            final UserDetails currentUser = (UserDetails) ((Authentication) principal).getPrincipal();
//            Collection<? extends GrantedAuthority> authorities = currentUser.getAuthorities();
//            for (GrantedAuthority grantedAuthority : authorities) {
//                 System.out.println(grantedAuthority.getAuthority());
//            }
            return principal.getName();
        }
    }
	
	/**
	 * 获取用户名
	 * 
	 * @return String 用户名
	 */
	public static String getUserName() {
		String username = null;
		try {
			username = SecurityContextHolder.getContext().getAuthentication().getName();
		} catch(Exception e) { }
        return username;
    }
	
	/**
	 * 获取用户权限
	 * 
	 * @param principal
	 * @return Collection&lt;String&gt; 用户权限
	 */
	public static Collection<String> getUserAuthority(Principal principal) {
        if (principal == null) {
            return Arrays.asList("none");
        }
        else {
            Set<String> roles = new HashSet<String>();
            final UserDetails currentUser = (UserDetails) ((Authentication) principal).getPrincipal();
            Collection<? extends GrantedAuthority> authorities = currentUser.getAuthorities();
            for (GrantedAuthority grantedAuthority : authorities) {
                roles.add(grantedAuthority.getAuthority());
            }
            return roles;
        }
    }
	
	/**
	 * 获取用户权限
	 * 
	 * @return List&lt;String&gt; 用户权限
	 */
	public static List<String> getUserAuthority() {
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		List<String> roles = new ArrayList<String>();
		for (GrantedAuthority grantedAuthority : authorities) {
            roles.add(grantedAuthority.getAuthority());
        }
        return roles;
	}
	
	/**
	 * 查找用户权限
	 * 
	 * @param auth 权限
	 * @return boolean 是否拥有此权限
	 */
	public static boolean findUserAuthority(String auth) {
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		for (GrantedAuthority grantedAuthority : authorities) {
			if (grantedAuthority.getAuthority().equals(auth))
				return true;
        }
        return false;
	}
	
	/**
	 * 获取XXX_YYY的YYY部分
	 * 
	 * @param pre XXX部分
	 * @return List&lt;String&gt; YYY部分列表
	 */
	public static List<String> getUserInfo(String pre) {
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		List<String> info = new ArrayList<String>();
		for (GrantedAuthority grantedAuthority : authorities) {
			if (grantedAuthority.getAuthority().indexOf(pre) > -1)
				info.add(grantedAuthority.getAuthority().substring(pre.length() + 1));
        }
        return info;
	}
}
