package com.auchan.bem.bem_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.auchan.bem.bem_pojo.entity.File;
import com.auchan.bem.bem_pojo.entity.SortAttribute;

/**
 * 文件类对应dao方法
 * 
 * @date 2016-02-24
 * @author 郑冉
 *
 */
public interface FileDAO {
    /**
	 * 插入文件
	 * 
	 * @param file 文件类
	 * @return int 影响行数
	 */
    public int insertFile(File file);

    /**
	 * 通过文件id获取文件
	 * 
	 * @param id 文件id
	 * @return File 文件类
	 */
    public File selectByPrimaryKey(Integer id);
    
    /**
	 * 获取子文件
	 * 
	 * @param parentId 路径Id
	 * @param storeNo 门店编号(-1为管理员)
	 * @param sort.limit 分页每页条数
	 * @param sort.offset 分页当前页码
	 * @param sort.sort 排序列名
	 * @param sort.order 排序顺序
	 * @return List&lt;File&gt; 文件列表
	 * @date 2016-03-23
	 */
	public List<File> selectFilesByParentId(@Param("parentId")Integer parentId, @Param("storeNo")Integer storeNo,
			@Param("sort")SortAttribute sort);
	
	/**
	 * 获取子文件总数
	 * 
	 * @param parentId 路径Id
	 * @param storeNo 门店编号(-1为管理员)
	 * @return int 文件列表总数
	 * @date 2016-03-23
	 */
	public int selectFilesByParentIdTotal(@Param("parentId")Integer parentId, @Param("storeNo")Integer storeNo);
	
	/**
	 * 获取主题最近文件
	 * 
	 * @param month 最近月份数
	 * @param storeNo 门店编号(-1为管理员)
	 * @param topicNo 主题编号
	 * @param sort.limit 分页每页条数
	 * @param sort.offset 分页当前页码
	 * @param sort.sort 排序列名
	 * @param sort.order 排序顺序
	 * @return List&lt;File&gt; 文件列表
	 * @date 2016-03-24
	 */
	public List<File> selectRecentFiles(@Param("month")int month, @Param("storeNo")Integer storeNo,
			@Param("topicNo")Integer topicNo, @Param("sort")SortAttribute sort);
	
	/**
	 * 获取主题最近文件总数
	 * 
	 * @param month 最近月份数
	 * @param storeNo 门店编号(-1为管理员)
	 * @param topicNo 主题编号
	 * @return int 文件总数
	 * @date 2016-03-24
	 */
	public int selectRecentFilesTotal(@Param("month")int month, @Param("storeNo")Integer storeNo,
			@Param("topicNo")Integer topicNo);
	
	/**
	 * 搜索文件
	 * 
	 * @param storeNo 门店编号(-1为管理员)
	 * @param file.name 文件名
	 * @param file.topic.topicNo 主题编号
	 * @param file.division.divisionNo 处编号
	 * @param file.section.sectionNo 部门编号
	 * @param startDate 日期范围
	 * @param endDate 日期范围
	 * @param sort.limit 分页每页条数
	 * @param sort.offset 分页当前页码
	 * @param sort.sort 排序列名
	 * @param sort.order 排序顺序
	 * @return List&lt;File&gt; 文件列表
	 * @date 2016-02-25
	 */
	public List<File> selectFiles(@Param("storeNo")Integer storeNo, @Param("file")File file,
			@Param("startDate")String startDate, @Param("endDate")String endDate,
			@Param("sort")SortAttribute sort);
	
	/**
	 * 搜索文件总数
	 * 
	 * @param storeNo 门店编号(-1为管理员)
	 * @param file.name 文件名
	 * @param file.topic.topicNo 主题编号
	 * @param file.division.divisionNo 处编号
	 * @param file.section.sectionNo 部门编号
	 * @param startDate 日期范围
	 * @param endDate 日期范围
	 * @return int 文件列表总数
	 * @date 2016-03-08
	 */
	public int selectFilesTotal(@Param("storeNo")Integer storeNo, @Param("file")File file,
			@Param("startDate")String startDate, @Param("endDate")String endDate);
	
	/**
	 * 将删除文件信息插入删除文件表
	 * 
	 * @param deleteFilesId 删除文件id列表 
	 * @param username 删除者用户名
	 * @return int 影响行数
	 * @date 2016-03-15
	 */
	public int insertDeleteFilesById(@Param("deleteFilesId")List<Integer> deleteFilesId, @Param("username")String username);
	
	/**
	 * 从文件表删除文件数据
	 * 
	 * @param deleteFilesId 删除文件id列表 
	 * @return int 影响行数
	 * @date 2016-03-15
	 */
	public int deleteByIds(@Param("deleteFilesId")List<Integer> deleteFilesId);
	
	/**
	 * 将删除文件信息插入删除文件表
	 * 
	 * @param deleteFileId 删除文件id列表 
	 * @param username 删除者用户名
	 * @return int 影响行数
	 * @date 2016-03-15
	 */
	public int insertDeleteFileById(@Param("deleteFileId")Integer deleteFileId, @Param("username")String username);
	
	/**
	 * 从文件表删除文件数据
	 * 
	 * @param deleteFileId 删除文件id列表 
	 * @return int 影响行数
	 * @date 2016-03-15
	 */
	public int deleteById(@Param("deleteFileId")Integer deleteFileId);
	
	/**
	 * 插入删除文件
	 * 
	 * @param file 文件类
	 * @param username 删除者用户名
	 * @return int 影响行数
	 * @date 2016-03-15
	 */
	public int insertDeleteFile(@Param("file")File file, @Param("username")String username);
	
	/**
	 * 获取主题文件汇总信息
	 * 
	 * @param month 最近月份数
	 * @return List&lt;Map&gt; 汇总信息map
	 * @date 2016-03-15
	 */
	public List<Map<String, Object>> selectRecentSummary(@Param("month")int month);
	
	/**
	 * 更新下载次数
	 * 
	 * @param id 文件id
	 * @return int 影响行数
	 * @date 2016-03-21
	 */
	public int updateDownloadTimes(Integer id);
	
	/**
	 * 插入文件-门店关联信息
	 * 
	 * @param map.storeNo 门店编号
	 * @param map.storeNoSuffix 门店编号分隔符
	 * @param map.fileId 文件id
	 * @return map.count 影响行数
	 * @date 2016-03-23
	 * 
	 */
	public void insertFileStore(Map<String, Object> map);
	
	/**
	 * 插入删除文件-门店关联信息
	 * 
	 * @param fileId 文件id
	 * @return int 影响行数
	 * @date 2016-03-24
	 * 
	 */
	public int insertDelFileStore(@Param("fileId")Integer fileId);
	
	/**
	 * 删除文件-门店关联信息
	 * 
	 * @param fileId 文件id
	 * @return int 影响行数
	 * @date 2016-03-24
	 */
	public int deleteFileStore(@Param("fileId")Integer fileId);
}