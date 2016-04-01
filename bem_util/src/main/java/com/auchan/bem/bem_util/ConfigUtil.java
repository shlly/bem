package com.auchan.bem.bem_util;

import java.io.FileInputStream;
import java.util.Properties;

/**
 * 配置文件操作类
 * <p>配置文件必须为properties类型</p>
 * <p>请将配置文件放入resources目录下</p>
 * <p>无需创建实体对象。</p>
 * 
 * @dependence 无
 * @maven 无
 * @date 2016-06-26
 * @author 郑冉
 *
 */
public class ConfigUtil {
	
	private static String rootPath = ConfigUtil.class.getClassLoader().getResource("").toString().replace("file:/", "").replace("/", "\\").replace("%20", " ");
	
	/**
	 * 获取配置的配置信息
	 * 
	 * @param configName 配置文件名称（无需后缀）
	 * @param key 配置信息key
	 * @return String 配置信息
	 */
	public static String get(String configName, String key) {
		try {
			Properties properties = new Properties();
			FileInputStream fis = new FileInputStream(rootPath + configName + ".properties");
			properties.load(fis);
			fis.close();
			return properties.getProperty(key);
		} catch (Exception e) {
			System.out.println("ConfigUtil.get 出现异常：" + e.getMessage());
			return null;
		}
	}
}
