package com.auchan.bem.bem_service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.auchan.bem.bem_dao.DirectoryDAO;
import com.auchan.bem.bem_dao.TopicDAO;
import com.auchan.bem.bem_pojo.entity.Directory;
import com.auchan.bem.bem_pojo.entity.Topic;
import com.auchan.bem.bem_service.TopicService;
import com.auchan.bem.bem_util.ConfigUtil;
import com.auchan.bem.bem_util.FileUtil;
import com.auchan.bem.bem_util.LdapUtil;

/**
 * 主题service实现类
 * 
 * @date 2016-02-23
 * @author 郑冉
 *
 */
@Service
public class TopicServiceImpl implements TopicService {
	
	@Resource
	private TopicDAO topicDAO;
	@Resource
	private DirectoryDAO directoryDAO;

	@Override
	public void initTopicDirectory() {
		String rootPath = ConfigUtil.get("localFile", "materialPath");
		String parentPath = ConfigUtil.get("localFile", "materialPath") + directoryDAO.selectParentDirectory(null).getPath();
		if (!FileUtil.isExists(parentPath)) {
			FileUtil.createDirectory(parentPath, true);
			List<Topic> topics = topicDAO.selectTopicByParentNo(null);
			for(Topic topic : topics) {
				FileUtil.createDirectory((rootPath + topic.getDirectory().getPath()).replace("/", "\\"), true);
				for (Topic ct : topic.getChildTopic()) {
					FileUtil.createDirectory((rootPath + ct.getDirectory().getPath()).replace("/", "\\"), true);
				}
			}
		}
	}

	@Override
	public List<Topic> getTopicByParentNo(Short topicNo, boolean isChild) {
		List<Topic> topics = topicDAO.selectTopicByParentNo(topicNo);
//		if (isChild)
//			getChildtTopic(topics);
		return topics;
	}
	
	@Override
	public boolean addTopic(Topic topic) {
		boolean result = false;
		
		topic.setTopicNo(topicDAO.selectTopicNo());
		topic.setCreateUser(LdapUtil.getUserName());
		if (topic.getParentTopicNo() == -1)
			topic.setParentTopicNo(null);
		Directory dir = new Directory();
		dir.setName(topic.getTopicNo().toString());
		dir.setCreateUser(LdapUtil.getUserName());
		// 获取上级目录
		List<Directory> parentDirs = directoryDAO.selectDirectoryByName(topic.getParentTopicNo() == null ? null : topic.getParentTopicNo().toString());
		
		if (parentDirs != null && parentDirs.size() == 1) {
			dir.setPath(parentDirs.get(0).getPath() + "/" + topic.getTopicNo());
			dir.setParentPathId(parentDirs.get(0).getId());
			// 创建本地目录
			if (FileUtil.createDirectory(
					ConfigUtil.get("localFile", "materialPath") + dir.getPath(), false)) {
				// 目录插入数据库
				if (directoryDAO.insertSelective(dir) == 1) {
					topic.setDirectory(dir);
					short endLevel = -1;
					if (topic.getParentTopicNo() == null) {
						endLevel = 99;
					}
					else {
						String il = topic.getImportantLevel().toString();
						endLevel = Short.valueOf(il.substring(0, il.length() - 2) + "99");
					}
					// 下移主题等级
					topicDAO.updateDownImportantLevel(topic.getImportantLevel(), endLevel);
					topicDAO.updateChildImportantLevel();
					// 主题插入数据库
					result = topicDAO.insertTopic(topic) == 1 ? true : false;
				}
			}
		}
		
		// 文件名非法字符问题注意！！
//		FtpUtil ftp = new FtpUtil(ConfigUtil.get("ftp", "url"), Integer.valueOf(ConfigUtil.get("ftp", "port")),
//				ConfigUtil.get("ftp", "username"), ConfigUtil.get("ftp", "password"));
//		ftp.conn();
//		String parentPath = ConfigUtil.get("ftp", "materialPath");
//		result = ftp.createDirectory(parentPath, topic.getName().toString());
//		ftp.close();
//		if (result) {
//			result = false;
//			Directory dir = new Directory();
//			dir.setName(topic.getName());
//			dir.setCreateUser("sys");
//			dir.setPath(parentPath + "/" + topic.getName().toString());
//			Integer parentPathId = directoryDAO.selectIdByPath(parentPath);
//			if (parentPathId != null) {
//				dir.setParentPathId(parentPathId);
//				dir.setCreateDate(new Date());
//				if (directoryDAO.insertSelective(dir) == 1 && dir.getId() != null) {
//					topic.setDirectory(dir);
//					topic.setCreateDate(new Date());
//					result = topicDAO.insertSelective(topic) == 1 ? true: false;
//				}
//			}
//		}
		return result;
	}

