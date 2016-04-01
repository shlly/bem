<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
  <head>
  	<title>${pageTitle}</title>
  	
    <link href="<%=basePath%>css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="<%=basePath%>css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
  	
  	<%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
  </head>
  
  <body>
  	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content" >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="cursor: pointer;">&times;</span></button>
					<h4 class="modal-title" id="addModalLabel">添加活动</h4>
				</div>
				<div class="modal-body">
	  				<div class="row">
	  					<div class="col-lg-12">
	  						<form class="form-horizontal">
		 						<div class="row">
		 							<div class="form-group">
		 								<label class="col-lg-2 control-label">主题 / Subject</label>
		                                  <div class="col-lg-9 has-error"><input type="text" class="form-control"></div>
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
	</div>
	
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	
  	<div class="wrapper wrapper-content animated fadeInUp">
  		<div class="row">
  			<div class="col-lg-12">
	  			<div class="ibox float-e-margins">
	  				<div class="ibox-title">
	  					<h5>Aniamtion 详细信息</h5>
	  				</div>
	  				<div class="ibox-content">
	  					<div class="row">
				  			<div class="col-lg-10 col-lg-offset-1">
				  				<div class="row">
				  					<div class="col-lg-12">
				  						<table class="table">
						  					<tbody>
						  						<tr>
							  						<td><label><strong>主题 / Subject</strong></label></td>
							  						<td style="text-align: left;">收纳晾晒节</td>
							  					</tr>
							  					<tr>
							  						<td><label><strong>描述 / Description</strong></label></td>
							  						<td style="text-align: left;">
								  						3.9-3.22<br/>
								  						&nbsp;&nbsp;&nbsp;&nbsp;528所有分类：买任意2件7折（海报及促销品除外）<br/>
								  						&nbsp;&nbsp;&nbsp;&nbsp;530压缩袋分类：买任意2件7折（海报及促销品除外）<br/>
								  						&nbsp;&nbsp;&nbsp;&nbsp;530大型晾架：买美家生活满100元送一个衣物洗护袋；满200元送一个衣物洗护袋和一个文胸洗护袋
							  						</td>
							  					</tr>
						  					</tbody>
						  				</table>
				  					</div>
				  				</div>
				  				<div class="row">
				  					<div class="progress progress-striped active" style="margin-bottom: 5px;">
		                                <div style="width: 20%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="75" role="progressbar" class="progress-bar">
		                                    <span class="sr-only">40% Complete (success)</span>
		                                </div>
		                            </div>
				  					<div class="text-center"><label>剩余天数： 10天</label></div>
				  				</div>
				  				<div class="row">
				  					<div class="progress progress-striped active" style="margin-bottom: 5px;">
		                                <div style="width: 50%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="75" role="progressbar" class="progress-bar progress-bar-warning">
		                                    <span class="sr-only">40% Complete (success)</span>
		                                </div>
		                            </div>
				  					<div class="text-center"><label>总完成情况： 50%</label></div>
				  				</div>
						  		<div class="row">
						  			<div class="col-lg-12">
							  			<div class="ibox float-e-margins">
							  				<div class="ibox-title">
							  					<h5>Aniamtion 活动列表</h5>
							  				</div>
							  				<div class="ibox-content">
							  					<div class="row form-horizontal" style="margin-bottom: 10px;">
							  						<div class="col-lg-3">
							  							<button class="btn btn-success" type="button" data-target="#addModal" data-toggle="modal">
						                                	<i class="fa fa-plus"></i> Add
						                                </button>
							  						</div>
							  					</div>
							  					<div class="row">
							  						<table id="topicTable" class="table table-bordered table-striped table-hover">
								  						<thead>
								  							<tr>
								  								<th>序号 / No</th>
								  								<th>主题 / Topic</th>
								  								<th>完成情况 / Process</th>
								  							</tr>
								  						</thead>
									  					<tbody>
									  						<tr>
										  						<td>1</td>
										  						<td>收纳晾晒节</td>
										  						<td><span class="pie">20/40</span><br/>20/40</td>
										  					</tr>
									  						<tr>
										  						<td>2</td>
										  						<td>收纳晾晒节</td>
										  						<td><span class="pie">20/40</span><br/>20/40</td>
										  					</tr>
									  						<tr>
										  						<td>3</td>
										  						<td>收纳晾晒节</td>
										  						<td><span class="pie">20/40</span><br/>20/40</td>
										  					</tr>
									  						<tr>
										  						<td>4</td>
										  						<td>收纳晾晒节</td>
										  						<td><span class="pie">20/40</span><br/>20/40</td>
										  					</tr>
									  						<tr>
										  						<td>5</td>
										  						<td>收纳晾晒节</td>
										  						<td><span class="pie">20/40</span><br/>20/40</td>
										  					</tr>
									  					</tbody>
									  				</table>
							  					</div>
							  				</div>
							  			</div>
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
  	
  	<!-- Peity -->
    <script src="<%=basePath%>js/plugins/peity/jquery.peity.min.js"></script>
    <!-- Peity demo data -->
    <script src="<%=basePath%>js/demo/peity-demo.js"></script>
  	
  	<!-- SUMMERNOTE -->
    <script src="<%=basePath%>js/plugins/summernote/summernote.min.js"></script>
  	
  	<script>
  	$(document).ready(function() {
  		initPeity();
  		$("#topicTable > tbody > tr").bind("click", function() {
  			window.location.href = "<%=basePath%>animation/1/1";
  		});
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
  	});
  	</script>
  </body>
</html>