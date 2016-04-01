<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <link href="<%=basePath%>css/plugins/jQueryUI/jquery-ui.css" rel="stylesheet">
    
  	<%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
  	
    <link href="<%=basePath%>css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="<%=basePath%>css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
  </head>
  
  <body>
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	
  	<div class="wrapper wrapper-content animated fadeInUp">
  		<div class="row">
	        <div class="col-lg-4">
	            <%-- <input type="text" class="form-control"
	            	oninput="searchUserName($(this))" onfocus="$(this).popover('show')" onblur="$(this).popover('destroy')"
	            	placeholder="username" name="username" id="username"
	            	data-container="body" data-toggle="popover" data-placement="bottom" data-html="true"
	            	data-content="没有建议<br/>no suggestion"> --%>
	            <input type="text" class="form-control"
	            	placeholder="用户名" name="username" id="username">
	        </div>
	        <div class="col-lg-4">
	            <select class="form-control m-b pointer" name="role" id="role" onchange="switchRole($(this).val())">
                </select>
	        </div>
	        <div class="col-lg-4">
	            <button type="button" class="btn btn-primary" onclick="addAuth()">保存</button>
	        </div>
        </div>
        <div class="row">
        	<div class="col-lg-12" id="function">
        	</div>
        </div>
        <div class="row" style="margin-top: 20px;">
			<div class="col-lg-12">
               	<table id="authTable" class="table table-striped table-bordered table-hover my-table">
               	</table>
			</div>
  		</div>
  	</div>
  	
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
  	
  	<script src="<%=basePath%>js/plugins/jquery-ui/jquery-ui.min.js"></script>
  	
  	<!-- bootstrap-table -->
  	<script src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
  	<script src="<%=basePath%>js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    
    <script>
    var roleMap = {};
    var $table = $("#authTable");
    $(document).ready(function(){
    	$("#username").autocomplete({
    		source: function( request, response ) {
    			$.getJSON( "<%=basePath%>auth/getUserName", {
    				uid: request.term
   				}, response);
   			}
    	});
    	
    	$table.bootstrapTable({
    		url: "<%=basePath%>auth/getUserRole",
            sidePagination: "client",
            pageSize: 9,
            pageList: [9, 18, 45, 81, "All"],
            showRefresh: false,
            pagination: true,
            columns: [{
                field: "id",
                title: "编号"
            }, {
                field: "username",
                title: "用户名",
                sortable: true
            }, {
                field: "role.name",
                title: "角色",
                sortable: true
            }, {
                field: "operate",
                title: "操作",
                formatter: function(value, row, index) {
                	return "<button class=\"btn btn-outline btn-default errorColor\" type=\"button\" onclick=\"delAuth($(this))\"><i class=\"fa fa-times\"></i></button>";
                }
            }],
            onLoadSuccess: function() {
            },
            onLoadError: function() {
            	toLogin();
            }
        });
    	
    	$.ajax({
	        cache: false,
	        type: "GET",
	        async: false,
	        url: "<%=basePath%>auth/getRoles",
			dataType : "json",
			success: function(roles) {
				roles.forEach(function(role) {
					$("#role").append("<option value=\"" + role.id + "\">" + role.name + "</option>");
					role.functions.forEach(function(func) {
						roleMap[role.id + "_" +func.id] = true;
					});
				});
			}
		});
    	$.ajax({
	        cache: false,
	        type: "GET",
	        async: false,
	        url: "<%=basePath%>auth/getFunctions",
			dataType : "json",
			success: function(functions) {
				functions.forEach(function(func) {
					$("#function").append(
							"<div class=\"checkbox checkbox-inline checkbox-primary\" data-id=\"" + func.id + "\">"
							+ "<input type=\"checkbox\" value=\"option1\" class=\"pointer\" data-status=\"0\" disabled>"
							+ "<label> " + func.name + " </label>"
							+ "</div>");
				});
				switchRole($("#role").val());
			}
		});
    });
    
    <%-- function searchUserName(input) {
    	$.ajax({
	        cache: false,
	        type: "GET",
	        data: {uid: input.val()},
	        url: "<%=basePath%>auth/getUserName",
			dataType : "json",
			success: function(data) {
				if (data != null && data.length > 0) {
					var title = "";
					data.forEach(function(username) {
						title += username + "<br/>"
		    		});
					input.attr("data-content", title);
   				} else if (data.length == 0 && input.val() != null && input.val() != "") {
					input.attr("data-content", "用户名不存在<br/>Username is non-existent");
   				} else if (input.val() == null || input.val() == "") {
					input.attr("data-content", "没有建议<br/>no suggestion");
   				}
		    	if (input.val() + "<br/>" != input.attr("data-content")) {
		    		input.parent().removeClass("has-success");
		    		input.parent().addClass("has-error");
		    	} else {
		    		input.parent().removeClass("has-error");
		    		input.parent().addClass("has-success");
		    	}
				input.popover('show');
			},
			error: function() {
				input.attr("data-content", "出错，请重新登录<br/>error, please login again");
				input.popover('show');
			}
		});
    } --%>
    
    function switchRole(roleId) {
    	$("#function > div").each(function() {
    		if (roleMap[roleId + "_" + $(this).attr("data-id")]) {
    			if ($(this).children("input").attr("data-status") == 0) {
    				$(this).children("input").removeAttr("disabled");
    				$(this).children("input").trigger("click");
        			$(this).children("input").attr("data-status", "1");
        			$(this).children("input").attr("disabled", "disabled");
    			}
    		} else {
    			if ($(this).children("input").attr("data-status") == 1) {
    				$(this).children("input").removeAttr("disabled");
    				$(this).children("input").trigger("click");
        			$(this).children("input").attr("data-status", "0");
        			$(this).children("input").attr("disabled", "disabled");
    			}
    		}
    	});
    }
    
    function addAuth() {
    	$("#username").parent().removeClass("has-error");
    	if ($("#username").val() != null &&　$("#username").val() != '') {
    		$.ajax({
                cache: false,
                type: "POST",
                url: "<%=basePath%>auth/addAuth",
                data: {
                	username: $("#username").val(),
                	roleId: $("#role").val()
               	},
    	        async: false,
        		success: function(id) {
        			if (id != null && id != "") {
                		var data = [];
                		data.push({
                			id: id,
                			username: $("#username").val(),
                			"role.name": $("#role option:selected").html()
                		});
                		$table.bootstrapTable('prepend', data);
                		$("#username").val("");
                		swal("添加成功", "", "success");
        			} else {
                		swal("添加失败", "请检查用户名是否正确", "error");
        			}
        		}
            });
    	} else {
    		$("#username").parent().addClass("has-error");
    		animationNow($("#username"), "shake");
    	}
    }
    
    function delAuth(tr) {
    	swal({
            title: "是否确认？",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "是",
            cancelButtonText: "否",
            closeOnConfirm: false
        }, function () {
        	var id = tr.parent().prev().prev().prev().html();
        	$.ajax({
                cache: false,
                type: "POST",
                url: "<%=basePath%>auth/delAuth",
                data: {id: parseInt(id)},
    	        async: false,
        		success: function(result) {
                	$table.bootstrapTable('remove', {field: 'id', values: [parseInt(id)]});
                	swal("已删除", "", "success");
        		}
            });
        });
    }
    </script>
  </body>
</html>