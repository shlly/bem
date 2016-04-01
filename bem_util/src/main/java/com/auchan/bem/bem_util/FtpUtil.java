package com.auchan.bem.bem_util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

/**
 * ftp操作类
 * <p>需创建实体对象。</p>
 * 
* @dependence org.apache.commons.net
 * @maven commons-net commons-net 3.3
 * @date 2016-02-24
 * @author 郑冉
 *
 */
public class FtpUtil {
	
	private FTPClient ftpClient = null;
	private String url = null;
	private int port = -1;
	private String username = null;
	private String password = null;
	
	/**
	 * 构造函数
	 * 
	 * @param url ftp地址
	 * @param port ftp端口
	 * @param username ftp登录名
	 * @param password ftp密码
	 */
	public FtpUtil(String url, int port, String username, String password) {
		this.url = url;
		this.port = port;
		this.username = username;
		this.password = password;
		ftpClient = new FTPClient();
	}
	
	/**
	 * 连接ftp服务器
	 * @return Boolean 连接是否成功，<b>null</b> - 异常
	 */
	public Boolean conn() {
		try {
			ftpClient.connect(url, port);
			ftpClient.setControlEncoding("GBK");
			FTPClientConfig conf = new FTPClientConfig(FTPClientConfig.SYST_NT);
			conf.setServerLanguageCode("zh");
	        ftpClient.login(username, password);
	        if (!FTPReply.isPositiveCompletion(ftpClient.getReplyCode())) {
	        	System.out.println("ftp连接失败，错误代码：" + ftpClient.getReplyCode());
	        	close();
	        	return false;
	        }
	        else {
	        	return true;
	        }
		} catch(Exception e) {
			System.out.println("FtpUtil.conn 出现异常：" + e.getMessage());
			close();
        	return null;
		}
	}
	
	/**
	 * 断开ftp服务器
	 */
	public void close() {
		try {
			ftpClient.logout();
			ftpClient.disconnect();
		} catch (IOException e) {}
	}
	
	/**
	 * 文件是否存在
	 * 
	 * @param srcName 文件名
	 * @param path 文件路径
	 * @return Boolean <b>true</b> - 存在，<b>false</b> - 不存在，<b>null</b> - 异常
	 */
	public Boolean isExists(String srcName, String path) {
		Boolean isExists = null;
		try {
			srcName = new String(srcName.getBytes("GBK"), "ISO-8859-1");
			path = new String(path.getBytes("GBK"), "ISO-8859-1");
			ftpClient.changeWorkingDirectory(path);
			for(FTPFile file : ftpClient.listFiles()) {
				if (srcName.equals(new String(file.getName().getBytes("GBK"), "ISO-8859-1"))) {
					isExists = true;
					break;
				}
			}
			if (isExists == null)
				isExists = false;
		} catch (Exception e) {
			System.out.println("FtpUtil.isExists 出现异常：" + e.getMessage());
		}
		return isExists;
	}
	
	/**
	 * 删除文件
	 * 
	 * @param path 文件所在路径
	 * @param fileName 文件名
	 * @return Boolean 是否删除成功，<b>null</b> - 异常
	 */
	public Boolean deleteFile(String path, String fileName) {
		try {
			fileName = new String(fileName.getBytes("GBK"), "ISO-8859-1");
			path = new String(path.getBytes("GBK"), "ISO-8859-1");
			ftpClient.changeWorkingDirectory(path);
			ftpClient.deleteFile(fileName);
			return !isExists(fileName, ftpClient.listFiles());
		} catch (Exception e) {
			System.out.println("FtpUtil.deleteFile 出现异常：" + e.getMessage());
			return null;
		}
	}
	
	/**
	 * 上传文件
	 * 
	 * @param path 文件保存路径
	 * @param fileName 文件名
	 * @param file 上传文件
	 * @return Boolean 是否上传成功，<b>null</b> - 异常
	 */
	public Boolean upload(String path, String fileName, File file) {
		try {
			fileName = new String(fileName.getBytes("GBK"), "ISO-8859-1");
			path = new String(path.getBytes("GBK"), "ISO-8859-1");
			ftpClient.changeWorkingDirectory(path);
			fileName = autoRename(fileName, ftpClient.listFiles());
			ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
			InputStream is = new FileInputStream(file);
			ftpClient.storeFile(fileName, is);
			is.close();
			return isExists(fileName, ftpClient.listFiles());
		} catch (Exception e) {
			System.out.println("FtpUtil.upload 出现异常：" + e.getMessage());
			return null;
		}
	}
	
	/**
	 * 新建目录
	 * <p>如目录已存在则返回<b>false</b></p>
	 * 
	 * @param path 目录所在路径
	 * @param dirName 目录名称
	 * @return  Boolean 是否新建成功，<b>null</b> - 异常
	 */
	public Boolean createDirectory(String path, String dirName) {
		try {
			dirName = new String(dirName.getBytes("GBK"), "ISO-8859-1");
			path = new String(path.getBytes("GBK"), "ISO-8859-1");
			ftpClient.changeWorkingDirectory(path);
			return ftpClient.makeDirectory(dirName);
		} catch (Exception e) {
			System.out.println("FtpUtil.createDirectory 出现异常：" + e.getMessage());
			return null;
		}
	}
	
	/**
	 * 下载文件
	 * <p>注意关闭返回的文件流</p>
	 * 
	 * @param path 文件路径
	 * @param fileName 文件名
	 * @return InputStream 文件流，<b>null</b> - 异常/文件不存在
	 */
	public InputStream download(String path, String fileName) {
		InputStream is = null;
		try {
			fileName = new String(fileName.getBytes("GBK"), "ISO-8859-1");
			path = new String(path.getBytes("GBK"), "ISO-8859-1");
			ftpClient.changeWorkingDirectory(path);
			if (isExists(fileName, ftpClient.listFiles()))
				is = ftpClient.retrieveFileStream(fileName);
		} catch (Exception e) {
			System.out.println("FtpUtil.download 出现异常：" + e.getMessage());
		}
		return is;
	}
	
	/**
	 * 自动重命名文件
	 * 
	 * @param srcName 文件名
	 * @param checkFiles 需要检测的文件列表
	 * @return String 重命名完的文件名
	 */
	private static String autoRename(String srcName, FTPFile[] checkFiles) throws UnsupportedEncodingException {
		String filename = null;
		String suffix = null;
		if (srcName.lastIndexOf(".") > -1) {
			filename = srcName.substring(0, srcName.lastIndexOf("."));
			suffix = srcName.substring(srcName.lastIndexOf(".") + 1);
		} else {
			filename = srcName;
		}
		int i = 1;
		String newName = srcName;
		while (isExists(newName, checkFiles)) {
			newName = filename + "(" + (i++) + ")"
					+ (suffix == null ? "" : "." + suffix);
		}
		return newName;
	}
	
	/**
	 * 文件是否存在
	 * 
	 * @param path 文件路径
	 * @param checkFiles 需要检测的文件列表
	 * @return Boolean 是否存在
	 */
	private static boolean isExists(String srcName, FTPFile[] checkFiles) throws UnsupportedEncodingException {
		for(FTPFile file : checkFiles) {
			if (srcName.equals(new String(file.getName().getBytes("GBK"), "ISO-8859-1"))) {
				return true;
			}
		}
		return false;
	}
}
