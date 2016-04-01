<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
  <head>
  	<title>${pageTitle}</title>
  	
    <!-- Dropzone -->
    <link href="<%=basePath%>css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="<%=basePath%>css/plugins/dropzone/dropzone.css" rel="stylesheet">
  	
  	<%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
  </head>
  
  <body>
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	
  	<div class="wrapper wrapper-content">
  		<form id="file-awesome-dropzone" class="dropzone"
  			action="<%=basePath%>file/uploadFiles" method="post" enctype="multipart/form-data">
	 		<div class="row">
				<div class="col-lg-10">
	  				<select class="form-control m-b" name="topic" id="topicNoUpload">
	  				</select>
	   			</div>
			</div>
			<div class="row">
	   			<div class="col-lg-5">
	   				<select class="form-control m-b" name="divisionNo" id="divisionNoUpload" onchange="switchDivision('Upload')" required>
	   					<option value="">All Division</option>
	   				</select>
	   			</div>
	   			<div class="col-lg-5">
	   				<select class="form-control m-b" name="sectionNo"  id="sectionNoUpload">
	   					<option value="">All Section</option>
	   				</select>
	   			</div>
				<div class="col-lg-2">
					<button type="submit" class="btn btn-primary pull-right" >Upload All</button>
				</div>
			</div>
	  		<div class="row">
				<div class="dropzone-previews"></div>
	  		</div>
  		</form>
  	</div>
  	
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
  	
  	<!-- DROPZONE -->
    <script src="<%=basePath%>js/plugins/dropzone/dropzone.js"></script>
    
    <script>
    $(document).ready(function(){
    	$.ajax({
            cache: false,
            type: "GET",
            url: "../division/getDivisions",
    		dataType : "json",
    		success: function(divisions) {
    			divisions.forEach(function(division) {
    				$("#divisionNoUpload").append("<option value=\"" + division.divisionNo + "\">" + division.divisionNo + " - " + division.name + " / " + division.enName + "</option>");
				});
    			switchDivision("Upload");
    		}
    	});
    	
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
    	
    	// init Dropzone
        Dropzone.options.fileAwesomeDropzone = {
        		paramName: "file",
        		autoProcessQueue: false,
        		uploadMultiple: true,
        		parallelUploads: 20,
        		maxFiles: 20,
        		addRemoveLinks: true,
        		// Dropzone settings
        		init: function() {
        			var fileDropzone = this;
        			fileDropzone.on("success", function(file) {
        				setTimeout(function() {
            				fileDropzone.removeFile(file);
        				},1000);
       				});
        			this.element.querySelector("button[type=submit]").addEventListener("click", function(e) {
        				e.preventDefault();
        				e.stopPropagation();
        				fileDropzone.processQueue();
       				});
       			},
       			successmultiple: function() {
       				console.log("successmultiple");
       			},
       			completemultiple: function() {
       				console.log("completemultiple");
       			}
        };
    });
    
    function switchDivision(type) {
    	$("#sectionNo" + type).empty();
    	$("#sectionNo" + type).append("<option value=\"\">All Section</option>");
    	$.ajax({
            cache: false,
            type: "GET",
            url: "../division/getSections",
            data: {divisionNo: $("#divisionNo" + type).val()},
    		dataType : "json",
    		success: function(sections) {
    			sections.forEach(function(section) {
    				$("#sectionNo" + type).append("<option value=\"" + section.sectionNo + "\">" + section.sectionNo + " - " + section.name + " / " + section.enName + "</option>");
				});
    		}
		});
    }
    
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