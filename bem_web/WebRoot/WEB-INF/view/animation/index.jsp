<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
  <head>
  	<title>${pageTitle}</title>
  	
  	<%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
  	
  	<link href="<%=basePath%>css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
  	<link href="<%=basePath%>css/plugins/datapicker/datepicker3.css" rel="stylesheet">
  </head>
  
  <body>
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	<div class="wrapper wrapper-content animated fadeInUp" style="padding-bottom: 0px;">
  		<form>
			<div class="row form-group">
				<div class="col-lg-3">
					<input type="text" placeholder="Title" class="form-control" name="title">
				</div>
				<div class="col-lg-3">
					<div class="input-group date">
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
						<input type="text" class="form-control" placeholder="Date From" name="dateFrom">
					</div>
				</div>
				<div class="col-lg-3">
					<div class="input-group date">
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
						<input type="text" class="form-control" placeholder="Date To" name="dateTo">
					</div>
				</div>
				<div class="col-lg-3">
					<button class="btn btn-primary" type="button" onclick="search()">
						<i class="fa fa-search"></i> search
					</button>
				</div>
			</div>
		</form>
  	</div>
  	<div class="wrapper wrapper-content animated fadeInUp">
		<div class="row">
  			<div class="col-lg-12">
	  			<table id="animationTable" class="table table-striped table-bordered table-hover">
	  			</table>
			</div>
  		</div>
    </div>
  	
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
  	
  	<!-- bootstrap-table -->
  	<script src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
  	<script src="<%=basePath%>js/plugins/bootstrap-table/locale/bootstrap-table-en-US.min.js"></script>
  	
  	<!-- Peity -->
    <script src="<%=basePath%>js/plugins/peity/jquery.peity.min.js"></script>
    <!-- Peity demo data -->
    <script src="<%=basePath%>js/demo/peity-demo.js"></script>
    <!-- Data picker -->
    <script src="<%=basePath%>js/plugins/datapicker/bootstrap-datepicker.js"></script>
  	
  	<script>
  	var $table = $("#animationTable");
  	$(document).ready(function() {
  		$('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true,
            format: "yyyy-mm-dd"
        });
  		
  		$table.bootstrapTable({
            data: [{
          		id: 1, status: 0, title: "关于健康生活宣传看板", createDate: new Date(), endDate: new Date()
            }, {
          		id: 2, status: 2, title: "063 Price Storm DM", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 3, status: 1, title: "2011年海报 陈列图片", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 4, status: 2, title: "舒克牙膏", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 5, status: 3, title: "舒肤佳运动系列新品店", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 6, status: 1, title: "周年庆第一档陈列要求", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 7, status: 2, title: "2013. ANNI3 Layout", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 8, status: 3, title: "周年庆第3档陈列要求", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 9, status: 3, title: "9月染发TG活动", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 10, status: 2, title: "Nonfood price storm", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 11, status: 0, title: "2013. ANNI3 Layout", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 12, status: 0, title: "周年庆第3档陈列要求", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 13, status: 2, title: "9月染发TG活动", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 14, status: 3, title: "Nonfood price storm", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 15, status: 1, title: "2013. ANNI3 Layout", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 16, status: 0, title: "周年庆第3档陈列要求", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 17, status: 0, title: "9月染发TG活动", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 18, status: 2, title: "Nonfood price storm", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 19, status: 1, title: "2013. ANNI3 Layout", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 20, status: 3, title: "周年庆第3档陈列要求", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 21, status: 3, title: "9月染发TG活动", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 22, status: 2, title: "Nonfood price storm", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 23, status: 2, title: "2013. ANNI3 Layout", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 24, status: 0, title: "周年庆第3档陈列要求", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 25, status: 1, title: "9月染发TG活动", createDate: new Date(), endDate: new Date()
          	}, {
          		id: 26, status: 1, title: "Nonfood price storm", createDate: new Date(), endDate: new Date()
          	}],
            sidePagination: "client",
            pageSize: 10,
            pageList: [10, 30, 50, 100, "All"],
            showRefresh: false,
            pagination: true,
            sortName: "createDate",
            sortOrder: "desc",
            columns: [{
            	field: "status",
                title: "状态<br />Status",
                sortable: true,
                formatter: function(value, row, index) {
                	switch(value) {
                	case 0: return "<span class=\"label\">&nbsp结束&nbsp</span>";
                	case 1: return "<span class=\"label label-warning\">&nbsp新增&nbsp</span>";
                	case 2: return "<span class=\"label label-primary\">进行中..</span>";
                	case 3: return "<span class=\"label label-danger\">即将到期</span>";
                	}
                }
            }, {
            	field: "title",
                title: "标题<br />Title",
                sortable: true,
                formatter: function(value, row, index) {
                	var discription = "";
                	for (var i = 0; i < 10; i++) {
                		discription += value;
                	}
                	discription = subStringByByte(discription, 50) + " ......";
                	return "<strong>" + value + "</strong><br>" +
                	"<div class='small'>" + discription + "</div>";
                }
            }, {
            	field: "createDate",
                title: "创建时间<br />Create Date",
                sortable: true,
                formatter: function(value, row, index) {
                	return format(new Date(value.getTime()), "yyyy-MM-dd hh:mm");
                }
            }, {
            	field: "endDate",
                title: "截止时间<br />End Date",
                sortable: true,
                formatter: function(value, row, index) {
                	return format(new Date(value.getTime()), "yyyy-MM-dd hh:mm");
                }
            }, {
            	field: "process",
                title: "完成情况<br />Process",
                formatter: function(value, row, index) {
                	var value = parseInt(Math.random() * 100) + "" + "/100";
                	return "<span class=\"pie\">" + value + "</span><br/>" + value;
                }
            }],
            onLoadSuccess: function() {
            	
            },
            onLoadError: function() {
            	toLogin();
            },
            onAll: function() {
            	initPeity();
            },
            onClickRow: function(row, $element) {
            	window.location.href = "<%=basePath%>animation/" + row.id;
            }
        });
  	});
  	</script>
  </body>
</html>