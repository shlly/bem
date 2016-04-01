<%@ page pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/layout/jspHead.jsp"%>

<!DOCTYPE html>
<html>
  <head>
  <%@ include file="/WEB-INF/view/layout/headResource.jsp"%>
   <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
  </head>
  
  <body>
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	<!--  -->
  	<div class="modal-body" style="display:none;padding-top: 40px;">
	<div class="row">
       <form method="post" id="form" class="form-horizontal" action="q&a/upload" enctype="multipart/form-data">
       
       <div class="form-group"><label class="col-sm-2 control-label">标题 TITLE</label>
          <div class="col-sm-10"><input type="text" name="title" placeholder="title" class="form-control" required="required"></div>
       </div>
      <div class="form-group" >
	      <label class="col-sm-2 control-label">描述 DESCRIPTION</label>
		     <div class="col-sm-10">	
		  <textarea class="form-control" placeholder="Textarea" name="content" rows="3"  required="required" ></textarea>
			</div>
      </div>
                        <div class="form-group" id="data_5">
                                <label class="col-sm-2 control-label">时间限制</label>
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" class="input-sm form-control" name="start" >
                                    <span class="input-group-addon">到</span>
                                    <input type="text" class="input-sm form-control" name="end" >
                                </div>
                            </div>

      
			<div class="form-group">
                   <div class="col-sm-4 col-sm-offset-2">
                       <button id="cancel" class="btn btn-white" type="button">取消</button>
                       <button class="btn btn-primary" type="submit">保存</button>
                   </div>
	        </div>
        </form>
      </div>
     </div>
  	
  	<!-- 回复 -->
  	<table class="reply" style="display:none">
				<tbody><tr>
					<td class="colSty1">主题：</td>
					<td class="colSty2">185进口食品海报预估4.6-4.17</td>
					<td class="colSty1">描述：</td>
					<td class="colSty2">185进口食品海报预估4.6-4.17</td>
				</tr>
				<tr>
					<td class="colSty1">时间：</td>
					<td class="colSty2">2016/03/22-2016/03/29</td>
					<td class="colSty1">&nbsp;</td>
					<td class="colSty2">&nbsp;</td>
				</tr>
			</tbody></table>
	
  	
  	
  	
  	
  	
  	<!-- mainTable -->
  	<div class="wrapper wrapper-content animated fadeInUp" id="dataMainContext">
	    <div class="row">
	        <div class="col-lg-12 animated fadeInUp">
	  			<form id="searchForm">
	        		<div class="row form-group fileSearch">
			    		<div class="col-lg-2">
			    			<input type="text" placeholder="Title Name" class="form-control" name="name">
			    		</div>
			    		<div class="col-lg-2">
			    			<select class="form-control m-b divisionNo pointer" name="division.divisionNo" id="divisionNo" onchange="switchDivision('')">
			    				<option value="">所有处 / All Division</option>
			    			</select>
			    		</div>
			    		<div class="col-lg-2">
			    			<select class="form-control m-b pointer" name="section.sectionNo"  id="sectionNo">
			    				<option value="">所有部门 / All Section</option>
			    			</select>
			    		</div>
			    		 <div class="input-group date col-lg-2">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" placeholder="Date From" name="dateFrom">
                          </div>
                          <div class="input-group date col-lg-2">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" placeholder="Date To" name="dateTo">
                        </div>
				        <div class="col-lg-2">
			    			<button class="btn btn-primary" type="button" onclick="search()">
			    				<i class="fa fa-search"></i> search
		    				</button>
		    				<button class="btn btn-w-m btn-danger" type="button" >
			    				 New  
		    				</button>
			    		</div>
			    		 
		  			</div>
		    	</form>
	            <div class="row">
	                <div id="dataPanel" class="col-lg-12" style="display: display;">
	                	<table id="dataTable" class="table table-striped table-bordered table-hover">
	                	 <thead>
                    <tr>
                        <th>标题  <br /> TITLE </th>
                        <th>创建人 <br /> CREATER</th>
                        <th>创建日期  <br /> CREATEDATE</th>
                        <th>开始日期  <br /> STARTDATE</th>
                        <th>结束日期 <br /> ENDDATE</th>
                        <th>回复率 <br /> REPLY%</th>
                        <th>操作 <br /> OPERATE</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="gradeX">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Internet
                            Explorer 4.0
                        </td>
                        <td>Win 95+</td>
                        <td class="center">4</td>
                        <td class="center">X</td>
                        <td>16/76</td>
                        <td>
                      <a id="reply" class="btn btn-warning btn-xs " type="button" ><i class="fa fa-pencil"></i> 回复  </a>
                        </td>
                    </tr>
                    <tr class="gradeC">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Internet
                            Explorer 5.0
                        </td>
                        <td>Win 95+</td>
                        <td class="center">5</td>
                        <td class="center">C</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button" ><i class="fa fa-folder"></i> 查看  </a>
                        <a class="btn btn-warning btn-xs " type="button" style="display:none"><i class="fa fa-pencil"></i> 回复  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Internet
                            Explorer 5.5
                        </td>
                        <td>Win 95+</td>
                        <td class="center">5.5</td>
                        <td class="center">A</td>
                    <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Internet
                            Explorer 6
                        </td>
                        <td>Win 98+</td>
                        <td class="center">6</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Internet Explorer 7</td>
                        <td>Win XP SP2+</td>
                        <td class="center">7</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>AOL browser (AOL desktop)</td>
                        <td>Win XP</td>
                        <td class="center">6</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Firefox 1.0</td>
                        <td>Win 98+ / OSX.2+</td>
                        <td class="center">1.7</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Firefox 1.5</td>
                        <td>Win 98+ / OSX.2+</td>
                        <td class="center">1.8</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Firefox 2.0</td>
                        <td>Win 98+ / OSX.2+</td>
                        <td class="center">1.8</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Firefox 3.0</td>
                        <td>Win 2k+ / OSX.3+</td>
                        <td class="center">1.9</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Camino 1.0</td>
                        <td>OSX.2+</td>
                        <td class="center">1.8</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Camino 1.5</td>
                        <td>OSX.3+</td>
                        <td class="center">1.8</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Netscape 7.2</td>
                        <td>Win 95+ / Mac OS 8.6-9.2</td>
                        <td class="center">1.7</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Netscape Browser 8</td>
                        <td>Win 98SE+</td>
                        <td class="center">1.7</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Netscape Navigator 9</td>
                        <td>Win 98+ / OSX.2+</td>
                        <td class="center">1.8</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Mozilla 1.0</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td class="center">1</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Mozilla 1.1</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td class="center">1.1</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Mozilla 1.2</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td class="center">1.2</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Mozilla 1.3</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td class="center">1.3</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    <tr class="gradeA">
                        <td>185进口食品海报预估4.6-4.17	</td>
                        <td>Mozilla 1.4</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td class="center">1.4</td>
                        <td class="center">A</td>
                        <td>16/76</td>
                        <td>
                         <a class="btn btn-info btn-xs " type="button"><i class="fa fa-folder"></i> 查看  </a>
                        </td>
                    </tr>
                    </tbody>
                    <tfoot>
                    </tfoot>
                    </table>
					</div>
           		</div>
        	</div>
    	</div>
    </div>
  	
  	
  	
  	
  	
  	
  
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  </body>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
  <!-- Mainly scripts -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>
  <script>
  $("#modi").click(function(){
	  $("#dataMainContext").hide();
	  $("excel").show();
  });
  $(".btn-danger").click(function(){
	  $("#dataMainContext").hide();
	  $(".modal-body").show();
  });
  $("#cancel").click(function(){
	  $("#dataMainContext").show();
	  $(".modal-body").hide();
  });
  $("#reply").click(function(){
	  $("#dataMainContext").hide();
	  $(".reply").show();
  });

  </script>
  
</html>