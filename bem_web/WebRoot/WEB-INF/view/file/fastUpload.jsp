<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
  <head>
  	<title>${pageTitle}</title>
  	
  	<%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
  	
  	<link href="<%=basePath%>css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
  	
  	<link href="<%=basePath%>css/plugins/switchery/switchery.css" rel="stylesheet">
  	
  	<link href="<%=basePath%>css/plugins/bootstrap-multiselect/bootstrap-multiselect.css" rel="stylesheet">
  </head>
  
  <body>
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	
  	<div class="wrapper wrapper-content animated fadeInUp">
 		<div class="row has-error">
			<div class="col-lg-10">
  				<select class="form-control m-b pointer" name="topic" id="topicNoUpload">
  				</select>
   			</div>
		</div>
		<div class="row">
   			<div class="col-lg-5 has-error">
   				<select class="form-control m-b divisionNo pointer" name="divisionNo" id="divisionNoUpload" onchange="switchDivision('Upload')">
   					<option value="">所有处 / All Division</option>
   				</select>
   			</div>
   			<div class="col-lg-5 has-error">
   				<select class="form-control m-b pointer" name="sectionNo"  id="sectionNoUpload">
   					<option value="">所有部门 / All Section</option>
   				</select>
   			</div>
		</div>
		<div class="row">
			<div class="col-lg-1">
				<label class="">
					门店<br />
					Store
   				</label>
			</div>
   			<div class="col-lg-2">
   				<select class="form-control m-b storeNo pointer" name="storeNo"  id="storeNoUpload" multiple="multiple">
   					<!-- <option value="">所有门店 / All Store</option> -->
   				</select>
   			</div>
   			<div class="col-lg-3" >
   				<label class="pull-right">
	   				其他门店是否可见？<br/>
	   				Can other stores view ?
   				</label>
   			</div>
   			<div class="col-lg-2">
				<input id="otherStoreView" type="checkbox" class="js-switch" checked />
   			</div>
		</div>
		<div class="row">
			<div class="col-lg-5">
				<button type="button" class="btn btn-info addBtn" onclick="$(this).next().click()">Add File</button>
				<input type="file" style="display: none;" name="file" id="file" onchange="addUploadFile()" multiple="true"/>
				<button type="button" class="btn btn-primary uploadBtnAll" onclick="upload()">Upload All</button>
				<button type="button" class="btn btn-danger delBtn" onclick="deleteUploadFiles()">Delete Files</button>
			</div>
			<div class="col-lg-6 errorColor">
				<label>单文件不得超过20M，请勿一次性上传超过100个文件<br/>Files' size limits 20M, don't upload more than 100 files</label>
			</div>
		</div>
  		<div class="row">
			<div id="filePanel" class="col-lg-12">
               	<table id="uploadTable" class="table table-striped table-bordered table-hover file-table">
               	</table>
			</div>
  		</div>
  	</div>
  	
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
  	
  	<!-- bootstrap-table -->
  	<script src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
  	<script src="<%=basePath%>js/plugins/bootstrap-table/locale/bootstrap-table-en-US.min.js"></script>
  	
  	<!-- Switchery -->
  	<script src="<%=basePath%>js/plugins/switchery/switchery.js"></script>
    
    <!-- upload -->
    <script src="<%=basePath%>js/plugins/rUpload.js"></script>
    
    <!-- bootstrap-multiselect -->
    <script src="<%=basePath%>js/plugins/bootstrap-multiselect/bootstrap-multiselect.js"></script>
    
    <script>
    $(document).ready(function(){
    	var switchery = new Switchery(document.querySelector('.js-switch'), { color: '#1AB394' });
    	
    	$.ajax({
            cache: false,
            type: "GET",
            url: "../topic/getTopics",
            data: {topicNo: null, isChild: true},
    		dataType : "json",
    		success: function(topics) {
    			if (topics != null) {
    				addTopics(topics, "");
    			}
    		}
    	});
   	});
    
    function addTopics(topics, parent) {
    	topics.forEach(function(topic) {
    		var tNameCn = topic.name;
    		var tNameEn = topic.enName;
    		/* if (tNameCn.length > 10) {
    			tNameCn = tNameCn.substring(0, 8) + "...";
    		} */
    		if (tNameEn.length > 20) {
    			tNameEn = tNameEn.substring(0, 18) + "...";
    		}
        	if (topic.parentTopicNo == 0) {
        		$("#topicNoUpload").append("<option disabled value=\"\"></option>");
        		$("#topicNoUpload").append("<option disabled value=\"" + topic.topicNo + "\">" + tNameCn + " / " + tNameEn + "</option>");
        		addTopics(topic.childTopic, name);
        	} else {
            	$("#topicNoUpload").append("<option value=\"" + topic.topicNo + "\">-- " + tNameCn + " / " + topic.enName + "</option>");
        	}
    	});
    }
    </script>
  </body>
</html>