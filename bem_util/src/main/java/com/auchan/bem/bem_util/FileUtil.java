package com.auchan.bem.bem_util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * 本地文件/目录操作类
 * <p>无需创建实体对象。</p>
 * 
 * @dependence 无
 * @maven 无
 * @date 2015-12-31
 * @author 郑冉
 *
 */
public class FileUtil {

	/**
	 * 文件/目录是否存在
	 * 
	 * @param path 文件/目录路径
	 * @return Boolean <b>true</b> - 存在，<b>false</b> - 不存在，<b>null</b> - 异常
	 * @date 2015-12-30
	 */
	public static Boolean isExists(String path) {
		Boolean isExists = null;
		try {
			File file = new File(path);
			if (file.exists())
				isExists = true;
			else
				isExists = false;
		} catch (Exception e) {
			System.out.println("FileUtil.isExists 出现异常：" + e.getMessage());
		}
		return isExists;
	}

	/**
	 * 是否为目录
	 * 
	 * @param path 目录路径
	 * @return Boolean <b>true</b> - 是，<b>false</b> - 不是，<b>null</b> - 异常
	 * @date 2015-12-30
	 */
	public static Boolean isDirectory(String path) {
		Boolean isDirectory = null;
		try {
			File file = new File(path);
			if (file.isDirectory())
				isDirectory = true;
			else
				isDirectory = false;
		} catch (Exception e) {
			System.out.println("FileUtil.isDirectory 出现异常：" + e.getMessage());
		}
		return isDirectory;
	}

	/**
	 * 是否为文件
	 * 
	 * @param path 文件路径
	 * @return Boolean <b>true</b> - 是，<b>false</b> - 不是，<b>null</b> - 异常
	 * @date 2015-12-30
	 */
	public static Boolean isFile(String path) {
		Boolean isFile = null;
		try {
			File file = new File(path);
			if (file.isFile())
				isFile = true;
			else
				isFile = false;
		} catch (Exception e) {
			System.out.println("FileUtil.isFile 出现异常：" + e.getMessage());
		}
		return isFile;
	}

	/**
	 * 文件是否可读
	 * 
	 * @param path 文件路径
	 * @return Boolean <b>true</b> - 是，<b>false</b> - 不是，<b>null</b> - 异常
	 * @date 2015-12-30
	 */
	public static Boolean canRead(String path) {
		Boolean canRead = null;
		try {
			File file = new File(path);
			if (file.canRead())
				canRead = true;
			else
				canRead = false;
		} catch (Exception e) {
			System.out.println("FileUtil.canRead 出现异常：" + e.getMessage());
		}
		return canRead;
	}

	/**
	 * 文件是否可写
	 * 
	 * @param path 文件路径
	 * @return Boolean <b>true</b> - 是，<b>false</b> - 不是，<b>null</b> - 异常
	 * @date 2015-12-30
	 */
	public static Boolean canWrite(String path) {
		Boolean canWrite = null;
		try {
			File file = new File(path);
			if (file.canWrite())
				canWrite = true;
			else
				canWrite = false;
		} catch (Exception e) {
			System.out.println("FileUtil.canWrite 出现异常：" + e.getMessage());
		}
		return canWrite;
	}

	/**
	 * 是否是隐藏文件/目录
	 * 
	 * @param path 文件/目录路径
	 * @return Boolean <b>true</b> - 是，<b>false</b> - 不是，<b>null</b> - 异常
	 * @date 2015-12-30
	 */
	public static Boolean isHidden(String path) {
		Boolean isHidden = null;
		try {
			File file = new File(path);
			if (file.isHidden())
				isHidden = true;
			else
				isHidden = false;
		} catch (Exception e) {
			System.out.println("FileUtil.isHidden 出现异常：" + e.getMessage());
		}
		return isHidden;
	}

	/**
	 * 设置为只读文件/目录
	 * 
	 * @param path 文件/目录路径
	 * @return Boolean <b>true</b> - 成功，<b>false</b> - 失败，<b>null</b> - 异常
	 * @date 2015-12-30
	 */
	public static Boolean setReadOnly(String path) {
		Boolean success = null;
		try {
			File file = new File(path);
			if (file.setReadOnly())
				success = true;
			else
				success = false;
		} catch (Exception e) {
			System.out.println("FileUtil.setReadOnly 出现异常：" + e.getMessage());
		}
		return success;
	}

