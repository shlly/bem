<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
  <head>
  	<title>${pageTitle}</title>
  	
  	<%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
  	
  	<link href="<%=basePath%>css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
  </head>
  
  <body>
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	<div class="wrapper wrapper-content animated fadeInUp">
  		<div class="col-lg-12">
  			<table id="executeTable" class="table table-striped table-bordered table-hover">
  			</table>
		</div>
    </div>
  	
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
  	
  	<!-- bootstrap-table -->
  	<script src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
  	<script src="<%=basePath%>js/plugins/bootstrap-table/locale/bootstrap-table-en-US.min.js"></script>
  	
  	<script>
  	var $table = $("#executeTable");
  	$(document).ready(function() {
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
                title: "编号<br />ID"
            }, {
            	field: "status",
                title: "状态<br />Status"
            }, {
            	field: "title",
                title: "标题<br />Title"
            }, {
            	field: "createDate",
                title: "创建时间<br />Create Date"
            }],
            onLoadSuccess: function() {
            	
            },
            onLoadError: function() {
            	toLogin();
            },
            onSort: function() {
            	
            }
        });
  	});
  	</script>
  </body>
</html>