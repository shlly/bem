<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
  <head>
  	<title>${pageTitle}</title>
  	
  	<%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
  	
    <link href="<%=basePath%>css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="<%=basePath%>css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
  	<link href="<%=basePath%>css/plugins/datapicker/datepicker3.css" rel="stylesheet">
  </head>
  
  <body>
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	<div class="wrapper wrapper-content animated fadeInUp">
  		<div class="row">
  			<div class="col-lg-12">
	  			<div class="ibox float-e-margins">
	  				<div class="ibox-title">
	  					<h5>详细信息 Detail</h5>
	  				</div>
	  				<div class="ibox-content">
		  				<form class="form-horizontal">
	  						<div class="row">
	  							<div class="form-group">
	  								<label class="col-lg-2 control-label">主题 / Subject</label>
                                    <div class="col-lg-9 has-error"><input type="text" class="form-control"></div>
                                </div>
	  						</div>
	  						<div class="row">
	  							<div class="form-group">
	  								<label class="col-lg-2 control-label">截止时间 / End Date</label>
                                    <div class="col-lg-9 has-error">
                                    	<div class="input-group date">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control">
										</div>
                                    </div>
                                </div>
	  						</div>
	  						<div class="row">
	  							<div class="form-group">
	  								<label class="col-lg-2 control-label">描述 / Description</label>
                                    <div class="col-lg-9">
                                    	<div class="summernote">
				                            <h3>Lorem Ipsum很简单</h3>
				                            dummy text of the printing and typesetting industry. <strong>Lorem Ipsum has been the industry's</strong> standard dummy text ever since the 1500s,
				                            when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic
				                            typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with
				                            <br/>
				                            <br/>
				                            <ul>
				                                <li>Remaining essentially unchanged</li>
				                                <li>Make a type specimen book</li>
				                                <li>Unknown printer</li>
				                            </ul>
				                        </div>
                                    </div>
                                </div>
	  						</div>
	  						<div class="row">
	  							<div class="form-group">
	  								<div class="col-lg-2 col-lg-offset-2">
	  									<button class="btn btn-primary" type="submit">保存</button>
	  								</div>
                                </div>
	  						</div>
  						</form>
					</div>
				</div>
			</div>			
  		</div>
    </div>
  	
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
  	
  	<!-- SUMMERNOTE -->
    <script src="<%=basePath%>js/plugins/summernote/summernote.min.js"></script>
    <!-- Data picker -->
    <script src="<%=basePath%>js/plugins/datapicker/bootstrap-datepicker.js"></script>
  	
  	<script>
  	$(document).ready(function() {
  		$('.summernote').summernote({
  		  toolbar: [
  		    ['fontsize', ['fontsize']],
  		    ['color', ['color']],
  		  	['bold', ['bold']],
  		  	['italic', ['italic']],
  		  	['underline', ['underline']],
  		  	['clear', ['clear']],
  		    ['insert', ['link']]
  		  ]
  		});
  		$('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true,
            format: "yyyy-mm-dd"
        });
  	});
  	</script>
  </body>
</html>