	@Override
	public boolean editTopic(Topic topic) {
		boolean result = false;
		topic.setStatus(null);
		Topic oldTopic = topicDAO.selectByPrimaryKey(topic.getTopicNo());
//		if (topic.getParentTopicNo() != -1) {
//			// 若更改父主题则移动目录位置
//			if (!topic.getParentTopicNo().equals(oldTopic.getParentTopicNo())) {
//				Directory newDir = directoryDAO.selectByPrimaryKey(
//						topicDAO.selectByPrimaryKey(topic.getParentTopicNo()).getDirectory().getId());
//				topic.setDirectory(newDir);
//				Directory oldDir = directoryDAO.selectByPrimaryKey(oldTopic.getDirectory().getId());
//				// 复制源目录至目录
//				result = FileUtil.copyDirectory(
//						ConfigUtil.get("localFile", "materialPath") + oldDir.getPath(),
//						ConfigUtil.get("localFile", "materialPath") + newDir.getPath(),
//						false, false, false, false, false, false) >= 0;
//				// 删除源目录
//				if (result) {
//					result = FileUtil.deleteFile(ConfigUtil.get("localFile", "materialPath") + oldDir.getPath(), true);
//				}
//			}
//			else
//				result = true;
//		}
//		else {
//			topic.setParentTopicNo(null);
//			result = true;
//		}
		topic.setParentTopicNo(null);
		result = true;
		if (result) {
			// 变更主题位置，上/下移其他主题等级
			if (topic.getImportantLevel() > oldTopic.getImportantLevel()) {
				result = topicDAO.updateUpImportantLevel(
						(short) (oldTopic.getImportantLevel() + 1),
						topic.getImportantLevel()) ==
								(topic.getImportantLevel() - oldTopic.getImportantLevel()) ? true : false;
			}
			else if (topic.getImportantLevel() < oldTopic.getImportantLevel()) {
				result = topicDAO.updateDownImportantLevel(
						topic.getImportantLevel(),
						(short) (oldTopic.getImportantLevel() - 1)) ==
								(oldTopic.getImportantLevel() - topic.getImportantLevel()) ? true : false;
			}
			else
				result = true;
			topicDAO.updateChildImportantLevel();
			if (result) {
				topic.setLastChangeUser(LdapUtil.getUserName());
				// 更新主题
				result = topicDAO.updateTopic(topic) == 1 ? true : false;
				topicDAO.updateChildImportantLevel();
			}
		}
		return result;
	}

	@Override
	public Topic getTopic(Short topicNo) {
		return topicDAO.selectByPrimaryKey(topicNo);
	}

	@Override
	public boolean deleteTopic(Short topicNo) {
		boolean result = false;
		if (topicNo != null) {
			Topic oldTopic = topicDAO.selectByPrimaryKey(topicNo);
			if (oldTopic != null) {
				Topic t = new Topic();
				t.setTopicNo(topicNo);
				t.setStatus((short) 0);
				if (topicDAO.updateTopic(t) > 0) {
					result = true;
					Directory oldDir = directoryDAO.selectByPrimaryKey(oldTopic.getDirectory().getId());
					directoryDAO.insertDelDirectory(oldDir.getId(), LdapUtil.getUserName());
					if (directoryDAO.deleteDirectory(oldDir.getId()) > 0) {
						FileUtil.deleteFile(
								ConfigUtil.get(
										"localFile", "materialPath") + oldDir.getPath(), true);
					}
				}
			}
		}
		return result;
	}
	
//	private void getChildtTopic(List<Topic> topics) {
//		for (Topic topic : topics) {
//			topic.setChildTopic(topicDAO.selectTopicByParentNo(topic.getTopicNo()));
//			getChildtTopic(topic.getChildTopic());
//		}
//	}
	
}
