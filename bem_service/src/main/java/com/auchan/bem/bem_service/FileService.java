package com.auchan.bem.bem_service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import com.auchan.bem.bem_pojo.entity.File;
import com.auchan.bem.bem_pojo.entity.SortAttribute;

/**
 * 文件/目录service接口
 * 
 * @date 2016-02-25
 * @author 郑冉
 *
 */
public interface FileService {
	
	/**
	 * 获取主题下所有子文件
	 * 
	 * @param topicNo 主题编号
	 * @return List&lt;File&gt; 文件列表
	 * @param sort.limit 分页每页条数
	 * @param sort.offset 分页当前页码
	 * @param sort.sort 排序列名
	 * @param sort.order 排序顺序
	 * @date 2016-03-23
	 */
	public List<File> getTopicFiles(Short topicNo, SortAttribute sort);
	
	/**
	 * 获取主题下所有子文件总数
	 * 
	 * @param topicNo 主题编号
	 * @return int 文件列表总数
	 * @date 2016-03-23
	 */
	public int getTopicFilesTotal(Short topicNo);
	
	/**
	 * 文件搜索
	 * <p>除topicNO外全null为topic下最近3个月文件</p>
	 * 
	 * @param file.name 文件名
	 * @param file.topic.topicNo 主题编号
	 * @param file.division.divisionNo 处编号
	 * @param file.section.sectionNo 部门编号
	 * @param dateFrom 日期范围
	 * @param dateTo 日期范围
	 * @param topicNo 主题编号
	 * @param sort.limit 分页每页条数
	 * @param sort.offset 分页当前页码
	 * @param sort.sort 排序列名
	 * @param sort.order 排序顺序
	 * @return List&lt;File&gt; 文件列表
	 * @date 2016-03-03
	 */
	public List<File> searchFiles(File file, Integer topicNo, String dateFrom, String dateTo, SortAttribute sort);
	
	/**
	 * 文件搜索总行数
	 * <p>除topicNO外全null为topic下最近3个月文件</p>
	 * 
	 * @param file.name 文件名
	 * @param file.topic.topicNo 主题编号
	 * @param file.division.divisionNo 处编号
	 * @param file.section.sectionNo 部门编号
	 * @param dateFrom 日期范围
	 * @param dateTo 日期范围
	 * @param topicNo 主题编号
	 * @return int 文件总数
	 * @date 2016-03-08
	 */
	public int searchFilesTotal(File file, Integer topicNo, String dateFrom, String dateTo);
	
	/**
	 * 文件上传
	 * 
	 * @param inputStream 文件流
	 * @param file.name 文件名
	 * @param file.fileSize 文件大小
	 * @param file.sizeUnit 文件大小单位
	 * @param file.topic.topicNo 文件所属主题编号
	 * @param file.division.divisionNo 文件所属处编号
	 * @param file.section.sectionNo 文件所属部门编号
	 * @param file.otherStoreView 其他门店是否可浏览文件
	 * @param storeNo 文件所属门店编号
	 * @return boolean 上传是否成功
	 * @date 2016-03-15
	 */
	public boolean uploadFile(File file, String storeNo, InputStream inputStream);
	
	/**
	 * 文件删除
	 * 
	 * @param deleteFilesId 需要删除文件id列表
	 * @param username 删除人
	 * @return boolean 删除是否成功
	 * @date 2016-03-15
	 */
	public boolean deleteFiles(List<Integer> deleteFilesId, String username);
	
	/**
	 * 获取主题文件汇总信息
	 * 
	 * @param month 最近月份数
	 * @return List&lt;Map&gt; 汇总信息map
	 * @date 2016-03-15
	 */
	public List<Map<String, Object>> getRecentSummary(int month);
	
	/**
	 * 下载文件
	 * 
	 * @param fileId 文件id
	 * @return java.io.File 文件对象
	 * @date 2016-03-21
	 */
	public java.io.File downloadFile(Integer fileId);
}
