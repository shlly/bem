<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>

<!DOCTYPE html>
<html>
  <head>
  	<%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
  	
  	<link href="<%=basePath%>css/plugins/switchery/switchery.css" rel="stylesheet">
  </head>
  
  <body>
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	
  	<div class="wrapper wrapper-content animated fadeInUp">
  		<div class="row">
  			<div class="col-lg-4">
  				<div class="ibox float-e-margins">
  					<div class="ibox-content">
  						<div class="file-manager">
  							<h5>主题/Topic</h5>
  							<div class="dd" id="nestable"></div>
  							<div class="clearfix"></div>
						</div>
	                </div>
	            </div>
	        </div>
	        <div class="col-lg-8">
	            <div class="tabs-container">
	                <ul class="nav nav-tabs">
	                    <li class="active"><a data-toggle="tab" href="#tab-1">添加主题</a></li>
	                    <li class=""><a data-toggle="tab" href="#tab-2">修改主题</a></li>
	                    <li class=""><a data-toggle="tab" href="#tab-3">删除主题</a></li>
	                </ul>
	                <div class="tab-content">
	                    <div id="tab-1" class="tab-pane active">
	                        <div class="panel-body">
	                        	<div class="ibox float-e-margins">
						        	<div class="ibox-content">
							        	<form class="form-horizontal">
							        		<div class="form-group">
									        	<label class="col-lg-3 control-label">中文名</label>
									        	<div class="col-lg-9"><input type="text" class="form-control" id="addNameCn"></div>
							        		</div>
							        		<div class="form-group">
									        	<label class="col-lg-3 control-label">英文名</label>
									        	<div class="col-lg-9"><input type="text" class="form-control" id="addNameEn"></div>
							        		</div>
							        		<div class="form-group">
									        	<label class="col-lg-3 control-label">是否允许提问</label>
									        	<div class="col-lg-9">
									        		<input type="checkbox" class="js-switch js-switch1" checked id="addCanQuestion"/>
								        		</div>
							        		</div>
							        		<div class="form-group">
									        	<label class="col-lg-3 control-label">父主题</label>
									        	<div class="col-lg-9">
									        		<select class="form-control m-b pointer" id="addParentTopic" onchange="changeAddParentTopicSelect()">
									        			<option value="-1">无</option>
									        		</select>
								        		</div>
							        		</div>
							        		<div class="form-group">
									        	<label class="col-lg-3 control-label">位置</label>
									        	<div class="col-lg-9">
									        		<select class="form-control m-b pointer" id="addPositionTopic">
									        		</select>
								        		</div>
							        		</div>
								        	<div class="hr-line-dashed"></div>
							        		<div class="form-group">
								    			<button class="btn btn-primary" type="button" onclick="addTopic()">
								    				<i class="fa fa-plus"></i> 添加主题
							    				</button>
								        	</div>
							        	</form>
						        	</div>
					        	</div>
	                        </div>
	                    </div>
	                    <div id="tab-2" class="tab-pane">
	                        <div class="panel-body">
	                        	<div class="ibox float-e-margins">
						        	<div class="ibox-content">
							        	<form class="form-horizontal">
							        		<div class="form-group">
							        			<input type="hidden" id="editTopicNo"/>
									        	<label class="col-lg-3 control-label">中文名</label>
									        	<div class="col-lg-9"><input type="text" class="form-control" id="editNameCn"></div>
							        		</div>
							        		<div class="form-group">
									        	<label class="col-lg-3 control-label">英文名</label>
									        	<div class="col-lg-9"><input type="text" class="form-control" id="editNameEn"></div>
							        		</div>
							        		<div class="form-group">
									        	<label class="col-lg-3 control-label">是否允许提问</label>
									        	<div class="col-lg-9">
									        		<input id="editCanQuestion" type="checkbox" class="js-switch js-switch2" checked/>
								        		</div>
							        		</div>
							        		<div class="form-group">
									        	<label class="col-lg-3 control-label">父主题</label>
									        	<div class="col-lg-9">
									        		<select class="form-control m-b pointer" id="editParentTopic" disabled>
									        		</select>
								        		</div>
							        		</div>
							        		<div class="form-group">
									        	<label class="col-lg-3 control-label">位置</label>
									        	<div class="col-lg-9">
									        		<select class="form-control m-b pointer" id="editPositionTopic">
									        		</select>
								        		</div>
							        		</div>
								        	<div class="hr-line-dashed"></div>
							        		<div class="form-group">
								        		<button type="button" class="btn btn-info" onclick="editTopic()">
													<i class="fa fa-pencil"></i> 修改主题
												</button>
								        	</div>
							        	</form>
						        	</div>
					        	</div>
	                        </div>
	                    </div>
	                    <div id="tab-3" class="tab-pane">
	                        <div class="panel-body">
	                        	<div class="ibox float-e-margins">
						        	<div class="ibox-content">
							        	<form class="form-horizontal">
							        		<div class="form-group">
							        			<input type="hidden" id="delTopicNo"/>
									        	<label class="col-lg-3 control-label">中文名</label>
									        	<div class="col-lg-9"><input type="text" class="form-control" id="delNameCn" disabled></div>
							        		</div>
							        		<div class="form-group">
									        	<label class="col-lg-3 control-label">英文名</label>
									        	<div class="col-lg-9"><input type="text" class="form-control" id="delNameEn" disabled></div>
							        		</div>
								        	<div class="hr-line-dashed"></div>
							        		<div class="form-group">
								        		<button type="button" class="btn btn-danger" onclick="delTopic()">
													<i class="fa fa-times"></i> 删除主题
												</button>
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
    </div>
  	
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
    <!-- Nestable List -->
    <script src="<%=basePath%>js/plugins/nestable/jquery.nestable.js"></script>
    <!-- Switchery -->
  	<script src="<%=basePath%>js/plugins/switchery/switchery.js"></script>
    
    <script>
    var nowTopicId;
    $(document).ready(function(){
    	new Switchery(document.querySelector('.js-switch1'), { color: '#1AB394' });
    	new Switchery(document.querySelector('.js-switch2'), { color: '#1AB394' });
    	
    	$.ajax({
            cache: false,
            type: "GET",
	        async: false,
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
    			}
    		}
    	});
    	
    });
    
    function addTopics(topics, div, parent) {
    	var ol = $("<ol class='dd-list'>");
    	div.append(ol);
    	topics.forEach(function(topic, index) {
        	var li = $("<li class='dd-item' data-id='" + topic.topicNo + "' data-important-level='" + topic.importantLevel + "' data-can-question='" + topic.canQuestion + "'>");
        	ol.append(li);
        	li.append("<div class='dd-handle'>Drag</div>");
        	if (topic.parentTopicNo == 0) {
        		li.append("<div class='dd-content' ondblclick=\"expandTree($(this))\" onclick=\"switchTopic(" + topic.topicNo + ", 0)\">" + topic.name + "<br/>" + topic.enName + "</div>");
        		$("#addParentTopic").append("<option data-important-level=\"" + topic.importantLevel + "\" value=\"" + topic.topicNo + "\">" + topic.name + "</option>");
        		if (index == 0)
        			$("#addPositionTopic").append("<option data-important-level=\"" + (topic.importantLevel - 1) + "\" value=\"" + topic.topicNo + "\">&quot;" + topic.name + "&quot; -- 之前</option>");
        		$("#addPositionTopic").append("<option data-important-level=\"" + topic.importantLevel + "\" value=\"" + topic.topicNo + "\">&quot;" + topic.name + "&quot; -- 之后</option>");
        		addTopics(topic.childTopic, li, name);
        	} else {
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
    	var topic;
    	var topics;
    	var parentTopic;
		$("#editParentTopic").empty();
    	if (level == 0) {
        	topic = $("#nestable > ol > li[data-id='" + topicNo + "']");
        	topics = $("#nestable > ol > li");
    		$("#editParentTopic").html("<option value=\"-1\">无</option>");
        	$("#addParentTopic").val(topicNo);
        	changeAddParentTopicSelect();
    	} else if (level == 1) {
        	topic = $("#nestable > ol > li > ol > li[data-id='" + topicNo + "']");
        	parentTopic = topic.parent().parent();
        	topics = $("#nestable > ol > li[data-id='" + parentTopic.attr("data-id") + "'] > ol > li");
        	parentTopic.parent().children().each(function() {
        		if (parentTopic.attr("data-id") == $(this).attr("data-id"))
        			$("#editParentTopic").append("<option class=\"errorColor\" value=\"" + $(this).attr("data-id") + "\">" + $(this).children(".dd-content").html().split("<br>")[0] + " -- 当前位置</option>");
        		else
        			$("#editParentTopic").append("<option value=\"" + $(this).attr("data-id") + "\">" + $(this).children(".dd-content").html().split("<br>")[0] + "</option>");
        	});
        	$("#editParentTopic").val(parentTopic.attr("data-id"));
        	$("#addParentTopic").val(parentTopic.attr("data-id"));
        	changeAddParentTopicSelect();
    	}
    	$("#editTopicNo").val(topicNo);
    	$("#delTopicNo").val(topicNo);
    	var topicName = topic.children(".dd-content").html().split("<br>");
		$("#editNameCn").val(topicName[0]);
		$("#editNameEn").val(topicName[1]);
		$("#delNameCn").val(topicName[0]);
		$("#delNameEn").val(topicName[1]);
		if (topic.attr("data-can-question") == '0') {
			if ($("#editCanQuestion").is(':checked'))
				$("#editCanQuestion").trigger("click");
		} else {
			if (!$("#editCanQuestion").is(':checked'))
				$("#editCanQuestion").trigger("click");
		}
		$("#editPositionTopic").empty();
		var importantLevel = parseInt(topic.attr("data-important-level"));
		var i = 0;
		topics.each(function(index) {
			if ($(this).children(".dd-content").html() == topic.children(".dd-content").html()) {
				$("#editPositionTopic").append("<option data-important-level=\"" + ($(this).attr("data-important-level") - 1) + "\" class=\"errorColor\" value=\"" + $(this).attr("data-id") + "\">当前位置</option>");
				if (index != 0)
					$("#editPositionTopic").children("option:nth-last-child(2)").remove();
				i++;
				if (index == 0 || index == topics.length - 1) {
					return true;
				}
			} else {
				if (index == 0) {
					$("#editPositionTopic").append("<option data-important-level=\"" + (parseInt($(this).attr("data-important-level")) - 1) + "\" value=\"-1\">&quot;" + $(this).children(".dd-content").html().split("<br>")[0] + "&quot; -- 之前</option>");
					$("#editPositionTopic").append("<option data-important-level=\"" + $(this).attr("data-important-level") + "\" value=\"" + $(this).attr("data-id") + "\">&quot;" + $(this).children(".dd-content").html().split("<br>")[0] + "&quot; -- 之后</option>");
				} else
					$("#editPositionTopic").append("<option data-important-level=\"" + ($(this).attr("data-important-level") - i) + "\" value=\"" + $(this).attr("data-id") + "\">&quot;" + $(this).children(".dd-content").html().split("<br>")[0] + "&quot; -- 之后</option>");
			}
		});
    	$("#editPositionTopic").val(topicNo);
    }
    
    function changeAddParentTopicSelect() {
    	$("#addPositionTopic").empty();
    	if ($("#addParentTopic").val() == "-1") {
        	$("#nestable > ol > li").each(function(index) {
        		if (index == 0)
        			$("#addPositionTopic").append("<option data-important-level=\"" + (parseInt($(this).attr("data-important-level")) - 1) + "\" value=\"" + $(this).attr("data-id") + "\">&quot;" + $(this).children(".dd-content").html().split("<br>")[0] + "&quot; -- 之前</option>");
        		$("#addPositionTopic").append("<option data-important-level=\"" + $(this).attr("data-important-level") + "\" value=\"" + $(this).attr("data-id") + "\">&quot;" + $(this).children(".dd-content").html().split("<br>")[0] + "&quot; -- 之后</option>");
        	});
    	} else {
    		$("#nestable > ol > li[data-id='" + $("#addParentTopic").val() + "'] > ol > li").each(function(index) {
        		if (index == 0)
        			$("#addPositionTopic").append("<option data-important-level=\"" + (parseInt($(this).attr("data-important-level")) - 1) + "\" value=\"" + $(this).attr("data-id") + "\">&quot;" + $(this).children(".dd-content").html().split("<br>")[0] + "&quot; -- 之前</option>");
        		$("#addPositionTopic").append("<option data-important-level=\"" + $(this).attr("data-important-level") + "\" value=\"" + $(this).attr("data-id") + "\">&quot;" + $(this).children(".dd-content").html().split("<br>")[0] + "&quot; -- 之后</option>");
        	});
    	}
    }
    
    function addTopic() {
    	$("#addNameCn").parent().removeClass("has-error");
    	$("#addNameEn").parent().removeClass("has-error");
    	if ($("#addNameCn").val() == null || $("#addNameCn").val() == "" ||
    			$("#addNameEn").val() == null || $("#addNameEn").val() == "") {
    		if ($("#addNameCn").val() == null || $("#addNameCn").val() == "") {
        		$("#addNameCn").parent().addClass("has-error");
    			animationNow($("#addNameCn"), "shake")
    		}
    		if ($("#addNameEn").val() == null || $("#addNameEn").val() == "") {
        		$("#addNameEn").parent().addClass("has-error");
    			animationNow($("#addNameEn"), "shake")
    		}
    		return;
    	}
    	swal({
            title: "是否确认？",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes",
            cancelButtonText: "No",
            closeOnConfirm: false
        }, function () {
        	var importantLevel;
        	if ($("#addPositionTopic option:selected").length == 0) {
        		parentImportantLevel = $("#addParentTopic option:selected").attr("data-important-level");
        		importantLevel = parseInt(parentImportantLevel) * 100 + 1;
        	} else {
        		importantLevel = parseInt($("#addPositionTopic option:selected").attr("data-important-level")) + 1;
        	}
        	$.ajax({
                cache: false,
                type: "POST",
    	        async: false,
                url: "<%=basePath%>topic/addTopic",
                data: {
                	name: $("#addNameCn").val(),
                	enName: $("#addNameEn").val(),
                	parentTopicNo:  parseInt($("#addParentTopic").val()),
                	canQuestion: $("#addCanQuestion").is(':checked') ? 1 : 0,
                	importantLevel: importantLevel
                },
        		dataType : "json",
        		success: function(topic) {
        			if (topic != null) {
                		swal({
                            title: "添加成功",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK",
                            closeOnConfirm: false
                        }, function () {
                        	location.reload();
                        });
        			} else
                		swal("添加失败", "", "error");
        		}
        	});
        });
    }
    
    function editTopic() {
    	$("#editNameCn").parent().removeClass("has-error");
    	$("#editNameEn").parent().removeClass("has-error");
    	if ($("#editNameCn").val() == null || $("#editNameCn").val() == "" ||
    			$("#editNameEn").val() == null || $("#editNameEn").val() == "" ||
    			$("#editPositionTopic option").length == 0) {
    		if ($("#editNameCn").val() == null || $("#editNameCn").val() == "") {
        		$("#editNameCn").parent().addClass("has-error");
    			animationNow($("#editNameCn"), "shake")
    		}
    		if ($("#editNameEn").val() == null || $("#editNameEn").val() == "") {
        		$("#editNameEn").parent().addClass("has-error");
    			animationNow($("#editNameEn"), "shake")
    		}
    		if ($("#editPositionTopic option").length == 0) {
    			swal("修改失败", "请选择一个主题", "error");
    		}
    		return;
    	}
    	swal({
            title: "是否确认？",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes",
            cancelButtonText: "No",
            closeOnConfirm: false
        }, function () {
        	$.ajax({
                cache: false,
                type: "POST",
    	        async: false,
                url: "<%=basePath%>topic/editTopic",
                data: {
                	topicNo: $("#editTopicNo").val(),
                	name: $("#editNameCn").val(),
                	enName: $("#editNameEn").val(),
                	parentTopicNo:  parseInt($("#editParentTopic").val()),
                	canQuestion: $("#editCanQuestion").is(':checked') ? 1 : 0,
                	importantLevel: parseInt($("#editPositionTopic option:selected").attr("data-important-level")) + 1
                },
        		dataType : "json",
        		success: function(topic) {
        			if (topic != null) {
                    	swal({
                            title: "修改成功",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK",
                            closeOnConfirm: false
                        }, function () {
                        	location.reload();
                        });
                    	
        			} else
                    	swal("修改失败", "", "error");
        		}
        	});
        });
    }
    
    function delTopic() {
    	$("#delNameCn").parent().removeClass("has-error");
    	$("#delNameEn").parent().removeClass("has-error");
    	if ($("#delNameCn").val() == null || $("#delNameCn").val() == "" ||
    			$("#delNameEn").val() == null || $("#delNameEn").val() == "") {
			swal("删除失败", "请选择一个主题", "error");
    		return;
    	}
    	swal({
            title: "是否确认？",
            text: "删除后将无法恢复 ！！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes",
            cancelButtonText: "No",
            closeOnConfirm: false
        }, function () {
        	$.ajax({
                cache: false,
                type: "POST",
    	        async: false,
                url: "<%=basePath%>topic/deleteTopic",
                data: {
                	topicNo: $("#delTopicNo").val()
                },
        		success: function(result) {
        			if (result != null && result == true) {
                    	swal({
                            title: "删除成功",
                            type: "success",
                            confirmButtonColor: "#18a689",
                            confirmButtonText: "OK",
                            closeOnConfirm: false
                        }, function () {
                        	location.reload();
                        });
                    	
        			} else
                    	swal("删除失败", "", "error");
        		}
        	});
        });
    }
    </script>
  </body>
</html>