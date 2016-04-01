<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>

<!DOCTYPE html>
<html>
  <head>
  	<!-- Toastr style -->
    <link href="<%=basePath%>css/plugins/toastr/toastr.min.css" rel="stylesheet">
  	
  	<%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
  	
  	<link href="<%=basePath%>css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
  	<link href="<%=basePath%>css/plugins/datapicker/datepicker3.css" rel="stylesheet">
  	
  	<link href="<%=basePath%>css/plugins/switchery/switchery.css" rel="stylesheet">
  	
  	<link href="<%=basePath%>css/plugins/bootstrap-multiselect/bootstrap-multiselect.css" rel="stylesheet">
  </head>
  
  <body>
  	<sec:authorize access="hasAnyRole('ROLE_HO','ROLE_ADMIN')">
  		<div id="auth"></div>
  	</sec:authorize>
	<!-- uploadModal -->
	<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="cursor: pointer;">&times;</span></button>
					<h4 class="modal-title" id="uploadModalLabel">上传文件</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-10">
	    					<select class="form-control m-b" name="topic" id="topicNoUpload" disabled>
	    					</select>
		    			</div>
		    			<div class="col-lg-2">
							<button type="button" class="btn btn-info addBtn" onclick="$(this).next().click()">Add File</button>
							<input type="file" style="display: none;" name="file" id="file" onchange="addUploadFile()" multiple="true"/>
						</div>
					</div>
					<div class="row has-error">
						<div class="col-lg-5">
		    				<select class="form-control m-b divisionNo pointer" name="divisionNo" id="divisionNoUpload" onchange="switchDivision('Upload')">
		    					<option value="">所有处 / All Division</option>
		    				</select>
		    			</div>
		    			<div class="col-lg-5">
		    				<select class="form-control m-b pointer" name="sectionNo"  id="sectionNoUpload">
		    					<option value="">所有部门 / All Section</option>
		    				</select>
		    			</div>
						<div class="col-lg-2">
							<button type="button" class="btn btn-primary uploadBtnAll" onclick="upload()" data-style="expand-right">Upload All</button>
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
			   				<select class="form-control m-b storeNo pointer" name="storeNo" id="storeNoUpload" multiple="multiple">
			   					<!-- <option value="">所有门店 / All Store</option> -->
			   				</select>
			   			</div>
			   			<div class="col-lg-3" >
			   				<label class=" pull-right">
				   				其他门店是否可见？<br/>
				   				Can other stores view ?
			   				</label>
			   			</div>
			   			<div class="col-lg-4">
							<input id="otherStoreView" type="checkbox" class="js-switch" checked />
			   			</div>
						<div class="col-lg-2">
							<button type="button" class="btn btn-danger delBtn" onclick="deleteUploadFiles()">Delete Files</button>
						</div>
					</div>
					<div class="row errorColor">
						<label>单文件不得超过20M，请勿一次性上传超过100个文件<br/>Files' size limits 20M, don't upload more than 100 files</label>
					</div>
					<div class="row">
						<div id="filePanel" class="col-lg-12">
		                	<table id="uploadTable" class="table table-striped table-bordered table-hover file-table">
		                	</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	
  	<div class="wrapper wrapper-content animated fadeInUp" id="fileMainContext">
	    <div class="row">
	        <div class="col-lg-3">
	            <div class="ibox float-e-margins">
	            	<!-- style="background-color: #1c84c6; color: white;" -->
	                <div class="ibox-content">
	                    <div class="file-manager">
	                        <h5>主题/Topic</h5>
	                        <div class="dd" id="nestable">
                            </div>
	                        <div class="clearfix"></div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-lg-9 animated fadeInRight">
	  			<form id="searchForm">
	  				<!-- style="background-color: #f7a54a; padding-top: 10px;" -->
	        		<div class="row form-group fileSearch">
			    		<div class="col-lg-3">
			    			<input type="text" placeholder="File Name" class="form-control" name="name">
			    		</div>
			    		<div class="col-lg-3">
			    			<select class="form-control m-b pointer" name="topic.topicNo" id="topicNo">
			    				<option value="">所有主题 / All Topic</option>
			    			</select>
			    		</div>
			    		<div class="col-lg-3">
			    			<select class="form-control m-b divisionNo pointer" name="division.divisionNo" id="divisionNo" onchange="switchDivision('')">
			    				<option value="">所有处 / All Division</option>
			    			</select>
			    		</div>
			    		<div class="col-lg-3">
			    			<select class="form-control m-b pointer" name="section.sectionNo"  id="sectionNo">
			    				<option value="">所有部门 / All Section</option>
			    			</select>
			    		</div>
		  			</div>
		  			<!-- style="background-color: #f7a54a; padding-bottom: 10px;" -->
		  			<div class="row form-group fileSearch">
				        <div class="input-group date col-lg-3">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" placeholder="Date From" name="dateFrom">
                        </div>
				        <div class="input-group date col-lg-3">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" placeholder="Date To" name="dateTo">
                        </div>
				        <div class="col-lg-3">
			    			<button class="btn btn-primary" type="button" onclick="search()">
			    				<i class="fa fa-search"></i> search
		    				</button>
			    		</div>
		  			</div>
		    	</form>
		    	<sec:authorize access="hasAnyRole('ROLE_HO','ROLE_ADMIN')">
	  			<div class="row" style="margin-top: 10px;">
	  				<div class="col-lg-5">
						<button id="delBtn" type="button" class="btn btn-danger" onclick="delFiles()"
							style="display: none; float:left;">
							<i class="fa fa-times"></i> delete
						</button>
		    			<button class="btn btn-primary" type="button" id="uploadBtn"
		    				data-target="#uploadModal" data-toggle="modal"
		    				style="display: none; float:left; margin-left: 10px;">
		    				<i class="fa fa-upload"></i> upload
	    				</button>
		    		</div>
	  			</div>
	  			</sec:authorize>
	            <div class="row">
	                <div id="filePanel" class="col-lg-12" style="display: none;">
	                	<table id="fileTable" class="table table-striped table-bordered table-hover file-table">
	                	</table>
					</div>
	                <div id="summaryPanel" class="col-lg-12">
	                	<table id="summaryTable" class="table table-striped table-bordered table-hover">
	                	</table>
					</div>
           		</div>
           		<div id="noDate" class="row" style="display: none;">
           			<i class="fa fa-smile-o"></i> 没问文件/no file
           		</div>
               	<div class="row" id="load" style="display: none;">
	               	<div class="ibox-content" style="background-color: inherit; border: none;">
	                    <div class="sk-spinner sk-spinner-wave">
	                        <div class="sk-rect1"></div>
	                        <div class="sk-rect2"></div>
	                        <div class="sk-rect3"></div>
	                        <div class="sk-rect4"></div>
	                        <div class="sk-rect5"></div>
	                    </div>
	                </div>
               	</div>
        	</div>
    	</div>
    </div>
  	
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
  	
  	<!-- bootstrap-table -->
  	<script src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
  	<script src="<%=basePath%>js/plugins/bootstrap-table/locale/bootstrap-table-en-US.min.js"></script>
  	<!-- Toastr script -->
    <script src="<%=basePath%>js/plugins/toastr/toastr.min.js"></script>
    <!-- Nestable List -->
    <script src="<%=basePath%>js/plugins/nestable/jquery.nestable.js"></script>
    <!-- Data picker -->
    <script src="<%=basePath%>js/plugins/datapicker/bootstrap-datepicker.js"></script>
    
    <!-- Switchery -->
  	<script src="<%=basePath%>js/plugins/switchery/switchery.js"></script>
    
    <!-- upload -->
    <script src="<%=basePath%>js/plugins/rUpload.js"></script>
    
    <!-- bootstrap-multiselect -->
    <script src="<%=basePath%>js/plugins/bootstrap-multiselect/bootstrap-multiselect.js"></script>
  	
  	<script>
  		var $table = $("#fileTable");
  		var $summaryTable = $("#summaryTable");
        $(document).ready(function(){
        	setTimeout(function() {
        		$(".navbar-minimalize").trigger("click");
        	}, 1000);
        	
        	var switchery = new Switchery(document.querySelector('.js-switch'), { color: '#1AB394' });
        	
        	/* $("#uploadModal").on("hide.bs.modal", function() {
        		if (fileList.length > 0) {
        			swal({
        		        title: "还有文件未上传\nThere are not-uploaded files",
        		        text: "是否关闭？\n",
        		        type: "warning",
        		        showCancelButton: true,
        		        confirmButtonColor: "#DD6B55",
        		        confirmButtonText: "Yes",
        		        cancelButtonText: "No",
        		        closeOnConfirm: false
        		    }, function () {
            			
        		    });
        		}
        	});
        	$("#uploadModal").on("hidden.bs.modal", function() {
        		clearFileList();
        	}); */
        	
        	$("#uploadModal").on("hidden.bs.modal", function() {
        		$("#load").css("display", "block");
        		$table.bootstrapTable("refresh");
        	});
        	
        	$('.input-group.date').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true,
                format: "yyyy-mm-dd"
            });
        	
        	// nestable
			$("#load").css("display", "block");
            $.ajax({
                cache: false,
                type: "GET",
                url: "<%=basePath%>topic/getTopics",
                data: {topicNo: null, isChild: true},
        		dataType : "json",
        		success: function(topics) {
        			if (topics == "Error, Please login again" || topics == null)
        				toLogin();
        			else {
        				addTopics(topics, $("#nestable"), "");
        	            $("#nestable").nestable();
        	            $(".dd").nestable('collapseAll');
	        			$("#load").css("display", "none");
	        			
	        			$summaryTable.bootstrapTable({
	        				url: "<%=basePath%>file/fileSummary",
        	                sidePagination: "client",
        	                showRefresh: false,
        	                pagination: false,
        	                columns: [{
        	                    field: "NAME",
        	                    title: "主题"
        	                }, {
        	                	field: "EN_NAME",
        	                    title: "TOPIC"
        	                }, {
        	                	field: "FILE_NUMBER",
        	                    title: "最近上传文件数量<br/>Recent Upload File Quantity"
        	                }],
        	                onLoadSuccess: function() {
        	        			$("#load").css("display", "none");
        	                },
        	                onLoadError: function() {
        	                	toLogin();
        	                },
        	                onSort: function() {
        	        			$("#load").css("display", "block");
        	                }
        	            });
	        			
	        			$table.bootstrapTable({
        	                sidePagination: "server",
        	                pageSize: 30,
        	                pageList: [30, 50, 100, "All"],
        	                showRefresh: false,
        	                pagination: true,
        	                sortName: "createDate",
        	                sortOrder: "desc",
        	                columns: [{
        	                    field: "id",
        	                    title: "文件编号<br />File ID"
        	                }, {
        	                	filed: "state",
        	                	checkbox: true
        	                }, {
        	                    field: "name",
        	                    title: "文件名<br />File Name",
        	                    sortable: true
        	                }, {
        	                    field: "topic.name",
        	                    title: "主题<br />Topic",
        	                    sortable: true,
        	                    formatter: function(value, row, index) {
        	                    	return row.topic.name + "<br/>" + row.topic.enName;
        	                    }
        	                }, {
        	                    field: "division.name",
        	                    title: "处<br />Division",
        	                    sortable: true,
        	                    formatter: function(value, row, index) {
        	                    	if(value == null)
        	                    		return "所有处<br/>All Division";
        	                    	else
        	                    		return row.division.name + "<br/>" + row.division.enName;
        	                    }
        	                }, {
        	                    field: "section.name",
        	                    title: "部门<br />Section",
        	                    sortable: true,
        	                    formatter: function(value, row, index) {
        	                    	if(value == null)
        	                    		return "所有部门<br/>All Section";
        	                    	else
        	                    		return row.section.name + "<br/>" + row.section.enName;
        	                    }
        	                }, {
        	                	fileId: "store.name",
        	                	title: "门店<br />Store",
        	                	formatter: function(value, row, index) {
        	                		if (value == null)
           	                    		return "所有门店<br/>All Store";
           	                    	else
           	                    		return row.store.storeNo + " - " + row.store.name;
           	                    }
        	                }, {
        	                    field: "size",
        	                    title: "大小<br />Size",
        	                    sortable: true,
        	                    formatter: function(value, row, index) {
        	                    	return row.fileSize + "<br/>" + number2Unit(row.sizeUnit);
        	                    }
        	                }, {
        	                    field: "downloadTimes",
        	                    title: "下载次数<br />Times",
        	                    sortable: true
        	                }, {
        	                    field: "createDate",
        	                    title: "上传日期<br />Upload Date",
        	                    sortable: true,
        	                    formatter: function(value, row, index) {
        	                    	return format(new Date(value.time), "yyyy-MM-dd hh:mm");
        	                    }
        	                }, {
        	                    field: "operate",
        	                    title: "",
        	                    formatter: function(value, row, index) {
        	                    	if (auth)
        	                    		return "<button class=\"btn btn-outline btn-default defaultColor\" type=\"button\" onclick=\"download($(this))\"><i class=\"fa fa-download\"></i></button>" +
        	                    			"<button class=\"btn btn-outline btn-default errorColor\" type=\"button\" onclick=\"delFile($(this))\"><i class=\"fa fa-times\"></i></button>";
    	                    		else
     	                    			return "<button class=\"btn btn-outline btn-default defaultColor\" type=\"button\" onclick=\"download($(this))\"><i class=\"fa fa-download\"></i></button>";
        	                    }
        	                }, {
        	                    field: "discription",
        	                    title: "描述<br />Discription"
        	                }],
        	                onLoadSuccess: function() {
        	        			$("#load").css("display", "none");
        	        			if ($table.bootstrapTable('getData').length == 0) {
        	        				$("#noDate").css("display", "block");
        	        				$("#filePanel").css("display", "none");
        	        			} else {
        	        				$("#noDate").css("display", "none");
        	        				$("#filePanel").css("display", "block");
        	        			}
        	        			// $("#fileTable > tbody > tr").each(addToolTip);
        	                },
        	                onLoadError: function() {
        	                	toLogin();
        	                },
        	                onSort: function() {
        	        			$("#load").css("display", "block");
        	                }
        	            });
       				}
        		}
        	});
            
            // init toastr
            toastr.options = {
           		"closeButton": true,
				"debug": false,
				"progressBar": true,
				"preventDuplicates": false,
				"positionClass": "toast-top-right",
				"onclick": null,
				"showDuration": "400",
				"hideDuration": "1000",
				"timeOut": "1000",
				"extendedTimeOut": "1000",
				"showEasing": "swing",
				"hideEasing": "linear",
				"showMethod": "fadeIn",
				"hideMethod": "fadeOut"
			}
        });
        
        function addTopics(topics, div, parent) {
        	var ol = $("<ol class='dd-list'>");
        	div.append(ol);
        	topics.forEach(function(topic) {
        		var tNameCn = topic.name;
        		var tNameEn = topic.enName;
        		/* if (tNameCn.length > 10) {
        			tNameCn = tNameCn.substring(0, 8) + "...";
        		} */
        		if (tNameEn.length > 20) {
        			tNameEn = tNameEn.substring(0, 18) + "...";
        		}
            	var li = $("<li class='dd-item' data-id='" + topic.topicNo + "'>");
            	ol.append(li);
            	li.append("<div class='dd-handle'>Drag</div>");
            	if (topic.parentTopicNo == 0) {
            		$("#topicNo").append("<option disabled value=\"\"></option>");
            		$("#topicNoUpload").append("<option disabled value=\"\"></option>");
                	$("#topicNo").append("<option disabled value=\"" + topic.topicNo + "\">" + tNameCn + " / " + tNameEn + "</option>");
                	$("#topicNoUpload").append("<option disabled value=\"" + topic.topicNo + "\">" + tNameCn + " / " + tNameEn + "</option>");
            		li.append("<div class='dd-content' ondblclick=\"expandTree($(this))\" onclick=\"switchTopic(" + topic.topicNo + ", 0)\">" + topic.name + "<br/>" + topic.enName + "</div>");
            		addTopics(topic.childTopic, li, name);
            	} else {
                	$("#topicNo").append("<option value=\"" + topic.topicNo + "\">-- " + tNameCn + " / " + tNameEn + "</option>");
                	$("#topicNoUpload").append("<option value=\"" + topic.topicNo + "\">-- " + tNameCn + " / " + tNameEn + "</option>");
                	li.append("<div class='dd-content' onclick='switchTopic(" + topic.topicNo + ", 1)'>" + topic.name + "<br/>" + topic.enName + "</div>");
            	}
        	});
        }
        
        function expandTree(dd) {
        	var b1 = dd.prev().prev().prev();
        	var b2 = dd.prev().prev();
        	if (b1.css("display") == "block") {
        		b1.trigger("click");
        	} else {
        		b2.trigger("click");
        	}
        }
        
        function switchTopic(topicNo, level) {
        	$("#summaryPanel").remove();
        	$("#delBtn").css("display", "block");
        	$("#filePanel").css("display", "block");
			$("#load").css("display", "block");
        	$(".dd-content.active").removeClass("active");
			$table.bootstrapTable("removeAll");
        	$(".dd-item[data-id='" + topicNo + "'] > .dd-content").addClass("active");
        	if (level == 0) {
	        	$("#uploadBtn").css("display", "none");
				$table.bootstrapTable("refresh", {url: "<%=basePath%>file/search?topicNo=" + topicNo});
        	} else if (level == 1) {
				$("#topicNoUpload").val(topicNo);
	        	$("#uploadBtn").css("display", "block");
				$table.bootstrapTable("refresh", {url: "<%=basePath%>file/getTopicFiles?topicNo=" + topicNo});
        	}
        }
        
        function addToolTip(index) {
        	$(this).attr("data-toggle", "tooltip");
        	$(this).attr("data-placement", "top");
        	if ($(this).children("td:last-child").html() == null || $(this).children("td:last-child").html() == "")
        		$(this).attr("title", "没有描述/No Discription");
        	else
        		$(this).attr("title", $(this).children("td:last-child").html());
        	$(this).tooltip();
        }
        
        
        
        function search() {
        	$("#summaryPanel").remove();
        	$("#delBtn").css("display", "block");
        	$("#filePanel").css("display", "block");
        	$("#uploadBtn").css("display", "none");
        	$(".dd").nestable('collapseAll');
    		$(".dd-content.active").removeClass("active");
    		$("#load").css("display", "block");
    		$table.bootstrapTable("removeAll");
    		$table.bootstrapTable("refresh", {url: "<%=basePath%>file/search?" + $("#searchForm").serialize()});
        }
        
        function download(btn) {
        	var fileId = btn.parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().html();
        	var fileName = btn.parent().prev().prev().prev().prev().prev().prev().prev().prev().html();
        	toastr.info("下载文件：" + fileName);
        	window.open("<%=basePath%>file/downloadFile?fileId=" + fileId);
        }
        
        function delFile(btn) {
        	swal({
                title: "是否确认？\nAre You Sure ?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes",
                cancelButtonText: "No",
                closeOnConfirm: false
            }, function () {
            	var fileId = btn.parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().html();
            	$.ajax({
                    cache: false,
                    type: "POST",
                    url: "<%=basePath%>file/deleteFiles",
                    data: {deleteFilesId: [parseInt(fileId)]},
        	        async: false,
            		success: function(result) {
                    	$table.bootstrapTable('remove', {field: 'id', values: [parseInt(fileId)]});
                    	swal("已删除\nDeleted!", "", "success");
            		}
                });
            });
        }
        
        function delFiles() {
        	swal({
                title: "是否确认？\nAre You Sure ?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes",
                cancelButtonText: "No",
                closeOnConfirm: false
            }, function () {
            	var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
                    return row.id;
                });
            	$.ajax({
                    cache: false,
                    type: "POST",
                    url: "<%=basePath%>file/deleteFiles",
                    data: {deleteFilesId: ids},
        	        async: false,
            		success: function(result) {
                    	$table.bootstrapTable('remove', {
                            field: 'id',
                            values: ids
                        });
                    	swal("已删除\nDeleted!", "", "success");
            		}
                });
            });
        }
	</script>
  </body>
</html>