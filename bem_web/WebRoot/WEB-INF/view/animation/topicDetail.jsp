<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
  <head>
  	<title>${pageTitle}</title>
  	
  	<%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
  	<link href="<%=basePath%>css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="<%=basePath%>css/plugins/blueimp/css/blueimp-gallery.min.css" rel="stylesheet">
  </head>
  
  <body>
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	<div class="wrapper wrapper-content animated fadeInUp">
  		<div class="row">
  			<div class="col-lg-12">
	  			<div class="ibox float-e-margins">
	  				<div class="ibox-title">
	  					<h5>Topic 详细信息</h5>
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
			                               <div style="width: 50%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="75" role="progressbar" class="progress-bar progress-bar-warning">
			                                   <span class="sr-only">40% Complete (success)</span>
			                               </div>
			                           </div>
				  					<div class="text-center"><label>门店完成情况： 20/40</label></div>
				  				</div>
				  				<div class="row">
				  					<label>门店</label>
				  				</div>
				  				<div class="row">
				  					<div class="col-lg-3">
				  						<div class="checkbox checkbox-inline checkbox-primary storeCheckBox">
											<input type="checkbox" checked>
											<label>YP2-长阳店 (3p)</label>
										</div>
				  					</div>
				  					<div class="col-lg-3">
				  						<div class="checkbox checkbox-inline checkbox-primary storeCheckBox">
											<input type="checkbox">
											<label>YP2-长阳店 (0p)</label>
										</div>
				  					</div>
				  					<div class="col-lg-3">
				  						<div class="checkbox checkbox-inline checkbox-primary storeCheckBox">
											<input type="checkbox">
											<label>YP2-长阳店 (0p)</label>
										</div>
				  					</div>
				  					<div class="col-lg-3">
				  						<div class="checkbox checkbox-inline checkbox-primary storeCheckBox">
											<input type="checkbox" checked>
											<label>YP2-长阳店 (3p)</label>
										</div>
				  					</div>
				  				</div>
				  				<div class="row">
				  					<div class="col-lg-3">
				  						<div class="checkbox checkbox-inline checkbox-primary storeCheckBox">
											<input type="checkbox">
											<label>YP2-长阳店 (0p)</label>
										</div>
				  					</div>
				  					<div class="col-lg-3">
				  						<div class="checkbox checkbox-inline checkbox-primary storeCheckBox">
											<input type="checkbox" checked>
											<label>YP2-长阳店 (3p)</label>
										</div>
				  					</div>
				  					<div class="col-lg-3">
				  						<div class="checkbox checkbox-inline checkbox-primary storeCheckBox">
											<input type="checkbox" checked>
											<label>YP2-长阳店 (3p)</label>
										</div>
				  					</div>
				  					<div class="col-lg-3">
				  						<div class="checkbox checkbox-inline checkbox-primary storeCheckBox">
											<input type="checkbox" checked>
											<label>YP2-长阳店 (3p)</label>
										</div>
				  					</div>
				  				</div>
				  				<div class="row">
				  					<div class="col-lg-3">
				  						<div class="checkbox checkbox-inline checkbox-primary storeCheckBox">
											<input type="checkbox">
											<label>YP2-长阳店 (0p)</label>
										</div>
				  					</div>
				  					<div class="col-lg-3">
				  						<div class="checkbox checkbox-inline checkbox-primary storeCheckBox">
											<input type="checkbox" checked>
											<label>YP2-长阳店 (3p)</label>
										</div>
				  					</div>
				  					<div class="col-lg-3">
				  						<div class="checkbox checkbox-inline checkbox-primary storeCheckBox">
											<input type="checkbox">
											<label>YP2-长阳店 (0p)</label>
										</div>
				  					</div>
				  					<div class="col-lg-3">
				  						<div class="checkbox checkbox-inline checkbox-primary storeCheckBox">
											<input type="checkbox" checked>
											<label>YP2-长阳店 (3p)</label>
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
    
	<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
		<div class="slides"></div>
		<h3 class="title"></h3>
		<a class="prev">‹</a>
		<a class="next">›</a>
		<a class="close">×</a>
		<a class="play-pause"></a>
		<ol class="indicator"></ol>
	</div>
  	
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
  	
  	<!-- blueimp gallery -->
    <script src="<%=basePath%>js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>
  	
  	<script>
  	$(document).ready(function() {
  		$(":checkbox").bind("click", function() {
  			$(this).blur();
  			event.preventDefault();
		});
  		$(".storeCheckBox").bind("click", function() {
  			if ($(this).children(":checkbox").is(':checked')) {
 	  			var gallery = blueimp.Gallery([
					'<%=basePath%>img/gallery/1.jpg',
					'<%=basePath%>img/gallery/2.jpg',
					'<%=basePath%>img/gallery/4.jpg'
				]);
  			} else {
  				animationNow($(this), "shake");
  			}
  			$(this).blur();
  			event.preventDefault();
		});
  	});
  	</script>
  </body>
</html>