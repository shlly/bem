<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>

<!DOCTYPE html>
<html>
  <head>
  	<!-- Toastr style -->
    <link href="<%=basePath%>css/plugins/toastr/toastr.min.css" rel="stylesheet">
    
    <!-- Dropzone -->
    <link href="<%=basePath%>css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="<%=basePath%>css/plugins/dropzone/dropzone.css" rel="stylesheet">
  	
  	<%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
  	
  	<link href="<%=basePath%>css/plugins/dataTables/datatables.min.css" rel="stylesheet">
  	<link href="<%=basePath%>css/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet">
  </head>
  
  <body>
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
						<form id="file-awesome-dropzone" class="dropzone" action="#">
							<div class="row">
							<div class="col-lg-3">
			    				<select class="form-control m-b" name="topic" id="topicNoUpload" disabled>
			    				</select>
				    			</div>
				    			<div class="col-lg-2">
				    				<select class="form-control m-b" name="divisionNo" id="divisionNoUpload" onchange="switchDivision('Upload')">
				    					<option value="">All Division</option>
				    				</select>
				    			</div>
				    			<div class="col-lg-2">
				    				<select class="form-control m-b" name="sectionNo"  id="sectionNoUpload">
				    					<option value="">All Section</option>
				    				</select>
				    			</div>
				    			<div class="col-lg-3">
									<button type="submit" class="btn btn-primary pull-right">全部上传/Upload All</button>
				    			</div>
							</div>
							<div class="row">
								<div id="dropzone" class="dropzone-previews"></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	
  	<div class="wrapper wrapper-content" id="fileMainContext">
  		<div class="row form-group fileSearch">
  			<form id="searchForm">
	    		<div class="col-lg-2">
	    			<input type="text" placeholder="File Name" class="form-control" name="name">
	    		</div>
	    		<div class="col-lg-2">
	    			<select class="form-control m-b" name="topic.topicNo" id="topicNo">
	    				<option value="">All Topic</option>
	    			</select>
	    		</div>
	    		<div class="col-lg-2">
	    			<select class="form-control m-b" name="division.divisionNo" id="divisionNo" onchange="switchDivision('')">
	    				<option value="">All Division</option>
	    			</select>
	    		</div>
	    		<div class="col-lg-2">
	    			<select class="form-control m-b" name="section.sectionNo"  id="sectionNo">
	    				<option value="">All Section</option>
	    			</select>
	    		</div>
		        <div class="col-lg-3">
		        	<input class="form-control" type="text" name="dateRange" placeholder="Date Range"/>
		        </div>
		        <div class="col-lg-1">
	    			<button class="btn btn-primary btn-circle" type="button" onclick="search()"><i class="fa fa-search"></i></button>
	    		</div>
	    	</form>
  		</div>
	    <div class="row">
	        <div class="col-lg-3">
	            <div class="ibox float-e-margins">
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
               	<div class="row" id="load" style="display: none;">
	               	<div class="ibox-content" style="background-color: inherit; border: none;">
	                    <div class="sk-spinner sk-spinner-chasing-dots">
	                        <div class="sk-dot1"></div>
	                        <div class="sk-dot2"></div>
	                    </div>
	                </div>
               	</div>
	            <div class="row">
	                <div id="filePanel" class="col-lg-12">
	                	<div class="col-lg-5"></div>
	                	<div class="col-lg-2"></div>
	                	<div class="col-lg-2"></div>
	                	<div class="col-lg-1"></div>
	                	<div class="col-lg-1"></div>
	                	<table id="fileTable" class="table table-striped table-bordered table-hover">
	                		<thead>
	                			<th>文件编号<br /> File ID</th>
	                			<th>文件名<br /> File Name</th>
	                			<th>主题<br />Topic</th>
	                			<th>处<br />Division</th>
	                			<th>部门<br />Section</th>
	                			<th>上传日期<br />Upload Date</th>
	                			<th>下载<br />Download</th>
	                			<th class="hidden">描述<br />Discription</th>
	                		</thead>
	                	</table>
					</div>
           		</div>
        	</div>
    	</div>
    </div>
  	
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
  	
  	<!-- DataTables -->
  	<script src="js/plugins/dataTables/datatables.min.js"></script>
  	
  	<!-- Toastr script -->
    <script src="<%=basePath%>js/plugins/toastr/toastr.min.js"></script>
    <!-- DROPZONE -->
    <script src="<%=basePath%>js/plugins/dropzone/dropzone.js"></script>
    <!-- Nestable List -->
    <script src="<%=basePath%>js/plugins/nestable/jquery.nestable.js"></script>
    <!-- Date range use moment.js same as full calendar plugin -->
    <script src="<%=basePath%>js/plugins/fullcalendar/moment.min.js"></script>
    <!-- Date range picker -->
    <script src="<%=basePath%>js/plugins/daterangepicker/daterangepicker.js"></script>
  	
  	<script>
  		var table;
        $(document).ready(function(){
        	$("input[name='dateRange']").daterangepicker({
        		format: "YYYY-MM-DD"
        	});
        	
        	$.ajax({
                cache: false,
                type: "GET",
                url: "division/getDivisions",
        		dataType : "json",
        		success: function(divisions) {
        			divisions.forEach(function(division) {
        				$("#divisionNo").append("<option value=\"" + division.divisionNo + "\">" + division.name + "/" + division.enName + "</option>");
        				$("#divisionNoUpload").append("<option value=\"" + division.divisionNo + "\">" + division.name + "/" + division.enName + "</option>");
    				});
        		}
        	});
        	
        	// nestable
			$("#load").css("display", "block");
            $.ajax({
                cache: false,
                type: "GET",
                url: "topic/getTopics",
                data: {topicNo: null, isChild: true},
        		dataType : "json",
        		success: function(topics) {
        			if(topics != null) {
        				addTopics(topics, $("#nestable"), "");
        	            $("#nestable").nestable();
        	            $(".dd").nestable('collapseAll');
        				table = $("#fileTable").on( 'init.dt', function () {
        					$("#fileTable").removeAttr("style");
        		            $(".uploadBtn").html("<button id=\"uploadBtn\" class=\"btn btn-primary btn-block\" data-toggle=\"modal\" data-target=\"#uploadModal\" style=\"display: none;\">Upload</button>");
            				$("#load").css("display", "none");
            				// $("#fileTable > tbody > tr").each(addToolTip);
       					}).DataTable({
       						dom: '<<"col-lg-12"l<"uploadBtn col-lg-2">pf><t>i>',
        					ajax: "file/search",
        					"order": [[ 4, 'desc' ]],
        					language: {
        						lengthMenu: "Per Page：_MENU_",
        						zeroRecords: "没有文件\/No File",
        						infoEmpty: "总页数\/Total Pages：0",
        						info: "总页数\/Total Pages：_PAGES_",
        						loadingRecords: "载入中/loading ...",
        						paginate: {
        				            first:    '«',
        				            previous: '‹',
        				            next:     '›',
        				            last:     '»'
        				        },
        				        aria: {
        				            first:    '«',
        				            previous: '‹',
        				            next:     '›',
        				            last:     '»'
        				        }
       						},
        	          		columns: [
      	          		        { data: "id"},
        	        			{ data: "name" },
        	        			{ data: "directory.path" },
        	        			{ data: "division.name" },
        	        			{ data: "section.name" },
        	        			{ data: "createDate" },
        	        			null,
        	        			{ data: "discription"},
        	        		],
        	        		columnDefs: [{
        	        			targets: 0,
        	        			className: "hidden"
        	        		}, {
        	        			targets: 1
        	        		}, {
        	        			targets: 2,
								render: function(data, type, row) {
									var s = data.split("/");
									return data.substring(s[0].length + s[1].length + 2);
        	        			}
        	        		}, {
        	        			targets: 3,
								render: function(data, type, row) {
									return data.replace("/", "<br />");
        	        			},
        	        			className: "text-center"
        	        		}, {
        	        			targets: 4,
								render: function(data, type, row) {
									return data.replace("/", "<br />");
        	        			},
        	        			className: "text-center"
        	        		}, {
								targets: 5,
								render: function(data, type, row) {
									return format(new Date(data.time), "yyyy-MM-dd hh:mm");
        	        			},
        	        			className: "text-center"
        	        		}, {
        	        			targets: 6,
								render: function(data, type, row) {
									return "<button class=\"btn btn-outline btn-default\" type=\"button\" onclick=\"download($(this))\"><i class=\"fa fa-download\"></i></button>";
								},
    	        				className: "text-center"
        	        		}, {
								targets: 7,
        	        			className: "hidden"
        	        		}],
        	        		searching: false,
        	            	ordering: true,
        	            	pageLength: 30,
        	            	lengthMenu: [
								[ 30, 40, 50, 100, -1 ],
      	            	        ["30", "40", "50", "100", "全部 All"]
							]
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
            
            // init Dropzone
            Dropzone.options.fileAwesomeDropzone = {
            		autoProcessQueue: false,
            		uploadMultiple: true,
            		parallelUploads: 20,
            		maxFiles: 20,
            		addRemoveLinks: true,
            		// Dropzone settings
            		init: function() {
            			var fileDropzone = this;
            			fileDropzone.on("complete", function(file) {
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
        
        function addTopics(topics, div, parent) {
        	var ol = $("<ol class='dd-list'>");
        	div.append(ol);
        	topics.forEach(function(topic) {
            	var name = "";
            	if (parent == "") {
            		name = topic.name;
            	} else {
            		name = parent + " / " + topic.name;
            	}
            	$("#topicNo").append("<option value=\"" + topic.topicNo + "\">" + name + "</option>");
            	$("#topicNoUpload").append("<option value=\"" + topic.topicNo + "\">" + topic.name + "</option>");
            	var li = $("<li class='dd-item' data-id='" + topic.topicNo + "'>");
            	ol.append(li);
            	li.append("<div class='dd-handle'>Drag</div>");
            	if (topic.childTopic.length > 0) {
            		li.append("<div class='dd-content' onclick=\"expandTree($(this))\">" + topic.name + "</div>");
            		addTopics(topic.childTopic, li, name);
            	} else {
                	li.append("<div class='dd-content' onclick='switchTopic(" + topic.topicNo + ")'>" + topic.name + "</div>");
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
        
        function switchTopic(topicNo) {
        	$("#uploadBtn").css("display", "block");
        	$(".dd-content.active").removeClass("active");
        	$(".dd-item[data-id='" + topicNo + "'] > .dd-content").addClass("active");
			$("#load").css("display", "block");
			table.clear().draw();
			table.ajax.url("file/getTopicFiles?topicNo=" + topicNo).load(function() {
				$("#load").css("display", "none");
				// $("#fileTable > tbody > tr").each(addToolTip);
				$("#topicNoUpload").val(topicNo);
			});
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
        
        function switchDivision(type) {
        	$("#sectionNo" + type).empty();
        	$("#sectionNo" + type).append("<option value=\"\">All Section</option>");
        	$.ajax({
                cache: false,
                type: "GET",
                url: "division/getSections",
                data: {divisionNo: $("#divisionNo" + type).val()},
        		dataType : "json",
        		success: function(sections) {
        			sections.forEach(function(section) {
        				$("#sectionNo" + type).append("<option value=\"" + section.sectionNo + "\">" + section.name + "/" + section.enName + "</option>");
    				});
        		}
			});
        }
        
        function search() {
        	$("#uploadBtn").css("display", "none");
        	$(".dd").nestable('collapseAll');
    		$(".dd-content.active").removeClass("active");
    		$("#load").css("display", "block");
			table.clear().draw();
			table.ajax.url("file/search?" + $("#searchForm").serialize()).load(function() {
				$("#load").css("display", "none");
				// $("#fileTable > tbody > tr").each(addToolTip);
				$("#topicNoUpload").val(topicNo);
			});
        }
        
        function download(btn) {
        	var fileId = btn.parent().prev().prev().prev().prev().prev().prev().html();
        	toastr.info("下载文件" + fileId);
        }
	</script>
  </body>
</html>