	/**
	 * 获取文件/目录最后修改日期
	 * 
	 * @param path 文件/目录路径
	 * @return Date 如发生异常则返回<b>null</b>
	 * @date 2015-12-30
	 */
	public static Date getLastModifiedDate(String path) {
		try {
			File file = new File(path);
			return new Date(file.lastModified());
		} catch (Exception e) {
			System.out.println("FileUtil.lastModified 出现异常：" + e.getMessage());
			return null;
		}
	}

	/**
	 * 获取文件大小
	 * 
	 * @param path 文件路径
	 * @return Long 文件大小（Byte），如为文件夹则返回<b>0</b>，如发生异常则返回<b>null</b>
	 * @date 2015-12-30
	 */
	public static Long getFileSize(String path) {
		try {
			File file = new File(path);
			return file.length();
		} catch (Exception e) {
			System.out.println("FileUtil.getFileSize 出现异常：" + e.getMessage());
			return null;
		}
	}

	/**
	 * 获取目录大小
	 * 
	 * @param path 目录路径
	 * @return Long 目录大小（Byte），如发生异常则返回<b>null</b>
	 * @date 2015-12-31
	 */
	public static Long getDirectorySize(String path) {
		try {
			Long size = (long)0;
			for (File f : (new File(path)).listFiles()) {
				if (f.isFile())
					size += f.length();
				else if (f.isDirectory())
					size += getDirectorySize(f.getAbsolutePath());
			}
			return size;
		} catch (Exception e) {
			System.out.println("FileUtil.getDirectorySize 出现异常：" + e.getMessage());
			return null;
		}
	}

	/**
	 * 列出目录下的所有的子文件和子目录
	 * 
	 * @param path 目录路径
	 * @param isFile 是否列出子文件
	 * @param isDirectory 是否列出子目录
	 * @param isChildren 是否包含子目录内的子文件和子目录
	 * @param fileSuffix 文件后缀匹配（不匹配为<b>null</b>，多后缀匹配请使用分隔符<b>|</b>）
	 * @return List<File> 所有子文件和子目录列表，如发生异常则返回<b>null</b>
	 * @date 2015-12-30
	 */
	public static List<File> listChildren(String path, boolean isFile,
			boolean isDirectory, boolean isChildren, String fileSuffix) {
		try {
			List<File> fileList = new ArrayList<File>();
			File file = new File(path);
			for (File f : file.listFiles()) {
				if (isFile && f.isFile()) {
					if (fileSuffix == null) {
						fileList.add(f);
					} else {
						String[] names = f.getName().split("\\.");
						if (names.length >= 2 && fileSuffix.indexOf(names[names.length - 1]) > -1) {
							fileList.add(f);
						}
					}
				} else if (f.isDirectory()) {
					if (isDirectory)
						fileList.add(f);
					if (isChildren)
					fileList.addAll(listChildren(f.getAbsolutePath(), isFile, isDirectory, isChildren, fileSuffix));
				}
			}
			return fileList;
		} catch (Exception e) {
			System.out.println("FileUtil.listChildren 出现异常：" + e.getMessage());
			return null;
		}
	}

	/**
	 * 创建目录
	 * <p>如果不自动创建父目录，所需创建目录的父目录不存在则会返回<b>false</b></p>
	 * 
	 * @param path 所需创建的目录路径
	 * @param isAutoCreateParent 是否自动创建父目录
	 * @return Boolean <b>true</b> - 成功/目录已存在，<b>false</b> - 失败，<b>null</b> - 异常
	 * @date 2015-12-30
	 */
	public static Boolean createDirectory(String path, boolean isAutoCreateParent) {
		Boolean success = null;
		try {
			File file = new File(path);
			if (file.exists())
				success = true;
			else {
				if (isAutoCreateParent)
					success = file.mkdirs();
				else
					success = file.mkdir();
			}
		} catch (Exception e) {
			System.out.println("FileUtil.createDirectory 出现异常：" + e.getMessage());
		}
		return success;
	}

