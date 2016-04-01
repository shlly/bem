var local = window.location;  
var contextPath = local.pathname.split("/")[1];  
var basePath = local.protocol+"//"+local.host+"/"+contextPath+"/";

var auth = ($("#auth").length == 0) ? false : true;

$(document).ready(function(){
	$(window).scroll(function() {
		if ($(window).scrollTop() != 0) {
			$("#rollTop").fadeIn();
		} else {
			$("#rollTop").fadeOut();
		}
	});
	
	if ($(".divisionNo") != null && $(".divisionNo").length > 0) {
		$.ajax({
	        cache: false,
	        type: "GET",
	        async: false,
	        url: basePath + "base/getDivisions",
			dataType : "json",
			success: function(divisions) {
				divisions.forEach(function(division) {
					$(".divisionNo").append("<option value=\"" + division.divisionNo + "\">" + division.divisionNo + " - " + division.name + " / " + division.enName + "</option>");
				});
			}
		});
	}
	
	if ($(".storeNo") != null && $(".storeNo").length > 0) {
		$.ajax({
	        cache: false,
	        type: "GET",
	        async: false,
	        url: basePath +　"base/getStores",
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
							$(".storeNo").append(coptgroup);
							if (childArea.stores.length > 0) {
								childArea.stores.forEach(function(store) {
									coptgroup.append("<option value=\"" + store.storeNo + "\">" + store.name + "</option>");
								});
							}
						});
					}
				});
	        	$(".storeNo").multiselect({
	                includeSelectAllOption: true,
	                selectAllText: '全部 / All',
	                enableCollapsibleOptGroups: true,
	                maxHeight: 400
	            });
				$(".storeNo").each(function(storeNo) {
					$(this).next().find(".multiselect-group").find("input").addClass("group");
				});
				$(".multiselect-all").find("input").trigger("click");
			}
		});
	}
});

function rollTop() {
	$(document.body).animate({'scrollTop':0}, 500);
}

function toLogin() {
	swal({
        text: "请重新登录\nPlease login again"
    }, function () {
    	window.location.href = "login";
    });
}

function switchDivision(type) {
	$("#sectionNo" + type).empty();
	$("#sectionNo" + type).append("<option value=\"\">所有部门 / All Section</option>");
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

function number2Unit(n) {
	switch(n) {
	case 0: return "B";
	case 1: return "KB";
	case 2: return "MB";
	case 3: return "GB";
	case 4: return "TB";
	case 5: return "PB";
	default: return "";
	}
}

//对Date的扩展，将 Date 转化为指定格式的String
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
//例子：
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
//author: meizz
function format(date, fmt) {
	var o = {
			"M+" : date.getMonth()+1,					//月份
			"d+" : date.getDate(),						//日
			"h+" : date.getHours(),						//小时
			"m+" : date.getMinutes(),					//分
			"s+" : date.getSeconds(),					//秒
			"q+" : Math.floor((date.getMonth()+3)/3),	//季度
			"S"  : date.getMilliseconds()				//毫秒
	  };
	if(/(y+)/.test(fmt))
		fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));
	for(var k in o)
		if(new RegExp("("+ k +")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
	return fmt;
}

function getByteLength(str) { 
    var len = 0; 
    for (var i = 0; i < str.length; i++) { 
        if (str[i].match(/[^x00-xff]/ig) != null) //全角 
            len += 2; 
        else
            len += 1; 
    }; 
    return len; 
}

function subStringByByte(str, length) {
	var newStr = "";
	var p = 0;
    for (var i = 0; i < str.length && p < length; i++) { 
    	newStr += str[i];
        if (str[i].match(/[^x00-xff]/ig) != null) { //全角
            p += 2; 
        } else {
            p += 1;
        }
    }; 
    return newStr;
}