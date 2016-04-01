package com.auchan.bem.bem_web.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.auchan.bem.bem_pojo.entity.NegQuestions;
import com.auchan.bem.bem_pojo.entity.Qaccessory;
import com.auchan.bem.bem_pojo.entity.Qreply;
import com.auchan.bem.bem_pojo.entity.Questions;
import com.auchan.bem.bem_pojo.entity.SortAttribute;
import com.auchan.bem.bem_pojo.entity.Topic;
import com.auchan.bem.bem_service.NegQuestionsService;
import com.auchan.bem.bem_service.QaccessoryService;
import com.auchan.bem.bem_service.QreplyService;
import com.auchan.bem.bem_service.QuestionsService;
import com.auchan.bem.bem_service.TopicService;
import com.auchan.bem.bem_util.LdapUtil;

/**
 * q&acontroller
 * @url /
 * @date 2016-02-26
 * @author 林亮亮
 */
@Controller  
@RequestMapping("q&a")
public class ForumController {
	@Resource
	QuestionsService questionsService;
	@Resource
	QreplyService qreplyService;
	@Resource
	QaccessoryService qaccessoryService;
	@Resource
	TopicService topicService;
	@Resource
	NegQuestionsService negQuestionsService;
	/**
	 * 网站首页，跳转登陆页
	 * 
	 * @url /
	 * @method get/post
	 * @return 
	 * @date 2016-02-26
	 * @author 林亮亮
	 */
	@RequestMapping("")
	public String  forum(ModelMap model,Short org_no){
		model.addAttribute("pageTitle", "问题讨论");
		model.addAttribute("breadcrumbs", new String[][] {{"Q&A"}});
		model.addAttribute("leftbar", "1");
		if(org_no!=null){Topic topic=topicService.getTopic(org_no);
		model.addAttribute("topic",topic);}
		return "Q&A/Q&A";
	}
	
	

	/**
	 * 查询问题详情
	 * 
	 * @url /
	 * @method get/post
	 * @return 
	 * @date 2016-02-26
	 * @author 林亮亮
	 */
	@RequestMapping("detail")
	public String  detail(ModelMap model,Integer q_no){
		model.addAttribute("pageTitle", "问题讨论/Q&A");
		model.addAttribute("breadcrumbs", new String[][] {{"Q&A","Q&A"},{"details"}});
		model.addAttribute("leftbar", "1");
		Questions question=questionsService.getDetail(q_no);
		if(question.getOrg_no()==24){
			NegQuestions negQuestion=negQuestionsService.selectByQno(q_no);
			model.addAttribute("negQuestion",negQuestion);}
		List<Qreply> qreply=qreplyService.getQreply(q_no);
		List<Qaccessory> accessory=qaccessoryService.getQaccessory(q_no);
		model.addAttribute("question",question);
		if(accessory!=null)model.addAttribute("accessory",accessory);
		if(qreply!=null)model.addAttribute("qreply",qreply);
		return "Q&A/detail";
	}
	


	/**
	 * 回复
	 * 
	 * @url /
	 * @method get/post
	 * @return 
	 * @date 2016-03-18
	 * @author 林亮亮
	 */
	@RequestMapping("reply")
	public ModelAndView reply(ModelMap model,Qreply qreply,Integer q_no){
		qreplyService.saveQreply(qreply, q_no);
		return new ModelAndView("redirect:/q&a/detail?q_no="+q_no);
	}
	
	/**
	 * 提问
	 * @return 
	 * @url /ask
	 * @method
	 * @return 
	 * @date 2016-03-14
	 */
	@RequestMapping(value="upload",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView  upload(@RequestParam("file")MultipartFile[] file,Questions question,NegQuestions negQuestion)throws Exception{
		List<String> list=new ArrayList<>();
		for(MultipartFile f : file){ 
		if(!f.isEmpty()){
			String fileName=System.currentTimeMillis()+f.getOriginalFilename();
			//String path = request.getSession().getServletContext().getRealPath("/WEB-INF/upload"); 
			String path="C:\\Users\\linliangliang\\Desktop\\upload\\";
			FileUtils.copyInputStreamToFile(f.getInputStream(), new File(path,fileName));
			list.add(fileName);
						}
									}
		questionsService.saveQuestion(question);
		int q_no=question.getQ_no()+1;
		question.setLdapid(LdapUtil.getUserName());
		qaccessoryService.saveQaccessory(list,q_no);
		
		if(negQuestion!=null){
			negQuestion.setQ_no(q_no);
			negQuestionsService.saveNegQuestion(negQuestion);}
		return new ModelAndView("redirect:/q&a/detail?q_no="+q_no);
	}
	
	
	
	/**
	 * 附件下载
	 * @param aid
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("downLoad")    
    public ResponseEntity<byte[]> download(@RequestParam("aid")Integer aid) throws IOException {    
    	Qaccessory qaccessory=qaccessoryService.selectByPrimaryKey(aid);
    	String path="C:\\Users\\linliangliang\\Desktop\\upload\\"+qaccessory.getAname();
    	File file=new File(path);
    	HttpHeaders headers = new HttpHeaders();    
        String fileName=new String(qaccessory.getAname().getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题  
        headers.setContentDispositionFormData("attachment", fileName);   
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
                                          headers, HttpStatus.CREATED);    
    }    
	
	
	
	/**
	 * 条件查询
	 * @param question
	 * @param dateFrom
	 * @param dateTo
	 * @return
	 */
	@RequestMapping("search")
	@ResponseBody
	public String search(@ModelAttribute Questions question,String dateFrom, String dateTo,@ModelAttribute SortAttribute sort) {
			JSONObject json = new JSONObject();
			json.put("total", questionsService.searchAllQuestions(question,dateFrom, dateTo));
			json.put("rows", questionsService.searchAllQuestionsSort(question,dateFrom, dateTo,sort));
			return json.toString();
	}
	
	
	/**
	 * 按topic查询问题
	 * 
	 * @param topicNo 主题编号
	 * @url /Q&A/getTopicQuestions
	 * @method get/post
	 * @return json 所有问题列表
	 * @date 2016-03-08
	 */
	@RequestMapping("getTopicQuestions")
	@ResponseBody
	public String getTopicQuestions(Integer topicNo,@ModelAttribute SortAttribute sort) {
		if (topicNo == null)
			return null;
		else {
			JSONObject json = new JSONObject();
			json.put("total", questionsService.searchQuestions(topicNo));
			json.put("rows", questionsService.searchQuestionsSort(topicNo, sort));
			return json.toString();
		}
	}
	
	/**
	 * 关闭问题
	 * @param q_no
	 * @return
	 */
	@RequestMapping("close")
	@ResponseBody
	public String close(Integer q_no){
		questionsService.closeQuestion(q_no);
		return "";
	}
}