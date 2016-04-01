package bem_web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.auchan.bem.bem_dao.AreaDAO;
import com.auchan.bem.bem_dao.DirectoryDAO;
import com.auchan.bem.bem_dao.DivisionDAO;
import com.auchan.bem.bem_dao.FileDAO;
import com.auchan.bem.bem_dao.TopicDAO;
import com.auchan.bem.bem_pojo.entity.Area;
import com.auchan.bem.bem_pojo.entity.Directory;
import com.auchan.bem.bem_pojo.entity.Division;
import com.auchan.bem.bem_pojo.entity.Section;
import com.auchan.bem.bem_pojo.entity.Topic;
import com.auchan.bem.bem_service.FileService;
import com.auchan.bem.bem_service.TopicService;
import com.auchan.bem.bem_util.ConfigUtil;
import com.auchan.bem.bem_util.FileUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class test {
	
	@Resource
	FileDAO fileDAO;
	@Resource
	DirectoryDAO directoryDAO;
	@Resource
	TopicDAO topicDAO;
	@Resource
	TopicService topicService;
	@Resource
	FileService fileService;
	@Resource
	DivisionDAO divisionDAO;
	@Resource
	AreaDAO areaDAO;
	
	// @Test
	public void fileDAOTest() {
//		File file = fileDAO.selectByPrimaryKey(4);
		int count = -1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("storeNo", "101,102,103");
		map.put("storeNoSuffix", ",");
		map.put("fileId", 99999);
		fileDAO.insertFileStore(map);
	}
	
	//@Test
	public void directoryDAOTest() {
		Directory directory = directoryDAO.selectByPrimaryKey(1);
//		directory.getDirectorys();
//		directory.getFiles();
		System.out.println();
	}
	
	@Test
	public void topicServiceTest() {
//		Topic topic = new Topic();
//		topic.setCreateUser("zhengran");
//		topic.setName("Other");
//		System.out.println(topicService.addTopic(topic));
//		System.out.println();
		
//		String rootPath = ConfigUtil.get("localFile", "materialPath");
//		List<Topic> topics = topicDAO.selectTopicByParentNo(null);
//		for(Topic topic : topics) {
//			FileUtil.createDirectory((rootPath + topic.getDirectory().getPath()).replace("/", "\\"), true);
//			for (Topic ct : topic.getChildTopic()) {
//				FileUtil.createDirectory((rootPath + ct.getDirectory().getPath()).replace("/", "\\"), true);
//			}
//		}
		
		topicService.initTopicDirectory();
	}
	
	// @Test
	public void fileServiceTest() {
//		Map<String, Object> map = fileService.getAll(1);
		System.out.println();
		
		//List<File> files = fileService.getFiles(1);
		
		System.out.println();
	}
	
	//@Test
	public void divisionDAOTest() {
		List<Division> division = divisionDAO.selectAll();
		List<Section> section = divisionDAO.selectSectionByDivisionNo(Short.parseShort("1"));
		System.out.println(section.size());
	}
	
	//@Test
	public void areaDAOTest() {
		List<Area> areas = areaDAO.selectAll();
		System.out.println(areas.size());
	}
}