	/**
	 * 创建文件
	 * <p>如果不自动创建父目录，所需创建的文件的父目录不存在则会返回<b>false</b></p>
	 * 
	 * @param path 所需创建的文件的父目录路径
	 * @param filename 所需创建的文件的文件名
	 * @param isAutoCreateParent 是否自动创建父目录
	 * @return Boolean <b>true</b> - 成功/文件已存在，<b>false</b> - 失败，<b>null</b> - 异常
	 * @date 2015-12-30
	 */
	public static Boolean createFile(String path, String filename, boolean isAutoCreateParent) {
		Boolean success = null;
		try {
			File parent = new File(path);
			File file = new File(path + File.separator + filename);
			if (file.exists())
				success = true;
			else {
				if (!parent.exists() && isAutoCreateParent)
					parent.mkdirs();
				if(parent.exists())
					success = file.createNewFile();
				else
					success = false;
			}
		} catch (Exception e) {
			System.out.println("FileUtil.createFile 出现异常：" + e.getMessage());
		}
		return success;
	}

	/**
	 * 重命名文件/目录
	 * <p>所需重命名的文件/目录不存在则会返回<b>false</b></p>
	 * 
	 * @param path 文件/目录路径
	 * @param newfilename 新文件/目录名
	 * @return Boolean <b>true</b> - 成功，<b>false</b> - 失败，<b>null</b> - 异常
	 * @date 2015-12-30
	 */
	public static Boolean renameFile(String path, String newfilename) {
		Boolean success = null;
		try {
			File file = new File(path);
			File newfile = new File(file.getParent() + File.separator + newfilename);
			success = file.renameTo(newfile);
		} catch (Exception e) {
			System.out.println("FileUtil.renameFile 出现异常：" + e.getMessage());
		}
		return success;
	}

	/**
	 * 删除文件/目录
	 * <p>如果不删除子文件/子目录，所需删除的目录下存在子文件/子目录则会返回<b>false</b></p>
	 * 
	 * @param path 所需删除的文件/目录的路径
	 * @param isDeleteChildren 是否删除子文件/子目录
	 * @return Boolean <b>true</b> - 成功，<b>false</b> - 失败，<b>null</b> - 异常
	 * @date 2015-12-31
	 */
	public static Boolean deleteFile(String path, boolean isDeleteChildren) {
		Boolean success = null;
		try {
			File file = new File(path);
			if (isDeleteChildren && file.isDirectory()) {
				for (File f : file.listFiles()) {
					success = deleteFile(f.getAbsolutePath(), isDeleteChildren);
				}
			}
			success = file.delete();
		} catch (Exception e) {
			System.out.println("FileUtil.deleteFile 出现异常：" + e.getMessage());
		}
		return success;
	}

	/**
	 * 复制文件
	 * <p>覆盖优先于自动重命名</p>
	 * <p>如果不覆盖文件且不自动重命名，目标文件存在时则会返回<b>-1</b></p>
	 * 
	 * @param srcPath 源文件的路径
	 * @param distPath 目标文件的路径
	 * @param isOverWrite 是否覆盖文件
	 * @param isAutoRename 是否自动重命名（当文件已存在且不覆盖文件时生效）
	 * @return Long 复制总耗时（毫秒），如失败则返回<b>-1</b>，如发生异常则返回<b>null</b>
	 * @date 2015-12-31
	 */
	//使用文件通道的方式复制文件
	public static Long copyFile(String srcPath, String distPath,
			boolean isOverWrite, boolean isAutoRename) {
		try {
			Long startTime = System.currentTimeMillis();
			File srcFile = new File(srcPath);
			File distFile = new File(distPath);
			if (distFile.exists()) {
				if (!isOverWrite) {
					if (isAutoRename)
						distFile = autoRename(distFile);
					else
						return (long)-1;
				}
			}
			FileInputStream fi = new FileInputStream(srcFile);
	        FileOutputStream fo = new FileOutputStream(distFile);
	        FileChannel in = fi.getChannel();
	        FileChannel out = fo.getChannel();
	        in.transferTo(0, in.size(), out);
	        fi.close();
            in.close();
            fo.close();
            out.close();
			Long endTime = System.currentTimeMillis();
			return endTime - startTime;
		} catch (Exception e) {
			System.out.println("FileUtil.copyFile 出现异常：" + e.getMessage());
			return null;
		}
	}
	
