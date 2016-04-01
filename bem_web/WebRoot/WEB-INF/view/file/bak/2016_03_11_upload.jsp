<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
  <head>
  	<title>${pageTitle}</title>
  	
  	<%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
  	
  	<link href="<%=basePath%>css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
  	
  	<!-- Ladda style -->
    <link href="<%=basePath%>css/plugins/ladda/ladda-themeless.min.css" rel="stylesheet">
  </head>
  
  <body>
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	
  	<div class="wrapper wrapper-content">
 		<div class="row has-error">
			<div class="col-lg-10">
  				<select class="form-control m-b" name="topic" id="topicNoUpload">
  				</select>
   			</div>
		</div>
		<div class="row">
   			<div class="col-lg-5 has-error">
   				<select class="form-control m-b divisionNo" name="divisionNo" id="divisionNoUpload" onchange="switchDivision('Upload')" required>
   					<option value="">All Division</option>
   				</select>
   			</div>
   			<div class="col-lg-5 has-error">
   				<select class="form-control m-b" name="sectionNo"  id="sectionNoUpload">
   					<option value="">All Section</option>
   				</select>
   			</div>
		</div>
		<div class="row">
			<div class="col-lg-1">
				<button type="button" class="btn btn-primary addBtn" onclick="$(this).next().click()">Add File</button>
				<input type="file" style="display: none;" name="file" id="file" onchange="addFile()" multiple="true"/>
			</div>
			<div class="col-lg-1">
				<button type="button" class="ladda-button btn btn-primary uploadBtnAll" onclick="uploadFile()" data-style="expand-right">Upload All</button>
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
  	
  	<!-- Ladda -->
    <script src="<%=basePath%>js/plugins/ladda/spin.min.js"></script>
    <script src="<%=basePath%>js/plugins/ladda/ladda.min.js"></script>
    <script src="<%=basePath%>js/plugins/ladda/ladda.jquery.min.js"></script>
    
    <!-- upload -->
    <script src="<%=basePath%>js/plugins/rUpload.js"></script>
    
    <script>
    $(document).ready(function(){
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
        	var name = "";
        	if (parent == "") {
        		name = topic.name;
        	} else {
        		name = parent + " / " + topic.name;
        	}
        	if (topic.childTopic.length > 0) {
        		addTopics(topic.childTopic, name);
        	} else {
            	$("#topicNoUpload").append("<option value=\"" + topic.topicNo + "\">" + topic.name + " / " + topic.enName + "</option>");
        	}
    	});
    }
    </script>
  </body>
</html>