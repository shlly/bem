package com.auchan.bem.bem_util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.ArchiveOutputStream;
import org.apache.commons.compress.archivers.ArchiveStreamFactory;
import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveInputStream;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;


/**
 * 压缩/解压类
 * <p>无需创建实体对象。</p>
 * 
 * @dependence org.apache.commons.compress
 * @maven org.apache.commons commons-compress 1.5
 * @date 2016-01-04
 * @author 郑冉
 *
 */
public class ZipUtil {
	
	/**
	 * 压缩文件/目录
	 * <p>按原有目录结构打包</p>
	 * <p>无法打包空目录！！</p>
	 * 
	 * @param srcPath 所需压缩文件/目录路径
	 * @param distPath 压缩包存放路径
	 * @return Long 压缩总耗时（毫秒），如失败则返回<b>-1</b>，如发生异常则返回<b>null</b>
	 * @date 2016-01-04
	 */
	public static Long zip(String srcPath, String distPath) {
		try {
			Long startTime = System.currentTimeMillis();
			
			FileOutputStream fos = new FileOutputStream(distPath);
			ArchiveOutputStream aos = new ArchiveStreamFactory().createArchiveOutputStream(ArchiveStreamFactory.ZIP, fos);
			ZipArchiveOutputStream zaos = (ZipArchiveOutputStream) aos;
			File file = new File(srcPath);
			zip(zaos, file, "", true);
			zaos.flush();
			zaos.finish();
			zaos.close();
			aos.close();
			fos.close();
			
			Long endTime = System.currentTimeMillis();
			return endTime - startTime;
		} catch (Exception e) {
			System.out.println("ZipUtil.zip 出现异常：" + e.getMessage());
			return null;
		}
	}
	
	/**
	 * 压缩文件
	 * <p>将文件打包成一个压缩包</p>
	 * <p>自动忽略目录结构和目录下子文件</p>
	 * 
	 * @param files 所需压缩文件列表
	 * @param distPath 压缩包存放路径
	 * @return Long 压缩总耗时（毫秒），如失败则返回<b>-1</b>，如发生异常则返回<b>null</b>
	 * @date 2016-01-04
	 */
	public static Long zip(File[] files, String distPath) {
		try {
			Long startTime = System.currentTimeMillis();
			
			FileOutputStream fos = new FileOutputStream(distPath);
			ArchiveOutputStream aos = new ArchiveStreamFactory().createArchiveOutputStream(ArchiveStreamFactory.ZIP, fos);
			ZipArchiveOutputStream zaos = (ZipArchiveOutputStream) aos;
			for (File f : files) {
				zip(zaos, f, "", false);
			}
			zaos.flush();
			zaos.finish();
			zaos.close();
			aos.close();
			fos.close();
			
			Long endTime = System.currentTimeMillis();
			return endTime - startTime;
		} catch (Exception e) {
			System.out.println("ZipUtil.zip 出现异常：" + e.getMessage());
			return null;
		}
	}
	
	/**
	 * 压缩文件
	 * <p>将文件打包成一个压缩包</p>
	 * <p>自动忽略目录结构和目录下子文件</p>
	 * 
	 * @param files 所需压缩文件列表
	 * @param distPath 压缩包存放路径
	 * @return Long 压缩总耗时（毫秒），如失败则返回<b>-1</b>，如发生异常则返回<b>null</b>
	 * @date 2016-01-04
	 */
	public static Long zip(List<File> files, String distPath) {
		try {
			Long startTime = System.currentTimeMillis();
			
			FileOutputStream fos = new FileOutputStream(distPath);
			ArchiveOutputStream aos = new ArchiveStreamFactory().createArchiveOutputStream(ArchiveStreamFactory.ZIP, fos);
			ZipArchiveOutputStream zaos = (ZipArchiveOutputStream) aos;
			for (File f : files) {
				zip(zaos, f, "", false);
			}
			zaos.flush();
			zaos.finish();
			zaos.close();
			aos.close();
			fos.close();
			
			Long endTime = System.currentTimeMillis();
			return endTime - startTime;
		} catch (Exception e) {
			System.out.println("ZipUtil.zip 出现异常：" + e.getMessage());
			return null;
		}
	}
	
	private static void zip(ZipArchiveOutputStream zaos, File file, String relativePath, boolean isDirectory) throws Exception {
		if (file.isFile()) {
			ZipArchiveEntry zipEntry = new ZipArchiveEntry(file, relativePath + file.getName());
			zaos.putArchiveEntry(zipEntry);
			//zaos.write(FileUtils.readFileToByteArray(file));
			InputStream is = new FileInputStream(file);
			byte[] buffer = new byte[1024 * 5];
			int len = -1;
			while((len = is.read(buffer)) != -1) {
				zaos.write(buffer, 0, len);
			}
			is.close();
			zaos.closeArchiveEntry();
		} else if (isDirectory && file.isDirectory()) {
			String newRelativePath = relativePath + file.getName();
//			ZipArchiveEntry zipEntry = new ZipArchiveEntry(file, newRelativePath);
//			zaos.putArchiveEntry(zipEntry);
//			zaos.closeArchiveEntry();
            zip(zaos, file.listFiles(), newRelativePath + File.separator, isDirectory);
		}
	}
	
	private static void zip(ZipArchiveOutputStream zaos, File[] files, String relativePath, boolean isDirectory) throws Exception {
		for (File file : files) {
			zip(zaos, file, relativePath, isDirectory);
		}
	}
	
	/**
	 * 解压缩
	 * 
	 * @param srcPath 压缩包所在路径
	 * @param distPath 解压文件存放路径
	 * @return Long 压缩总耗时（毫秒），如失败则返回<b>-1</b>，如发生异常则返回<b>null</b>
	 * @date 2016-01-04
	 */
	public static Long unzip(String srcPath, String distPath) {
		try {
			Long startTime = System.currentTimeMillis();
			
			File file = new File(srcPath);
			InputStream is = new FileInputStream(file);
			ZipArchiveInputStream zais = new ZipArchiveInputStream(is);
			ArchiveEntry archiveEntry = null;
			while((archiveEntry = zais.getNextEntry()) != null) {
				File entryFile = new File(distPath + File.separator+ archiveEntry.getName());
				if (archiveEntry.isDirectory())
					entryFile.mkdirs();
				else {
					entryFile.getParentFile().mkdirs();
					OutputStream os = new FileOutputStream(entryFile);
					byte[] buffer = new byte[1024 * 2];
					int len = -1;
					while((len = zais.read(buffer)) != -1) {
						os.write(buffer, 0, len);
	                }
					os.flush();
					os.close();
				}
			}
			zais.close();
			is.close();
			
			Long endTime = System.currentTimeMillis();
			return endTime - startTime;
		} catch (Exception e) {
			System.out.println("ZipUtil.unzip 出现异常：" + e.getMessage());
			return null;
		}
	}
}