	/**
	 * 复制目录;
	 * <p>覆盖优先于自动重命名</p>
	 * <p>如果不覆盖目录且不自动重命名，目标目录存在时则会返回<b>-1</b></p>
	 * <p>如果不覆盖子文件且不自动重命名，目标目录内存在同名子文件时则会<b>跳过</b></p>
	 * <p>如果不覆盖子目录且不自动重命名，目标目录内存在同名子目录时则会<b>跳过</b></p>
	 * 
	 * @param srcPath 源目录的路径
	 * @param distPath 目标目录的路径
	 * @param isOverWrite 是否覆盖目录
	 * @param isOverWriteChildrenFile 是否覆盖子文件
	 * @param isOverWriteChildrenDirectory 是否覆盖子目录
	 * @param isAutoRename 目录是否自动重命名（当目录已存在且不覆盖目录时生效）
	 * @param isAutoRenameChildrenFile 子文件是否自动重命名（当子文件已存在且不覆盖子文件时生效）
	 * @param isAutoRenameChildrenDirectory 子目录是否自动重命名（当子目录已存在且不覆盖子目录时生效）
	 * @return Long 复制总耗时（毫秒），如失败则返回<b>-1</b>，如发生异常则返回<b>null</b>
	 * @date 2015-12-31
	 */
	public static Long copyDirectory(String srcPath, String distPath,
			boolean isOverWrite, boolean isOverWriteChildrenFile, boolean isOverWriteChildrenDirectory,
			boolean isAutoRename, boolean isAutoRenameChildrenFile, boolean isAutoRenameChildrenDirectory) {
		try {
			Long startTime = System.currentTimeMillis();
			File srcFile = new File(srcPath);
			File distFile = new File(distPath);
			if (distFile.exists()) {
				if (!isOverWrite) {
					if (isAutoRename) {
						distFile = autoRename(distFile);
						distPath = distFile.getAbsolutePath();
					} else
						return (long)-1;
				}
			}
			distFile.mkdir();
			for (File f : srcFile.listFiles()) {
				if (f.isFile()) {
					copyFile(f.getAbsolutePath(), distPath + File.separator + f.getName(),
							isOverWriteChildrenFile, isAutoRenameChildrenFile);
				} else if (f.isDirectory()) {
					copyDirectory(f.getAbsolutePath(), distPath + File.separator + f.getName(),
							isOverWriteChildrenDirectory, isOverWriteChildrenFile, isOverWriteChildrenDirectory,
							isAutoRenameChildrenDirectory, isAutoRenameChildrenFile, isAutoRenameChildrenDirectory);
				}
			}
			Long endTime = System.currentTimeMillis();
			return endTime - startTime;
		} catch (Exception e) {
			System.out.println("FileUtil.copyDirectory 出现异常：" + e.getMessage());
			return null;
		}
	}
	
	/**
	 * 自动重命名文件/目录
	 * 
	 * @param file 文件对象
	 * @return File 重命名完的文件对象
	 * @date 2016-02-24
	 */
	private static File autoRename(File file) {
		String parentPath = file.getParent();
		String filename = null;
		String suffix = null;
		if (file.isFile() && file.getName().lastIndexOf(".") > -1) {
			filename = file.getName().substring(0, file.getName().lastIndexOf("."));
			suffix = file.getName().substring(file.getName().lastIndexOf(".") + 1);
		} else {
			filename = file.getName();
		}
		int i = 1;
		while (file.exists()) {
			file = new File(parentPath + File.separator
					+ filename + "(" + (i++) + ")"
					+ (suffix == null ? "" : "." + suffix));
		}
		return file;
	}
	
	/**
	 * 获取文件后缀（无后缀则返回null）
	 * 
	 * @param fileName 文件名
	 * @return String 后缀
	 * @date 2016-03-15
	 */
	public static String getSuffix(String fileName) {
		String suffix = null;
		if (fileName.lastIndexOf(".") > -1) {
			suffix = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
		}
		return suffix;
	}
	
