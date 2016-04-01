package com.auchan.bem.bem_web.controller;

import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.auchan.bem.bem_pojo.entity.File;
import com.auchan.bem.bem_pojo.entity.SortAttribute;
import com.auchan.bem.bem_service.FileService;
import com.auchan.bem.bem_util.LdapUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 文件管理controller
 * 
 * @url /file
 * @date 2016-02-22
 * @author 郑冉
 *
 */
@Controller  
@RequestMapping("file")
public class FileController {
	
	@Resource
	FileService fileService;
	
	/**
	 * 首页
	 * 
	 * @url /file
	 * @method get/post
	 * @return file/index.jsp
	 * @date 2016-02-22
	 */
	@RequestMapping("")
	public String index(ModelMap model) {
		model.addAttribute("pageTitle", "文件管理/File Manage");
		model.addAttribute("breadcrumbs", new String[][] {{"File Manage"}});
		model.addAttribute("leftbar", "2");
		return "file/index";
	}
	
	/**
	 * 上传页面
	 * 
	 * @url /file/fastUpload
	 * @method get
	 * @return file/fastUpload.jsp
	 * @date 2016-03-22
	 */
	@RequestMapping("fastUpload")
	public String uploadGet(ModelMap model) {
		model.addAttribute("pageTitle", "文件上传/File Upload");
		model.addAttribute("breadcrumbs", new String[][] {{"Fast Operation"}, {"File Upload"}});
		model.addAttribute("leftbar", "3");
		return "file/fastUpload";
	}
	
	/**
	 * 主题文件汇总信息
	 * 
	 * @url /file/fileSummary
	 * @method get/post
	 * @return json 汇总信息map
	 * @date 2016-03-15
	 */
	@RequestMapping("fileSummary")
	@ResponseBody
	public String fileSummary() {
		return JSONArray.fromObject(fileService.getRecentSummary(-3)).toString();
	}
	
	/**
	 * 文件搜索
	 * <p>除topicNO外全null为topic下最近3个月文件</p>
	 * 
	 * @param file.name 文件名
	 * @param file.topic.topicNo 主题编号
	 * @param file.division.divisionNo 处编号
	 * @param file.section.sectionNo 部门编号
	 * @param topicNo 主题编号
	 * @param dateFrom 日期范围
	 * @param dateTo 日期范围
	 * @param sort.limit 分页每页条数
	 * @param sort.offset 分页当前页码
	 * @param sort.sort 排序列名
	 * @param sort.order 排序顺序
	 * @url /file/search
	 * @method get/post
	 * @return json 所有文件列表
	 * @date 2016-03-08
	 */
	@RequestMapping("search")
	@ResponseBody
	public String search(@ModelAttribute File file,
			Integer topicNo,
			String dateFrom, String dateTo,
			@ModelAttribute SortAttribute sort) {
		JSONObject json = new JSONObject();
		json.put("total", fileService.searchFilesTotal(file, topicNo, dateFrom, dateTo));
		json.put("rows", fileService.searchFiles(file, topicNo, dateFrom, dateTo, sort));
		return json.toString();
	}
	
	/**
	 * 获取主题下所有文件/目录
	 * 
	 * @param topicNo 主题编号
	 * @param sort.limit 分页每页条数
	 * @param sort.offset 分页当前页码
	 * @param sort.sort 排序列名
	 * @param sort.order 排序顺序
	 * @url /file/getTopicFiles
	 * @method get/post
	 * @return json 所有文件列表
	 * @date 2016-02-25
	 */
	@RequestMapping("getTopicFiles")
	@ResponseBody
	public String getTopicFiles(Short topicNo, @ModelAttribute SortAttribute sort) {
		if (topicNo == null)
			return null;
		else {
			JSONObject json = new JSONObject();
			json.put("total", fileService.getTopicFilesTotal(topicNo));
			json.put("rows", fileService.getTopicFiles(topicNo, sort));
			return json.toString();
		}
	}
	
	/**
	 * 文件上传
	 * 
	 * @param request 文件流
	 * @param file.name 文件名
	 * @param file.fileSize 文件大小
	 * @param file.sizeUnit 文件大小单位
	 * @param file.topic.topicNo 文件所属主题编号
	 * @param file.division.divisionNo 文件所属处编号
	 * @param file.section.sectionNo 文件所属部门编号
	 * @param file.store.storeNo 文件所属门店编号
	 * @param file.otherStoreView 其他门店是否可浏览文件
	 * @url /file/uploadFiles
	 * @method post
	 * @return boolean 上传是否成功
	 * @date 2016-03-15
	 */
	@RequestMapping(value="uploadFiles", method=RequestMethod.POST)
	@ResponseBody
	public boolean uploadFiles(MultipartHttpServletRequest request,
			@ModelAttribute File file,
			String storeNo) throws Exception {
		Iterator<String> itr = request.getFileNames();
		InputStream is = null;
        while (itr.hasNext()) {
            String uploadedFile = itr.next();
            is = request.getFile(uploadedFile).getInputStream();
            break;
        }
        file.setCreateUser(LdapUtil.getUserName());
        return fileService.uploadFile(file, storeNo, is);
	}
	
	/**
	 * 文件删除
	 * 
	 * @param deleteFilesId 需要删除文件id列表
	 * @url /file/uploadFiles
	 * @method post
	 * @return boolean 删除是否成功
	 * @date 2016-03-15
	 */
	@RequestMapping(value="deleteFiles", method=RequestMethod.POST)
	@ResponseBody
	public boolean deleteFiles(@RequestParam("deleteFilesId[]")List<Integer> deleteFilesId) {
		return fileService.deleteFiles(deleteFilesId, LdapUtil.getUserName());
	}
	
	/**
	 * 文件下载
	 * 
	 * @param fileId 文件id
	 * @url /file/downloadFile
	 * @method get/post
	 * @return 文件下载流
	 * @date 2016-03-15
	 */
	@RequestMapping("downloadFile")
	public ResponseEntity<byte[]> downloadFile(Integer fileId) throws Exception {
		HttpHeaders headers = new HttpHeaders();
		java.io.File file = fileService.downloadFile(fileId);
		if (file != null) {
			String fileName = new String(file.getName().getBytes("UTF-8"),"iso-8859-1");
			headers.setContentDispositionFormData("attachment", fileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			return new ResponseEntity<byte[]>(
					FileUtils.readFileToByteArray(file),
					headers, HttpStatus.CREATED);
		}
		else {
			return null;
		}
	}
}
