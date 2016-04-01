package com.auchan.bem.bem_dao;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.Control;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;

public class LdapDAO {
	private static String INITCTX = "com.sun.jndi.ldap.LdapCtxFactory"; //
	private static String MY_HOST = "ldap://137.200.32.29/"; //
	private static String MY_SEARCHBASE = "o=extmailAccount,o=auchan"; //
	private static String MGR_DN = "cn=authacc,o=auchan";
	private static String MGR_PW = "au123@chan"; //
	private static Control[] connCtls = null;
	private static Hashtable<String, String> env = new Hashtable<String, String>();
	private static LdapContext ctx = null;
	
	private volatile static LdapDAO ldapDAO;

	private LdapDAO() {
	}

	public static LdapDAO getLdapDAO() {
		if (ldapDAO == null) {
			synchronized (LdapDAO.class) {
				if (ldapDAO == null) {
					ldapDAO = new LdapDAO();
				}
			}
		}
		return ldapDAO;
	}

	public List<String> searchUid(String uid, int limit) throws Exception {
		if (ctx == null)
			connect();
		SearchControls constraints = new SearchControls();
		constraints.setSearchScope(SearchControls.SUBTREE_SCOPE);
		if (uid == null || uid.equals(""))
			uid = "*";
		NamingEnumeration<SearchResult> results = ctx.search(MY_SEARCHBASE, "uid=" + uid, constraints);
		List<String> uids = new ArrayList<String>();
		int i = 0;
		while ((results != null && results.hasMore()) && (i < limit || limit == -1)) {
			SearchResult sr = (SearchResult) results.next();
			String str = sr.getName();
			uids.add(str.substring(str.indexOf("uid=") + 4, str.indexOf(",")));
			i++;
		}
		return uids;
	}

	private void connect() {
		//建立连接
		env.put(Context.INITIAL_CONTEXT_FACTORY, INITCTX);
		env.put(Context.PROVIDER_URL, MY_HOST);
		env.put(Context.SECURITY_AUTHENTICATION, "simple"); //
		env.put(Context.SECURITY_PRINCIPAL, MGR_DN);
		env.put(Context.SECURITY_CREDENTIALS, MGR_PW);
		try {
			ctx = new InitialLdapContext(env, connCtls);
		} catch (javax.naming.AuthenticationException e) {
			System.out.println("Authentication faild: " + e.toString());
		} catch (Exception e) {
			System.out.println("Something wrong while authenticating: "
					+ e.toString());
		}
	}

	
}