	/**
	 * 自动重命名文件/目录
	 * 
	 * @param srcName 文件名
	 * @param checkNames 需要检测的重名列表
	 * @return String 重命名完的文件名
	 * @date 2016-02-23
	 */
	private static String autoRename(String srcName, String[] checkNames) {
		String sameName = null;
		List<Integer> similarNames = new ArrayList<Integer>();
		String _srcName = null;
		String srcSuffix = null;
		if (srcName.lastIndexOf(".") > -1) {
			_srcName = srcName.substring(0, srcName.lastIndexOf("."));
			srcSuffix = srcName.substring(srcName.lastIndexOf(".") + 1, srcName.length());
		}
		else {
			_srcName = srcName;
		}
		String regex = _srcName + "\\(\\d+\\)" + (srcSuffix == null ? ("") : ("." + srcSuffix));
		for (String name : checkNames) {
			if (name.equals(srcName)) {
				sameName = name;
				continue;
			}
			if (name.matches(regex)) {
				int end = name.lastIndexOf(")");
				if (srcSuffix != null) {
					String _name = name.substring(0, name.lastIndexOf("."));
					end = _name.lastIndexOf(")");
				}
				similarNames.add(Integer.valueOf(name.substring(_srcName.length() + 1, end)));
				continue;
			}
		}
		if (sameName == null)
			return srcName;
		else if (similarNames.size() == 0)
			return _srcName + "(1)" + (srcSuffix == null ? ("") : ("." + srcSuffix));
		else {
			Collections.sort(similarNames);
			return _srcName + "(" + (similarNames.get(similarNames.size() - 1) + 1) + ")" + (srcSuffix == null ? ("") : ("." + srcSuffix));
		}
	}
	
	/**
	 * 将输入流保存为文件
	 * <p>如果不自动创建父目录，所需创建的文件的父目录不存在则会返回<b>null</b></p>
	 * <p>既不覆盖文件也不自动重命名，如所需创建的文件已存在则会返回<b>null</b></p>
	 * 
	 * @param path 所需创建的文件的父目录路径
	 * @param filename 所需创建的文件的文件名
	 * @param inputStream 输入流
	 * @param isAutoCreateParent 是否自动创建父目录
	 * @param isOverWrite 是否覆盖文件
	 * @param isAutoRename 是否自动重命名（如选择覆盖文件则不生效）
	 * @param isCloseInputStream 是否要关闭传入的InputStream对象
	 * @return File 返回文件对象，<b>null</b> - 异常
	 * @date 2016-02-24
	 */
	public static File saveFile(String path, String filename, InputStream inputStream,
			boolean isAutoCreateParent, boolean isOverWrite, boolean isAutoRename,
			boolean isCloseInputStream) {
		File file = null;
		try {
			File parent = new File(path);
			file = new File(path + File.separator + filename);
			if (!parent.exists()) {
				if (isAutoCreateParent)
					parent.mkdirs();
				else {
					if (isCloseInputStream)
						inputStream.close();
					return null;
				}
			}
			if (file.exists()) {
				if (!isOverWrite) {
					if (isAutoRename)
						file = autoRename(file);
					else {
						if (isCloseInputStream)
							inputStream.close();
						return null;
					}
				}
			}
			OutputStream os = new FileOutputStream(file);
			int bytesRead = 0;
			byte[] buffer = new byte[8192];
			while ((bytesRead = inputStream.read(buffer, 0, 8192)) != -1) {
				os.write(buffer, 0, bytesRead);
			}
			os.close();
			if (isCloseInputStream)
				inputStream.close();
		} catch (Exception e) {
			System.out.println("FileUtil.saveFile 出现异常：" + e.getMessage());
		}
		return file;
	}
}

//class myFileFilter implements FileFilter{
//	@Override  
//    public boolean accept(File pathname) {  
//        String filename = pathname.getName().toLowerCase();
//        if(filename.contains(".txt")) {
//            return false;
//        } else {
//            return true;
//        }
//    }
//}
