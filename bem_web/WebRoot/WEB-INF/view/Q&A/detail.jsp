<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
  <head>
  	<title>${pageTitle}</title>
  	
  	<%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
  </head>
  
  <body>
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	<div class="wrapper wrapper-content animated fadeInRight">
	  	<div class="row">
	        <div class="wrapper wrapper-content">
           	 <div class="row animated fadeInRight">
                <div class="col-md-5">
                    <div class="ibox float-e-margins">
                    <div class="mail-box-header">
                <div class="pull-right tooltip-demo">
                    <a href="<%=basePath%>q&a?org_no=${question.org_no}" class="btn btn-white btn-sm return"><i class="fa fa-reply"></i>返回</a>
                    <button class="btn btn-danger btn-sm demo"><i class="fa fa-trash-o"></i></button>
                </div>
                <h2>
                        <span class="font-noraml"></span> ${question.title}
                    </h2>
                <div class="mail-tools tooltip-demo m-t-md">
                    <h5>
                        <span class="pull-right font-noraml">${question.cdate}</span>
                        <span class="font-noraml">创建人 NAME: </span>${question.ldapid}
                    </h5>
                    <div id="negInfo" style="display:none;">
                    <h5>
                        <span class="pull-right font-noraml">商品编号 ITEM NO：${negQuestion.itemNo}</span>
                        <span class="font-noraml">商品名称 ITEM NAME: </span>${negQuestion.itemName}
                    </h5>
                    <h5>
                        <span class="pull-right font-noraml">供应商编号 SUP NO：${negQuestion.supNo}</span>
                        <span class="font-noraml">供应商名称 SUP NAME: </span>${negQuestion.supName}
                    </h5>
                    <h5>
                        <span class="pull-right font-noraml">本店售价 PRICE：${negQuestion.price}</span>
                        <span class="font-noraml">欧尚店STORE(1): </span>${negQuestion.storeNo1}
                    </h5>
                     <h5>
                        <span class="pull-right font-noraml">欧尚店STORE(1)售价PRICE：${negQuestion.price1}</span>
                        <span class="font-noraml">欧尚店STORE(2): </span>${negQuestion.storeNo2}
                    </h5>
                     <h5>
                        <span class="pull-right font-noraml">欧尚店STORE(2)售价PRICE：${negQuestion.price2}</span>
                        <span class="font-noraml">竞争对手名称COMPETITOR: </span>${negQuestion.competitor}
                    </h5>
                     <h5>
                        <span class="pull-right font-noraml">三周前对手售价 3W PRICE：${negQuestion.w3price}</span>
                        <span class="font-noraml">两周前对手售价 2W PRICE: </span>${negQuestion.w2price}
                    </h5>
                     <h5>
                        <span class="pull-right font-noraml">一周前对手售价 1W PRICE：${negQuestion.w1price}</span>
                        <span class="font-noraml">本周对手售价 0W PRICE: </span>${negQuestion.w0price}
                    </h5>
                      <span class="font-noraml">紧急程度 URGENT: </span>${negQuestion.urgent}
                      </div>
                </div>
            </div>
               <div>
                <div class="mail-box">
                <div class="mail-body" style="padding-bottom: 360px;">
                    <p>
                  ${question.content}
                        </p>
                </div>
                    <div class="mail-attachment">
                        <p>
                            <span><i class="fa fa-paperclip"></i> ${fn:length(accessory)}个附件 - 点击文件下载</span>
                        </p>
                        <div class="attachment">
                         <c:forEach items="${accessory}" var="s">
                           <div class="file-box">
                                    <a href="<%=request.getContextPath()%>/q&a/downLoad?aid=${s.aid}">
                                  ${fn:substring(s.aname,13,100)}
                                    </a>
                            </div>
                           </c:forEach>
                            <div class="clearfix"></div>
                        </div>
                        </div>
                        <div class="clearfix"></div>

                </div>
             
                    </div>
                </div>
                    </div>
                    
                <div class="col-md-7">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>回答</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" style="display: block;padding-bottom: 420px;">

                        <div>
           <div class="chat-activity-list">
           	 <c:forEach items="${qreply}" var="s">
               <div class="chat-element">
                        <a href="#" class="pull-left">
                            <img alt="image" class="img-circle" src="<%=basePath%>/img/a2.jpg">
                        </a>
                        <div class="media-body ">
                            <strong>${s.ldapid}</strong>
                            <p class="m-b-xs">
                              ${s.content} 
                            </p>
                          <small class="text-muted">${s.createDate}</small>
                        </div>
                    </div>
             </c:forEach>
           </div>
                
                </div>
                
                        <div class="chat-form">
                            <form method="post" class="form-horizontal" action="reply">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Message" name="content"></textarea>
                                </div>
                                <div style="display:none">
                                <input type="text" name="q_no" value="${question.q_no}">
                                </div>
                                
                                <div class="text-right">
                                     <button class="btn btn-primary" type="submit" id=submit>回复</button> 
                                </div>
                            </form>
                        </div>
                </div>
                        
                    </div>

                </div>
            </div>
        </div>
	    
	   </div>
    </div>
  	
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
<script>
var $q_no=${question.q_no};
$(document).ready(function(){
	if(${question.org_no}==24)$("#negInfo").attr("style","dispslay:block");
});
$('#demo3').click(function () {
    swal({
        title: "Are you sure?",
        text: "",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, delete it!",
        closeOnConfirm: false
    }, function () {
        swal("Deleted!", "This problem has been closed.", "success");
    });
});
$("#submit").click(function(){
    refresh();
    });
$(".demo").click(function () {
    swal({
                title: "Are you sure?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, delete it!",
                cancelButtonText: "No, cancel plx!",
                closeOnConfirm: false,
                closeOnCancel: true},
            function (isConfirm) {
                if (isConfirm){
                	close($q_no);
                	swal("Deleted!", "The question has been deleted.", "success");
                }
            });
});
function close(q_no){
	$.ajax({
		type:"post",
		url:"<%=basePath%>q&a/close",
		data:{"q_no":q_no}
	});
}
</script>
  </body>
</html>