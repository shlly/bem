package com.auchan.bem.bem_service.impl;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.auchan.bem.bem_dao.DirectoryDAO;
import com.auchan.bem.bem_dao.FileDAO;
import com.auchan.bem.bem_dao.TopicDAO;
import com.auchan.bem.bem_dao.TypeIconDAO;
import com.auchan.bem.bem_pojo.entity.Directory;
import com.auchan.bem.bem_pojo.entity.File;
import com.auchan.bem.bem_pojo.entity.SortAttribute;
import com.auchan.bem.bem_pojo.entity.Topic;
import com.auchan.bem.bem_pojo.entity.TypeIcon;
import com.auchan.bem.bem_service.FileService;
import com.auchan.bem.bem_util.ConfigUtil;
import com.auchan.bem.bem_util.FileUtil;
import com.auchan.bem.bem_util.LdapUtil;

/**
 * 文件/目录service实现类
 * 
 * @date 2016-02-25
 * @author 郑冉
 *
 */
@Service
public class FileServiceImpl implements FileService {
	
	@Resource
	FileDAO fileDAO;
	@Resource
	DirectoryDAO directoryDAO;
	@Resource
	TopicDAO topicDAO;
	@Resource
	TypeIconDAO typeIconDAO;

	@Override
	public List<File> getTopicFiles(Short topicNo, SortAttribute sort) {
		if (sort.getOffset() == null)
			sort.setOffset(0);
		sort.setSort(fileName2Column(sort.getSort()));
		Topic topic = topicDAO.selectByPrimaryKey(topicNo);
		if (topic.getDirectory().getId() != null) {
			Integer storeNo = getStore();
			if (storeNo != null)
				return fileDAO.selectFilesByParentId(topic.getDirectory().getId(), storeNo, sort);
		}
		return null;
	}

	@Override
	public int getTopicFilesTotal(Short topicNo) {
		Topic topic = topicDAO.selectByPrimaryKey(topicNo);
		if (topic.getDirectory().getId() != null) {
			Integer storeNo = getStore();
			if (storeNo != null)
				return fileDAO.selectFilesByParentIdTotal(topic.getDirectory().getId(), storeNo);
		}
		return 0;
	}

	@Override
	public List<File> searchFiles(File file, Integer topicNo,
			String dateFrom, String dateTo, SortAttribute sort) {
		if (sort.getOffset() == null)
			sort.setOffset(0);
		sort.setSort(fileName2Column(sort.getSort()));
		Integer storeNo = getStore();
		if ((file == null || (file.getName() == null
				&& file.getTopic() == null && file.getDirectory() == null
				&& file.getSection() == null))
				&& dateFrom == null && dateTo == null) {
			if (storeNo != null)
				return fileDAO.selectRecentFiles(-3, storeNo, topicNo, sort);
		}
		else {
			if (storeNo != null)
				return fileDAO.selectFiles(storeNo, file, dateFrom, dateTo, sort);
		}
		return null;
	}

	@Override
	public int searchFilesTotal(File file, Integer topicNo, String dateFrom, String dateTo) {
		Integer storeNo = getStore();
		if ((file == null || (file.getName() == null
				&& file.getTopic() == null && file.getDirectory() == null
				&& file.getSection() == null))
				&& dateFrom == null && dateTo == null) {
			if (storeNo != null)
				return fileDAO.selectRecentFilesTotal(-3, storeNo, topicNo);
		}
		else {
			if (storeNo != null)
				return fileDAO.selectFilesTotal(storeNo, file, dateFrom, dateTo);
		}
		return 0;
	}

	@Override
	public boolean uploadFile(File file, String storeNo, InputStream inputStream) {
		file.setTypeIcon(new TypeIcon());
		Short typeId = typeIconDAO.selectTypeIdBySuffix(FileUtil.getSuffix(file.getName()));
		if (typeId == null)
			typeId = typeIconDAO.selectUnKnownTypeId();
		file.getTypeIcon().setTypeId(typeId);
		file.setTopic(topicDAO.selectByPrimaryKey(file.getTopic().getTopicNo()));
		file.setDirectory(new Directory());
		file.getDirectory().setId(file.getTopic().getDirectory().getId());
		java.io.File newFile = FileUtil.saveFile(
				ConfigUtil.get("localFile", "materialPath") + file.getTopic().getDirectory().getPath(),
				file.getName(), inputStream, false, false, true, true);
		if (newFile != null) {
			file.setName(newFile.getName());
			if (fileDAO.insertFile(file) == 1) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("storeNo", storeNo);
				map.put("storeNoSuffix", ",");
				map.put("fileId", file.getId());
				fileDAO.insertFileStore(map);
				if ((int) map.get("count") > 0)
					return true;
			}
		}
		return false;
	}

	@Override
	public boolean deleteFiles(List<Integer> deleteFilesId, String username) {
		for (int id : deleteFilesId) {
			File delFile = fileDAO.selectByPrimaryKey(id);
			if (fileDAO.deleteById(id) == 1) {
				if (fileDAO.insertDeleteFile(delFile, username) == 1) {
					FileUtil.deleteFile(
							ConfigUtil.get("localFile", "materialPath")
							+ delFile.getDirectory().getPath()
							+ "/" + delFile.getName(), false);
					fileDAO.insertDelFileStore(delFile.getId());
					fileDAO.deleteFileStore(delFile.getId());
				}
			}
		}
		return true;
	}
	
	@Override
	public List<Map<String, Object>> getRecentSummary(int month) {
		return fileDAO.selectRecentSummary(month);
	}
	
	@Override
	public java.io.File downloadFile(Integer fileId) {
		File file = fileDAO.selectByPrimaryKey(fileId);
		String path = ConfigUtil.get("localFile", "materialPath")
				+ file.getDirectory().getPath() + "/" + file.getName();
		if (FileUtil.isExists(path)) {
			fileDAO.updateDownloadTimes(fileId);
			return new java.io.File(path);
		} else
			return null;
	}
	
	/**
	 * 处理管理员特殊权限
	 * 将管理员storeNo赋值成为-1来获取所有文件
	 * 
	 * @return Integer 门店编号
	 */
	private static Integer getStore() {
		Integer storeNo = null;
		if (LdapUtil.findUserAuthority("ROLE_ADMIN")) {
			storeNo = -1;
		}
		else {
			try {
				storeNo = Integer.valueOf(LdapUtil.getUserInfo("STORE").get(0));
			} catch (Exception e) {}
		}
		return storeNo;
	}
	
	/**
	 * File类属性名转换成列名
	 * 
	 * @param name 属性名
	 * @return String 列名
	 */
	private static String fileName2Column(String name) {
		if (name == null) {
			return null;
		}
		else if (name.equals("name")) {
			return "NAME";
		} else if (name.equals("topic.name")) {
			return "TOPIC_NAME";
		} else if (name.equals("division.name")) {
			return "DIVISION_NAME";
		} else if (name.equals("section.name")) {
			return "SECTION_NAME";
		} else if (name.equals("createDate")) {
			return "CREATE_DATE";
		} else if (name.equals("downloadTimes")) {
			return "DOWNLOAD_TIMES";
		} else {
			return null;
		}
	}
}
