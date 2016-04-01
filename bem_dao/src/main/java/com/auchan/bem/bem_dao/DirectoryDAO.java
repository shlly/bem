package com.auchan.bem.bem_dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.auchan.bem.bem_pojo.entity.Directory;

/**
 * 目录类对应dao方法
 * 
 * @date 2016-02-24
 * @author 郑冉
 *
 */
public interface DirectoryDAO {
	
	/**
	 * 根据目录id删除目录
	 * <p>自动删除子目录</p>
	 * 
	 * @param id 目录id
	 * @return int 影响行数
	 */
    int deleteDirectory(Integer id);
	
	/**
	 * 插入删除目录
	 * <p>自动插入删除子目录</p>
	 * 
	 * @param id 目录id
	 * @param delUser 删除人
	 * @return int 影响行数
	 */
    int insertDelDirectory(@Param("id")Integer id, @Param("delUser")String delUser);

    /**
	 * 插入目录
	 * <p>插入非空列</p>
	 * 
	 * @param directory 目录类
	 * @return int 影响行数
	 */
    int insertSelective(Directory directory);

    /**
	 * 通过目录id获取目录
	 * 
	 * @param id 目录id
	 * @return Directoty 目录类
	 */
    Directory selectByPrimaryKey(Integer id);

    /**
	 * 根据目录id修改目录信息
	 * <p>修改非空列</p>
	 * 
	 * @param directory 目录类
	 * @return int 影响行数
	 */
    int updateByPrimaryKeySelective(Directory directory);
    
    /**
	 * 通过路径获取目录id
	 * 
	 * @param id 目录id
	 * @return Directoty 目录类
	 */
    Integer selectIdByPath(String path);
    
    /**
	 * 获取子目录
	 * 
	 * @param parentId 路径Id
	 * @return List&lt;Directory&gt; 目录列表
	 * @date 2016-02-25
	 */
	public List<Directory> selectDirectorysByParentId(Integer parentId);
	
	/**
	 * 通过目录id获取上级目录
	 * <p>id为空获取最上级目录</p>
	 * 
	 * @param id 目录id
	 * @return Directoty 上级目录类
	 * @date 2016-03-29
	 */
	Directory selectParentDirectory(Integer id);
	
	/**
	 * 通过目录名获取目录
	 * <p>name为空获取最上级目录</p>
	 * 
	 * @param name 目录名
	 * @return List&lt;Directory&gt; 目录列表
	 * @date 2016-03-29
	 */
	List<Directory> selectDirectoryByName(@Param("name")String name);
}