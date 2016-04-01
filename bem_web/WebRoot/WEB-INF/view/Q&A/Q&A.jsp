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
  	<link href="<%=basePath%>css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
  	<link href="<%=basePath%>css/plugins/datapicker/datepicker3.css" rel="stylesheet">
  </head>
  
  <body>
	
  	<%@ include file="/WEB-INF/view/layout/bodyStart.jsp"%>
  	<!-- 提问 -->
  	<div class="modal-body" id="question" style="display:none;padding-top: 40px;">
	<div class="row">
       <form method="post" id="form" class="form-horizontal" action="q&a/upload" enctype="multipart/form-data">
       <div class="form-group"><label class="col-sm-2 control-label">主题 TOPIC</label>
          <div class="col-sm-10"><select class="form-control" name="org_no" id="topicNoUpload" disabled="disabled"></select></div>
       </div>
       <div class="form-group"><label class="col-sm-2 control-label">标题 TITLE</label>
          <div class="col-sm-10"><input type="text" name="title" placeholder="title" class="form-control" required="required"></div>
       </div>
       <div class="form-group"><label class="col-sm-2 control-label">部门 DIVISION</label>
          <div class="col-sm-10"><select class="form-control m-b divisionNo" name="divisionNo" id="divisionNoAsk"   onchange="switchDivisions('Ask')">
			<option value="">请选择。。。</option>
		 </select></div>
       </div>
	   <div class="form-group"><label class="col-sm-2 control-label">处 SECTION</label>
          <div class="col-sm-10"><select class="form-control m-b" name="sectionNo"   id="sectionNoAsk">
 			<option value="" disabled="disabled">请选择。。。</option>
 		 </select></div>
      </div>
      <div class="form-group" >
	      <label class="col-sm-2 control-label">描述 DESCRIPTION</label>
		     <div class="col-sm-10">	
		  <textarea class="form-control" placeholder="Textarea" name="content" rows="3"  required="required" ></textarea>
			</div>
      </div>
      <div>
      <input type="file" name="file" multiple="multiple">
       
      </div>
      <br/>
           <div class="form-group ">
               <div class="col-sm-4 col-sm-offset-2">
                   <button id="cancel" class="btn btn-white" type="button">取消</button>
                   <button id="commit" class="btn btn-primary" type="submit">提交</button>
               </div>
           </div>
        </form>
      </div>
     </div>
  	
  	<!-- neg提问 -->
  	<div class="modal-body" id="negquestion" style="display:none">
		<div class="row">
          <form method="post" id=negform class="form-horizontal" action="q&a/upload" enctype="multipart/form-data">
            <div class="form-group"><label class="col-sm-2 control-label">标题 TITLE</label>
              <div class="col-sm-10"><input type="text" class="form-control" name="title" required="required"></div>
             </div>
       <div class="form-group"><label class="col-sm-2 control-label">部门 DIVISION</label>
          <div class="col-sm-10"><select class="form-control m-b divisionNo" name="divisionNo" id="divisionNoNeg"   onchange="switchDivisions('Neg')">
			<option value="">请选择</option>
		 </select></div>
       </div>
	   <div class="form-group"><label class="col-sm-2 control-label">处 SECTION</label>
          <div class="col-sm-10"><select class="form-control m-b" name="sectionNo"   id="sectionNoNeg">
 			<option value="" disabled="disabled">请选择</option>
 		 </select></div>
      </div>
            <div class="form-group"><label class="col-sm-2 control-label">商品编号 ITEM NO</label>
                 <div class="col-sm-10"><input type="text" class="form-control" name="itemNo"></div>
             </div>
             <div class="form-group"><label class="col-sm-2 control-label">商品名称 ITEM NAME</label>
                <div class="col-sm-10"><input type="text" class="form-control" name="itemName"></div>
             </div>
             <div class="form-group"><label class="col-sm-2 control-label">供应商编号 SUP NO</label>
                <div class="col-sm-10"><input type="text" class="form-control" name="supNo"></div>
             </div>
             <div class="form-group"><label class="col-sm-2 control-label">供应商名称 SUP NAME</label>
                <div class="col-sm-10"><input type="text" class="form-control" name="supName"></div>
             </div>
             <div class="form-group"><label class="col-sm-2 control-label">本店售价 PRICE</label>
                <div class="col-sm-10"><input type="text" class="form-control" name="price"></div>
             </div>
             <div class="form-group"><label class="col-sm-2 control-label">欧尚店STORE(1)</label>
             <div class="col-sm-10">
             <select class="storeNo1 form-control m-b" name="storeNo1" >
              </select>
              </div>
              </div>
              <div class="form-group"><label class="col-sm-2 control-label">欧尚店STORE(1)售价PRICE</label>
                  <div class="col-sm-10"><input type="text" class="form-control" name="price1"></div>
               </div>
                     <div class="form-group"><label class="col-sm-2 control-label">欧尚店STORE(2)</label>
                         <div class="col-sm-10">
                         <select class="storeNo form-control m-b" name="storeNo2" >
                         </select>
                         </div>
                      </div>
                      <div class="form-group" ><label class="col-sm-2 control-label">欧尚店STORE(2)售价PRICE</label>
                          <div class="col-sm-10"><input type="text" class="form-control" name="price2"></div>
                      </div>
                      <div class="form-group"><label class="col-sm-2 control-label">竞争对手名称COMPETITOR</label>
                          <div class="col-sm-10"><input type="text" class="form-control" name="competitor"></div>
                      </div>
	               		 <div class="form-group"><label class="col-sm-2 control-label">三周前对手售价 3W PRICE</label>
	                   			 <div class="col-sm-10"><input type="text" class="form-control" name="w3price"></div>
	               		 </div>
	               		<div class="form-group"><label class="col-sm-2 control-label">两周前对手售价 2W PRICE</label>
	                   			 <div class="col-sm-10"><input type="text" class="form-control" name="w2price"></div>
	               		</div> 
	               		<div class="form-group"><label class="col-sm-2 control-label">一周前对手售价 1W PRICE</label>
	                   			 <div class="col-sm-10"><input type="text" class="form-control" name="w1price"></div>
	               		 </div>
	               		<div class="form-group"><label class="col-sm-2 control-label">本周对手售价 0W PRICE</label>
	                   			 <div class="col-sm-10"><input type="text" class="form-control" name="w0price"></div>
	               		</div>
	               		<div class="form-group"><label class="col-sm-2 control-label">紧急程度 URGENT</label>
	               		<div class="col-sm-10"><select class="form-control m-b" name="urgent" >
	                        <option>一般</option>
	                        <option>紧急</option>
	                    					</select>
	                    </div>
	                    </div>
                             <div class="form-group" >
						<label class="col-sm-2 control-label">描述 DESCRIPTION</label>
		<div class="col-sm-10">	
		<textarea class="form-control" placeholder="Textarea" rows="3" name="content"></textarea>
					</div>
					</div>
					 <div>
      <input type="file" name="file" multiple="multiple">
       
      </div>
      <br/>
           <div class="form-group ">
               <div class="col-sm-4 col-sm-offset-2">
                   <button id="canceln" class="btn btn-white" type="button">取消</button>
                   <button id="commitn" class="btn btn-primary" type="submit">提交</button>
               </div>
            </div>          
				</form>
                 </div>
             </div>
   
   
    <!-- main -->                               
  	<div class="wrapper wrapper-content" id="questionMainContext">
	    <div class="row">
	        <div class="col-lg-3">
	            <div class="ibox float-e-margins">
	                <div class="ibox-content">
	                    <div class="file-manager">
	                        <button  id="uploadBtn" class="btn btn-primary btn-block"  disabled="disabled">去提问</button>
	                        <div class="hr-line-dashed"></div>
	                        <h5>主题/Topic</h5>
	                        <div class="dd" id="nestable">
                            </div>
	                        <div class="clearfix"></div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-lg-9 animated fadeInRight">
	  			<form id="searchForm">
	        		<div class="row form-group fileSearch">
			    		<div class="col-lg-3">
			    			<input type="text" placeholder="Question Name" class="form-control" name="title">
			    		</div>
			    		<div class="col-lg-3">
			    			<select class="form-control m-b pointer" name="org_no" id="topicNo">
			    				<option value="">所有主题 / All Topic</option>
			    			</select>
			    		</div>
			    		<div class="col-lg-3">
			    			<select class="form-control m-b divisionNo pointer" name="division.divisionNo" id="divisionNo" onchange="switchDivision('')">
			    				<option value="">所有处 / All Division</option>
			    			</select>
			    		</div>
			    		<div class="col-lg-3">
			    			<select class="form-control m-b pointer" name="section.sectionNo"  id="sectionNo">
			    				<option value="">所有部门 / All Section</option>
			    			</select>
			    		</div>
		  			</div>
		  			<div class="row form-group fileSearch">
				        <div class="input-group date col-lg-3">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" placeholder="Date From" name="dateFrom">
                        </div>
				        <div class="input-group date col-lg-3">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" class="form-control" placeholder="Date To" name="dateTo">
                        </div>
				        <div class="col-lg-3">
			    			<button class="btn btn-primary" type="button" onclick="search()">
			    				<i class="fa fa-search"></i> search
		    				</button>
			    		</div>
		  			</div>
		    	</form>
	            <div class="row">
	                <div id="filePanel" class="col-lg-12" style="display: none;">
	                	<table id="questionTable" class="table table-striped table-bordered table-hover">
	                	</table>
					</div>
           		</div>
           		<div id="noDate" class="row" style="display: none;">
           			<i class="fa fa-smile-o"></i> 没有问题/no question
           		</div>
               <!-- 	<div class="row" id="load" style="display: none;">
	               	<div class="ibox-content" style="background-color: inherit; border: none;">
	                    <div class="sk-spinner sk-spinner-wave">
	                        <div class="sk-rect1"></div>
	                        <div class="sk-rect2"></div>
	                        <div class="sk-rect3"></div>
	                        <div class="sk-rect4"></div>
	                        <div class="sk-rect5"></div>
	                    </div>
	                </div>
               	</div> -->
        	</div>
    	</div>
    </div>
  	
  	<%@ include file="/WEB-INF/view/layout/bodyEnd.jsp"%>
  	<%@ include file="/WEB-INF/view/layout/bodyResource.jsp"%>
  	
  	<!-- bootstrap-table -->
  	<script src="<%=basePath%>js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
  	<script src="<%=basePath%>js/plugins/bootstrap-table/locale/bootstrap-table-en-US.min.js"></script>
  	<!-- Toastr script -->
    <script src="<%=basePath%>js/plugins/toastr/toastr.min.js"></script>
    <!-- DROPZONE -->
    <script src="<%=basePath%>js/plugins/dropzone/dropzone.js"></script>
    <!-- Nestable List -->
    <script src="<%=basePath%>js/plugins/nestable/jquery.nestable.js"></script>
    <!-- Data picker -->
   <script src="<%=basePath%>js/plugins/datapicker/bootstrap-datepicker.js"></script>
  	
  	<script>
  	var $table = $("#questionTable");
    $(document).ready(function(){
    	$('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true,
            format: "yyyy-mm-dd"
        });
        	
        	// nestable
        	$("#load").css("display", "block");
            $.ajax({
                cache: false,                                     //不会从浏览器缓存中加载请求信息
                type: "GET",                                 
                url: "topic/getTopics",							  //默认为当前页地址									
                data: {topicNo: null, isChild: true},             //发送到服务器的数据
        		dataType : "json",
        		success: function(topics) {						  //请求成功后调用的回调函数
        			if(topics == "Error, Please login again" || topics == null)
        				toLogin();
        			else{
        				addTopics(topics, $("#nestable"), "");
        	            $("#nestable").nestable();
        	            $(".dd").nestable('collapseAll');
        	            $(".dd-item[data-id='" + ${topic.parentTopicNo} + "'] > .dd-content").trigger("click");
        				$("#load").css("display", "none");
        	            $table.bootstrapTable({
        	                sidePagination: "server",
        	                pageSize: 30,
        	                pageList: [30, 50, 100, "All"],
        	                showRefresh: false,
        	                pagination: true,
        	                sortName: "cdate",
        	                sortOrder: "desc",
        	                columns: [/* {
        	                    field: "q_no",
        	                    title: "编号<br />NO",
        	                    sortable: true
        	                },  */
        	                {
        	                    field: "org_no",
        	                    title: "主题<br />TOPIC",
        	                    sortable: true
        	                },
        	                {
        	                    field: "title",
        	                    title: "标题<br />Title",
        	                    sortable: true
        	                },	{
        	                	field: "division.name",
        	                    title: "处<br />Division",
        	                    sortable: true,
        	                },
        	                	{field: "section.name",
        	                    title: "部门<br />Section",
        	                    sortable: true
        	                },
        	                {
        	                	field: "cdate",
        	                    title: "创建日期<br />Create Date",
        	                    sortable: true,
        	                    formatter: function(value, row, index) {
        	                    	return format(new Date(value.time), "yyyy-MM-dd hh:mm");}
        	                   
        	                },
        	                {
        	                	field: "qreply.createDate",
         	                    title: "最后回复日期<br />Last Reply Date",
        	                    sortable: true,
        	                    formatter: function(value, row, index) {
        	                    	if(value!=null){
        	                    	return format(new Date(value.time), "yyyy-MM-dd hh:mm");}}
        	                }],
        	                onLoadSuccess: function() {
        	                	$("#load").css("display", "none");
        	        			if ($table.bootstrapTable('getData').length == 0) {
        	        				$("#noDate").css("display", "block");
        	        				$("#filePanel").css("display", "none");
        	        			} else {
        	        				$("#noDate").css("display", "none");
        	        				$("#filePanel").css("display", "block");
        	        			}
        	        			
        	                },
        	                onLoadError: function() {
        	                	toLogin();
        	                },
        	                onClickRow:function (row) {
        	                    window.location.href = "<%=basePath%>q&a/detail?q_no="+row.q_no;
        	                  },
        	                onSort: function() {
        	        			$("#load").css("display", "block");
        	                }
        	            });
       				}
        			$(".dd-item[data-id='" + ${topic.topicNo} + "'] > .dd-content").trigger("click");
        		}
        	});
            
         // init Dropzone
            Dropzone.options.myAwesomeDropzone = {
            		autoProcessQueue:true,
            		uploadMultiple: true,   //指明是否允许 Dropzone 一次提交多个文件。默认为false。如果设为true，则相当于 HTML 表单添加multiple属性。
            		parallelUploads: 20,
            		maxFiles: 20,
            		addRemoveLinks: true,
            		// Dropzone settings
            		  init: function() {
                    this.element.querySelector("button[type=submit]").addEventListener("click", function(e) {
                        e.preventDefault();
                        e.stopPropagation();
                        myDropzone.processQueue();
                    });
                    this.on("sendingmultiple", function() {
                    });
                    this.on("successmultiple", function(files, response) {
                    });
                    this.on("errormultiple", function(files, response) {
                    });
                    }
            };
            if ($(".storeNo1") != null && $(".storeNo1").length > 0) {
        		$.ajax({
        	        cache: false,
        	        type: "GET",
        	        async: false,
        	        url: basePath +"base/getStores",
        			dataType : "json",
        			success: function(areas) {
        				areas.forEach(function(area) {
        					/* var optgroup = $("<optgroup>");
        					optgroup.attr("label", area.areaName);
        					$(".storeNo").append(optgroup); */
        					if (area.childArea.length > 0) {
        						area.childArea.forEach(function(childArea) {
        							var coptgroup = $("<optgroup>");
        							coptgroup.attr("label", area.areaName + " - " + childArea.areaName);
        							$(".storeNo1").append(coptgroup);
        							if (childArea.stores.length > 0) {
        								childArea.stores.forEach(function(store) {
        									coptgroup.append("<option value=\"" + store.storeNo + "\">" + store.name + "</option>");
        								});
        							}
        						});
        					}
        				});
        	        	$(".storeNo1").multiselect({
        	                includeSelectAllOption: true,
        	                selectAllText: '全部 / All',
        	                enableCollapsibleOptGroups: true,
        	                maxHeight: 400
        	            });
        				$(".storeNo1").each(function(storeNo) {
        					$(this).next().find(".multiselect-group").find("input").addClass("group");
        				});
        				$(".multiselect-all").find("input").trigger("click");
        			}
        		});
        	}
        });
        
        function addTopics(topics, div, parent) {
        	var ol = $("<ol class='dd-list'>");
        	div.append(ol);
        	topics.forEach(function(topic) {
        		var tNameCn = topic.name;
        		var tNameEn = topic.enName;
        		if (tNameEn.length > 20) {
        			tNameEn = tNameEn.substring(0, 18) + "...";
        		}
            	var li = $("<li class='dd-item' data-id='" + topic.topicNo + "'>");
            	ol.append(li);
            	li.append("<div class='dd-handle'>Drag</div>");
            	if (topic.childTopic.length > 0) {
            		$("#topicNo").append("<option disabled value=\"\"></option>");
            		$("#topicNoUpload").append("<option disabled value=\"\"></option>");
                	$("#topicNo").append("<option disabled value=\"" + topic.topicNo + "\">" + tNameCn + " / " + tNameEn + "</option>");
                	$("#topicNoUpload").append("<option disabled value=\"" + topic.topicNo + "\">" + tNameCn + " / " + tNameEn + "</option>");
            		li.append("<div class='dd-content'onclick=\"expandTree($(this))\">" + topic.name + "<br/>" + topic.enName + "</div>");
            		addTopics(topic.childTopic, li, name);
            	} else {
                	$("#topicNo").append("<option value=\"" + topic.topicNo + "\">-- " + tNameCn + " / " + tNameEn + "</option>");
                	$("#topicNoUpload").append("<option value=\"" + topic.topicNo + "\">-- " + tNameCn + " / " + tNameEn + "</option>");
                	li.append("<div class='dd-content' onclick='switchTopic(" + topic.topicNo + ", 1)'>" + topic.name + "<br/>" + topic.enName + "</div>");
            	}
        	});
        	
        }
        
        function expandTree(dd) {
        	$("#uploadBtn").attr("disabled", true);
        	$(".dd-content.active").removeClass("active");
        	var b1 = dd.prev().prev().prev();
        	var b2 = dd.prev().prev();
        	if (b1.css("display") == "block") {
        		b1.trigger("click");
        	} else {
        		b2.trigger("click");
        	}
        }
        
        function switchTopic(topicNo, level) {
        	$("#uploadBtn").attr("disabled", false);
        	$("#filePanel").css("display", "block");
			$("#load").css("display", "block");
        	$(".dd-content.active").removeClass("active");
			$table.bootstrapTable("removeAll");
        	$(".dd-item[data-id='" + topicNo + "'] > .dd-content").addClass("active");
				$("#topicNoUpload").val(topicNo);
		       	$("#uploadBtn").click(function(){
		    		$("#questionMainContext").hide();
		    		if(topicNo==24)
		    		{
		    			$("#negquestion").show();
		    			$("#question").hide();
		    		}else{
		    			$("#question").show();
		    			$("#negquestion").hide();
		    		}
		    		
		    	})
				$table.bootstrapTable("refresh", {url: "q&a/getTopicQuestions?topicNo=" + topicNo});
        	}
        
        function search() {
        	$("#filePanel").css("display", "block");
        	$("#uploadBtn").css("display", "none");
        	$(".dd").nestable('collapseAll');
    		$(".dd-content.active").removeClass("active");
    		$("#load").css("display", "block");
    		$table.bootstrapTable("removeAll");
    		$table.bootstrapTable("refresh", {url: "q&a/search?" + $("#searchForm").serialize()});
        };
        function switchDivisions(type) {
        	$("#sectionNo" + type).empty();
        	$.ajax({
                cache: false,
                type: "GET",
                url: basePath + "base/getSections",
                data: {divisionNo: $("#divisionNo" + type).val()},
        		dataType : "json",
        		success: function(sections) {
        			sections.forEach(function(section) {
        				$("#sectionNo" + type).append("<option value=\"" + section.sectionNo + "\">" + section.sectionNo + " - " + section.name + " / " + section.enName + "</option>");
        			});
        		}
        	});
        }
        $("#commit").click(function(){
        $("#topicNoUpload").each(function(){
      		if(parseInt($(this).val())!=-1){
      			$(this).attr("disabled",false);
      		}
      	});
        
        });
        $("#cancel").click(function(){
        	$("#questionMainContext").show();
        	$("#question").hide();
        });
        $("#canceln").click(function(){
        	$("#questionMainContext").show();
        	$("#negquestion").hide();
        });
	</script>
  </body>
</html>