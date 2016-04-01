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
  	
  	<style>
	  	/* file management */
		.folder-list .active a {
			color: #1ab394;
			text-decoration: underline;
		}
		.folder-list .active .fa {
			color: #1ab394;
		}
		#filePanel .file-list {
			width: 90%;
		}
		.file-list .icon {
		  float: left;
		  padding: 10px 10px;
		}
		.file-list .icon i {
		  font-size: 50px;
		}
		.file-list .icon {
		  height: 70px;
		}
		.file-list .file-name {
		  float: left;
		  height: 70px;
		}
		.file-list .file {
			margin-bottom: 0px;
		}
		.file-box * {
			cursor: pointer;
		}
		.file-box .file {
			border: 1px solid none;
			transition: all 500ms;
			-moz-transition: all 500ms;
			-webkit-transition: all 500ms;
			-o-transition: all 500ms;
		}
		.file-box:HOVER .file {
			border: 1px solid #1ab394;
		}
		.file-box:HOVER .file .file-name {
			text-decoration: underline;
		}
		.file-name {
			border-width: 0px;
		}
  	</style>
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
					<form id="file-awesome-dropzone" class="dropzone" action="#">
						<div class="dropzone-previews"></div>
						<button type="submit" class="btn btn-primary pull-right">全部上传</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- newDirectoryModal -->
	<%-- <div class="modal fade" id="newDirectoryModal" tabindex="-1" role="dialog" aria-labelledby="newDirectoryModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="cursor: pointer;">&times;</span></button>
					<h4 class="modal-title" id="newDirectoryModalLabel">新建目录</h4>
				</div>
				<div class="modal-body">
					<form id="addDirectoryForm" method="post" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">目录名</label>
							<div class="col-sm-8">
								<input type="text" placeholder="请勿超过20个字" class="form-control"
									name="directoryName" id="directoryName"
									onclick="$('#directoryName').parent().removeClass('has-error');">
							</div>
							<div class="col-sm-2">
								<button class="btn btn-primary" type="button" onclick="addDirectory()">保存</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div> --%>
  
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	
  	<div class="wrapper wrapper-content" id="fileMainContext">
	    <div class="row">
	        <div class="col-lg-3">
	            <div class="ibox float-e-margins">
	                <div class="ibox-content">
	                    <div class="file-manager">
	                    	<div class="btn-group btn-block displayStyle">
		                        <a class="btn btn-white btn-bitbucket active1" onclick="switchStyle(1)" style-type="1">
		                            <i class="fa fa-copy"></i>
		                        </a>
		                        <a class="btn btn-white btn-bitbucket" onclick="switchStyle(2)" style-type="2">
		                            <i class="fa fa-bars"></i>
		                        </a>
	                        </div>
	                        <h5>显示:</h5>
	                        <a href="javascript: filterFile(null);" class="all file-control active underline" filter>所有</a>
	                        <a href="javascript: filterFile('excel');" class="excel file-control underline" filter>excel</a>
	                        <a href="javascript: filterFile('word');" class="word file-control underline" filter>word</a>
	                        <a href="javascript: filterFile('ppt');" class="ppt file-control underline" filter>ppt</a>
	                        <a href="javascript: filterFile('图片');" class="图片 file-control underline" filter>图片</a>
	                        <a href="javascript: filterFile('压缩包');" class="压缩包 file-control underline" filter>压缩包</a>
	                        <h5 class="tag-title">排序</h5>
                            <ul class="tag-list" style="padding: 0; height: 75px;">
                                <li><a class="name active underline" href="javascript:sortFile('name')" sort><i class="fa fa-sort-asc"></i> 文件名</a></li>
                                <li><a class="type underline" href="javascript:sortFile('type')" sort><i class="fa fa-sort-asc"></i> 文件类型</a></li>
                                <li><a class="time underline" href="javascript:sortFile('time')" sort><i class="fa fa-sort-asc"></i> 上传时间</a></li>
                            </ul>
	                        <div class="hr-line-dashed"></div>
	                        <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#uploadModal">上传文件</button>
	                        <!-- <div class="btn-group btn-block">
		                        <button class="btn btn-success" data-toggle="modal" data-target="#newDirectoryModal">新建目录</button>
		                        <button class="btn btn-primary" data-toggle="modal" data-target="#uploadModal">上传文件</button>
	                        </div> -->
	                        <div class="hr-line-dashed"></div>
	                        <h5>目录</h5>
	                        <%-- <ul class="folder-list" style="padding: 0">
	                        	<c:forEach var="org" items="${orgs}" varStatus="status">
	                        		<c:choose>
	                        			<c:when test="${status.index == 0}">
	                        				<li class="active org${org.directoryId}"><a href="javascript:switchDir(${org.directoryId})" class="underline"><i class="fa fa-folder outline"></i>${org.name}</a></li>
	                        			</c:when>
	                        			<c:otherwise>
	                        				<li class="org${org.directoryId}"><a href="javascript:switchDir(${org.directoryId})" class="underline"><i class="fa fa-folder"></i>${org.name}</a></li>
	                        			</c:otherwise>
	                        		</c:choose>
	                        	</c:forEach>
	                        </ul> --%>
	                        
	                        <ul class="folder-list" style="padding: 0">
	                        	<li><a href="" class="underline"><i class="fa fa-folder"></i>1</a></li>
	                        	<li><a href="" class="underline"><i class="fa fa-folder"></i>2</a></li>
	                        	<li><a href="" class="underline"><i class="fa fa-folder"></i>3</a></li>
	                        	<li><a href="" class="underline"><i class="fa fa-folder"></i>4</a></li>
	                        	<li><a href="" class="underline"><i class="fa fa-folder"></i>5</a></li>
	                        </ul>
	                        
	                        <div class="dd" id="nestable">
                            </div>
	                        
	                        <div class="clearfix"></div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-lg-9 animated fadeInRight">
               	<div class="row text-center" id="noFiles" style="display: none;">
               		<h2><i class="fa fa-frown-o"></i> 没有文件。。。</h2>
               	</div>
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
					</div>
           		</div>
        	</div>
    	</div>
    </div>
  	
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
  	
  	<!-- isotope -->
  	<script src="<%=basePath%>js/plugins/isotope.pkgd.min.js"></script>
  	<!-- BootstrapMenu -->
  	<script src="<%=basePath%>js/plugins/BootstrapMenu.min.js"></script>
  	<!-- Toastr script -->
    <script src="<%=basePath%>js/plugins/toastr/toastr.min.js"></script>
    <!-- DROPZONE -->
    <script src="<%=basePath%>js/plugins/dropzone/dropzone.js"></script>
    
    <!-- Nestable List -->
    <script src="js/plugins/nestable/jquery.nestable.js"></script>
  	
  	<script>
        $(document).ready(function(){
        	// slimScroll
        	/* $("#nestable").slimScroll({
                height: '320px',
                railOpacity: 0.9
            }); */
        	
        	// nestable
            $.ajax({
                cache: false,
                type: "POST",
                url: "file/getOrgs",
                data: {orgNo: null, isChild: true},
        		dataType : "json",
        		success: function(orgs) {
        			if(orgs != null) {
        				addOrgs(orgs, $("#nestable"));
        	            $("#nestable").nestable();
        	            $(".dd").nestable('collapseAll');
        	            switchOrg($("#nestable .dd-list:first-child .dd-item:first-child").attr("data-id"));
       				}
        		}
        	});
        	
        	// init isotope
        	$("#filePanel").isotope({
        		getSortData: {
        			name: '[data-name]',
        			type: '[data-type]',
        			time: '[data-time]',
        			file: '[data-file]'
        		},
        		sortBy : [ 'file', 'name' ],
        		sortAscending: {file: true, name: true}
        	});
        	
        	// init BootstrapMenu
            var fileMenu = new BootstrapMenu('.file-box', {
            	fetchElementData: function($rowElem) {
            		//console.log($rowElem);
            		return $rowElem;
           		},
            	actions: [{
            		name: '下载',
            		onClick: function(row) {
            			toastr.info("触发下载 " + row.attr("data-name"));
           			}
            	}, {
            		name: '删除',
            		onClick: function(row) {
            			$("#filePanel").isotope( 'remove', row).isotope('layout');
           			}
           		}]
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
        
        function addOrgs(orgs, div) {
        	var ol = $("<ol class='dd-list'>");
        	div.append(ol);
        	orgs.forEach(function(org) {
            	var li = $("<li class='dd-item' data-id='" + org.orgNo + "'>");
            	ol.append(li);
            	li.append("<div class='dd-handle'>Drag</div>");
            	li.append("<div class='dd-content' onclick='switchOrg(" + org.orgNo + ")'>" + org.name + "</div>");
            	if (org.childOrg.length > 0)
            		addOrgs(org.childOrg, li);
        	});
        }
        
        function switchOrg(orgNo) {
        	$(".dd-content.active").removeClass("active");
        	$(".dd-item[data-id='" + orgNo + "'] > .dd-content").addClass("active");
        	
        	
/*         	var oldActive = $(".folder-list").children(".active");
        	oldActive.removeClass("active");
        	oldActive.find(".fa").removeClass("outline");
        	var nowActive = $(".folder-list .org" + dirId);
        	nowActive.addClass("active");
        	nowActive.find(".fa").addClass("outline"); */
			$("#filePanel").isotope("remove", $(".file-box"));
			$("#noFiles").css("display", "none");
			$("#load").css("display", "block");
/* 			var header = $("meta[name='_csrf_header']").attr("content");
			var token = $("meta[name='_csrf']").attr("content"); */
        	$.ajax({
                cache: false,
                type: "POST",
                url: "file/getOrgFiles",
                data: {orgNo: orgNo},
        		dataType : "json",
        		/* beforeSend: function(xhr){
        	        xhr.setRequestHeader(header, token);
        	    }, */
        		success: function(allFiles) {
        			if (allFiles != null) {
        				$("#load").css("display", "none");
        				if ((allFiles.dirs == null || allFiles.files == null) || (allFiles.dirs.length == 0 && allFiles.files.length == 0)) {
        					$("#noFiles").css("display", "block");
        				} else {
	        				allFiles.dirs.forEach(function(dir) {
	        					$("#filePanel").isotope("insert", createFileBox(dir.typeIcon.name, dir.typeIcon.icon, "dir", dir.createDate, dir.name, dir.id));
	        				});
	        				allFiles.files.forEach(function(file) {
	        					$("#filePanel").isotope("insert", createFileBox(file.typeIcon.name, file.typeIcon.icon, "file", file.createDate, file.name, file.id));
	        				});
	        	            $('.file-box').each(function() {
	        	                animationHover($(this).find('.icon'), 'rubberBand');
	        	            });
        				}
        			}
        		}
        	});
        }
        
        function createFileBox(type, iconClass, file, date, name, id) {
        	var file_list = "";
        	var col_md_12 = "";
        	var col_md_2 = "";
        	var col_md_10 = "";
        	if ($(".displayStyle .active1").attr("style-type") == 1) {
        		file_list = "";
        	} else if ($(".displayStyle .active1").attr("style-type") == 2) {
        		file_list = "file-list";
        		col_md_12 = "col-md-12";
        		col_md_2 = "col-md-2";
        		col_md_10 = "col-md-10";
        	}
        	var time = (date.year + 1900) + "-" + (date.month + 1) + "-" + date.date;
        	var filebox = $("<div>");
        	filebox.attr("id", file + id);
        	filebox.attr("data-name", name);
        	filebox.attr("data-type", type);
        	filebox.attr("data-time", time);
        	filebox.attr("data-file", file);
        	filebox.addClass("file-box " + type);
        	filebox.addClass(file_list);
        	filebox.addClass(col_md_12);
        	var file = $("<div>");
        	filebox.append(file);
        	file.addClass("file");
        	file.addClass(col_md_12);
        	var a = $("<a>");
        	file.append(a);
        	a.attr("href", "");
/*         	var span = $("<span>");
        	a.append(span);
        	span.addClass("corner"); */
        	var icon = $("<div>");
        	a.append(icon);
        	icon.addClass("icon");
        	icon.addClass(col_md_2);
        	icon.append("<i class='fa " + iconClass + "'></i>");
        	var file_name = $("<div>");
        	a.append(file_name);
        	file_name.addClass("file-name");
        	file_name.addClass(col_md_10);
        	file_name.append(name + "<br/><small>添加于: " + time + "</small>");
        	return filebox;
        }
        
        function uploadFile() {
        	
		}
        
        function filterFile(filter) {
        	$(".file-manager a[filter]").removeClass("active");
        	if (filter) {
            	$(".file-manager ." + filter).addClass("active");
            	$("#filePanel").isotope({filter: '.' + filter});
        	} else {
            	$(".file-manager .all").addClass("active");
            	$("#filePanel").isotope({filter: '*'});
        	}
        }
        
        function sortFile(sort) {
        	var click = $(".file-manager ." + sort);
        	if (click.hasClass("active")) {
        		if (click.find(".fa").attr("class") == "fa fa-sort-asc")
        			click.find(".fa").attr("class", "fa fa-sort-desc");
        		else
        			click.find(".fa").attr("class", "fa fa-sort-asc");
        	} else {
            	$(".file-manager a[sort]").removeClass("active");
            	$(".file-manager a[sort] .fa").attr("class", "fa fa-sort-asc");
            	click.addClass("active");
        	}
        	var arr = [];
        	arr['file'] = true;
        	if (click.find(".fa").attr("class") == "fa fa-sort-asc")
            	arr[sort] = true;
        	else
            	arr[sort] = false;
        	var obj = {};
        	for(var i in arr)
        		obj[i] = arr[i];
    		$("#filePanel").isotope({sortBy : ['file', sort], sortAscending: obj});
        }
        
        function addDirectory() {
        	if ($("#directoryName").val().length > 20 || $("#directoryName").val().length < 1) {
        		$("#directoryName").parent().addClass("has-error");
        		animationNow($("#directoryName"), "shake");
        	} else {
        		$("#noFiles").css("display", "none");
        		$("#filePanel").isotope("insert", createFileBox("目录", "fa-folder", "dir", new Date(), $("#directoryName").val(), 99));
        		$("#directoryName").val("");
        		$("#directoryName").parent().removeClass("has-error");
        		$("#newDirectoryModal").modal('hide');
        	}
        }
        
        function switchStyle(type) {
        	$(".displayStyle .active1").removeClass("active1");
        	$(".displayStyle > a[style-type='" + type + "']").addClass("active1");
        	switchOrg($(".dd-item > .dd-content.active").parent().attr("data-id"));
        }
	</script>
  </body>
</html>