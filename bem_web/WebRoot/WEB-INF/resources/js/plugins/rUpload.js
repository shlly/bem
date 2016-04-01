var $uploadTable = $("#uploadTable");

var maxSize = 20 * 1024 * 1024;
var maxNumber = 100;
var fileId = 0;

var fileList = [];
var xhr = new XMLHttpRequest();
var currentFileId;
var total = 0;

xhr.addEventListener("error", function(event){}, false);
xhr.addEventListener("abort", function(event){}, false);

$uploadTable.bootstrapTable({
    showRefresh: false,
    pagination: true,
    pageSize: 10,
    pageList: [10, 30, 50, 100, "All"],
    columns: [{
        field: "id",
        title: "文件编号<br />File ID"
    }, {
    	filed: "state",
    	checkbox: true
    }, {
        field: "name",
        title: "文件名<br />File Name"
    }, {
        field: "topic",
        title: "主题<br />Topic"
    }, {
        field: "division",
        title: "处<br />Division"
    }, {
        field: "section",
        title: "部门<br />Section"
    }, {
    	fileId: "store",
    	title: "门店<br />Store",
        formatter: function(value, row, index) {
        	return row.store;
        }
    }, {
        field: "size",
        title: "大小<br />Size",
        formatter: function(value, row, index) {
        	if (!row.canUpload) {
        		return "<span style=\"color: red;\">" + value + "</span>"
        	} else {
        		return value;
        	}
        }
    }, {
    	field: "progress",
        title: "进度<br />Progress",
        formatter: function(value, row, index) {
        	return "<span class=\"progress" + row.id + "\">0%</span>";
        }
    }, {
        field: "operate",
        title: "操作<br />Operate",
        formatter: function(value, row, index) {
        	if (row.canUpload) {
        		return "<button class=\"btn btn-outline btn-default uploadBtn defaultColor uploadBtn" + row.id + "\" "
        			+ "type=\"button\" onclick=\"upload(" + row.id + ")\" "
        			+ "data-style=\"contract\" style=\"width: auto;\"><i class=\"fa fa-upload\"></i></button>\n" +
        			"<button class=\"btn btn-outline btn-default errorColor delBtn\" type=\"button\" onclick=\"delUploadFile($(this))\"><i class=\"fa fa-times\"></i></button>";
        	} else {
        		return "<button class=\"btn btn-outline btn-default errorColor delBtn\" type=\"button\" onclick=\"delUploadFile($(this))\"><i class=\"fa fa-times\"></i></button>";
        	}
        }
    }, {
        field: "discription",
        title: "描述<br />Discription"
    }],
    onAll: function() {
    }
});

function upload(rowId) {
	if ($(".storeNo").val() == null) {
		swal({
	        title: "请选择门店\nPlease select stores",
	        type: "warning"
    	});
		return;
	} else {
		if (rowId == null) {
			var isRepeat = false;
			var hash = {};
			fileList.forEach(function(file) {
				if(hash[file.name]) {
					isRepeat = true;
					return;
				}
				hash[file.name] = true;
			});
			if (isRepeat) {
				swal({
			        title: "存在重命名文件\nThere are rename files",
			        text: "是否上传？\nAre you sure ?",
			        type: "warning",
			        showCancelButton: true,
			        confirmButtonColor: "#DD6B55",
			        confirmButtonText: "Yes",
			        cancelButtonText: "No",
			        closeOnConfirm: true
			    }, function () {
			    	uploadFile(rowId);
			    });
			}
			else {
				uploadFile(rowId);
			}
		} else {
			uploadFile(rowId);
		}
	}
}

function addUploadFile() {
	var files = document.getElementById('file').files;
	
	for (var i = 0; i < files.length; i++) {
		if (fileList.length >= maxNumber) {
			swal({
				title: "数量已超过上限\nCannot upload more file",
		        text: "已忽略" + (files.length - i) + "个\nHas ignored " + (files.length - i)
		    });
			break;
		}
		
		var file = files[i];
		var data = [];
		var storeTitle = "";
		var storeName = "全部门店<br/>All Store";
		var storeNum = $("#storeNoUpload option:selected").length;
		var storeNo;
		if (storeNum < $("#storeNoUpload option").length) {
			storeNo = $("#storeNoUpload").val();
			$("#storeNoUpload option:selected").each(function(index) {
				storeTitle += $(this).html() + "&nbsp&nbsp";
				if (index % 2 == 1) {
					storeTitle += "<br/>";
				}
			});
			if (storeNum < 5) {
				storeName = "";
				$("#storeNoUpload option:selected").each(function() {
					storeName += $(this).html() + "<br/>";
				});
				storeName = storeName.substring(0, storeName.length - 2);
			} else {
				storeName = storeNum + "家门店<br/>" + storeNum + " stores"
			}
		} else {
			storeNo = [-1];
		}
		if (file.size > maxSize) {
    		data.push({
    			id: fileId++,
    			name: file.name,
        		size: getFileSizeString(file.size),
        		topic: $("#topicNoUpload option:selected").text().replace(" / ", "<br/>"),
        		division: $("#divisionNoUpload option:selected").text().replace(" / ", "<br/>"),
        		section: $("#sectionNoUpload option:selected").text().replace(" / ", "<br/>"),
        		store: storeName,
        		discription: storeTitle,
        		canUpload: false
    		});
    		$uploadTable.bootstrapTable('append', data);
			continue;
		}
		data.push({
			id: fileId++,
			name: file.name,
    		size: getFileSizeString(file.size),
    		topic: $("#topicNoUpload option:selected").text().replace(" / ", "<br/>"),
    		topicNo: $("#topicNoUpload").val(),
    		division: $("#divisionNoUpload option:selected").text().replace(" / ", "<br/>"),
    		divisionNo: $("#divisionNoUpload").val(),
    		section: $("#sectionNoUpload option:selected").text().replace(" / ", "<br/>"),
    		sectionNo: $("#sectionNoUpload").val(),
    		store: storeName,
    		storeNo: storeNo,
    		discription: storeTitle,
    		otherStoreView: document.querySelector("#otherStoreView").checked ? 1 : 0,
    		canUpload: true,
    		file: file
		});
		$uploadTable.bootstrapTable('append', data);
		fileList.push(data[0]);
		total++;
	}
	
	$("#file").val("");
	
	$("#uploadTable > tbody > tr").each(function() {
		var tooltip = $("<div>");
		tooltip.attr("data-toggle", "tooltip");
		tooltip.attr("data-placement", "left");
		tooltip.attr("title", $(this).children("td:last-child").html());
		tooltip.html($(this).children("td:nth-child(7)").html());
		$(this).children("td:nth-child(7)").empty();
		$(this).children("td:nth-child(7)").append(tooltip);
		tooltip.tooltip({
			html: true
		});
	});
}

var loadProgress;
var loadstart;
var load;
var progress;
var file;
var isUpload = false;
function uploadFile(rowId) {
	xhr.removeEventListener("loadstart", loadstart);
	xhr.removeEventListener("load", load);
	xhr.upload.removeEventListener("progress", progress);
	if (rowId == null) {
		loadstart = function(event){
    		if (isUpload) {
    			$(".addBtn").attr("disabled", "true");
    			$(".delBtn").attr("disabled", "true");
    			$(".uploadBtn").attr("disabled", "true");
    			$(".uploadBtnAll").html("Cancel");
    			$(".uploadBtnAll").removeClass("btn-primary");
    			$(".uploadBtnAll").addClass("btn-warning");
    			$(".uploadBtnAll").attr("onclick", "cancelUploadFile()");
    		}
		};
	    load = function(event){
			if (isUpload) {
				$uploadTable.bootstrapTable('remove', {field: 'id', values: [currentFileId]});
		    	if (fileList.length > 0)
		        {
		        	uploadFile();
		        }
		    	else if (fileList.length == 0) {
	    			total = 0;
	    			isUpload = false;
	    			$(".addBtn").removeAttr("disabled");
	    			$(".delBtn").removeAttr("disabled");
	    			$(".uploadBtn").removeAttr("disabled");
	    			$(".uploadBtnAll").html("Upload All");
	    			$(".uploadBtnAll").removeClass("btn-warning");
	    			$(".uploadBtnAll").addClass("btn-primary");
	    			$(".uploadBtnAll").attr("onclick", "upload()");
	    		}
			}
	    };
	    progress = function(event){
	    	if (event.lengthComputable)
	        {
	        	// var percentComplete = Math.round(evt.loaded * 100 / evt.total);
	    		loadProgress.html(Math.round(event.loaded * 100 / event.total) + "%");
//	    		uploadBtnAll.setProgress(event.loaded / event.total *
//	    				(1 / total) +
//	    				((total - fileList.length - 1) * (1 / total)));
	        }
	    }
        file = fileList.shift();
	} else {
		loadstart = function(event){
    		if (isUpload) {
    			$(".addBtn").attr("disabled", "true");
    			$(".delBtn").attr("disabled", "true");
    			$(".uploadBtnAll").attr("disabled", "true");
    			$(".uploadBtn").attr("disabled", "true");
    			$(".uploadBtn" + rowId).removeAttr("disabled");
    			$(".uploadBtn" + rowId).children("i").removeClass("fa-upload");
    			$(".uploadBtn" + rowId).children("i").addClass("fa-pause");
    			$(".uploadBtn" + rowId).removeClass("defaultColor");
    			$(".uploadBtn" + rowId).addClass("warnColor");
    			$(".uploadBtn" + rowId).blur();
    			$(".uploadBtn" + rowId).attr("onclick", "cancelUploadFile(" + rowId + ")");
    		}
		};
		load = function(event){
        	if (isUpload) {
        		total--;
    			isUpload = false;
    			$uploadTable.bootstrapTable('remove', {field: 'id', values: [currentFileId]});
    			$(".addBtn").removeAttr("disabled");
    			$(".delBtn").removeAttr("disabled");
    			$(".uploadBtnAll").removeAttr("disabled");
    			$(".uploadBtn").removeAttr("disabled");
        	}
			
	    };
		progress = function(event){
	    	if (event.lengthComputable)
	        {
	        	// var percentComplete = Math.round(evt.loaded * 100 / evt.total);
	    		loadProgress.html(Math.round(event.loaded * 100 / event.total) + "%");
//	    		uploadBtnAll.setProgress(event.loaded / event.total);
	        }
	    };
        for(var i = 0; i < fileList.length; i++) {
        	if (fileList[i].id == rowId) {
        		file = fileList.splice(i, 1)[0];
        		break;
        	}
        }
	}
	xhr.addEventListener("loadstart", loadstart);
	xhr.addEventListener("load", load);
	xhr.upload.addEventListener("progress", progress);
	
    if (file != null) {
    	isUpload = true;
        currentFileId = file.id;
        loadProgress = $(".progress" + currentFileId);
    	xhr.open("POST", basePath + "file/uploadFiles");
        var fd = new FormData();
        fd.append("uploadFile", file.file);
        fd.append("name" ,file.name);
        var fileSize = getFileSize(file.file.size);
        fd.append("fileSize" ,fileSize[0]);
        fd.append("sizeUnit" ,fileSize[1]);
        fd.append("topic.topicNo", file.topicNo);
        fd.append("division.divisionNo", file.divisionNo);
        fd.append("section.sectionNo", file.sectionNo);
        fd.append("storeNo", file.storeNo.join());
        fd.append("otherStoreView", file.otherStoreView);
        xhr.send(fd);
    }
}

function cancelUploadFile(rowId) {
	isUpload = false;
	xhr.abort();
	fileList.unshift(file);
	if (rowId != null) {
		$(".addBtn").removeAttr("disabled");
		$(".delBtn").removeAttr("disabled");
		$(".uploadBtnAll").removeAttr("disabled");
		$(".uploadBtn").removeAttr("disabled");
		$(".uploadBtn" + rowId).removeAttr("disabled");
		$(".uploadBtn" + rowId).children("i").removeClass("fa-pause");
		$(".uploadBtn" + rowId).children("i").addClass("fa-upload");
		$(".uploadBtn" + rowId).removeClass("warnColor");
		$(".uploadBtn" + rowId).addClass("defaultColor");
		$(".uploadBtn" + rowId).blur();
		$(".uploadBtn" + rowId).attr("onclick", "upload(" + rowId + ")");
	} else {
		$(".addBtn").removeAttr("disabled");
		$(".delBtn").removeAttr("disabled");
		$(".uploadBtn").removeAttr("disabled");
		$(".uploadBtnAll").html("Upload All");
		$(".uploadBtnAll").removeClass("btn-warning");
		$(".uploadBtnAll").addClass("btn-primary");
		$(".uploadBtnAll").attr("onclick", "upload()");
	}
}

function delUploadFile(btn) {
	swal({
        title: "是否确认？\nAre You Sure ?",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes",
        cancelButtonText: "No",
        closeOnConfirm: false
    }, function () {
    	var fileId = btn.parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().html();
    	$uploadTable.bootstrapTable('remove', {field: 'id', values: [parseInt(fileId)]});
    	for(var i = 0; i < fileList.length; i++) {
        	if (fileList[i].id == fileId) {
        		file = fileList.splice(i, 1)[0];
        		break;
        	}
        }
    	swal("已删除\nDeleted!", "", "success");
    });
}

function deleteUploadFiles() {
	swal({
        title: "是否确认？\nAre You Sure ?",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes",
        cancelButtonText: "No",
        closeOnConfirm: false
    }, function () {
    	var ids = $.map($uploadTable.bootstrapTable('getSelections'), function (row) {
            return row.id;
        });
    	$uploadTable.bootstrapTable('remove', {
            field: 'id',
            values: ids
        });
    	for(var i = 0; i < fileList.length; i++) {
    		for (j = 0; j < ids.length; j++) {
            	if (fileList[i].id == ids[j]) {
            		file = fileList.splice(i, 1)[0];
            	}
    		}
        }
    	swal("已删除\nDeleted!", "", "success");
    });
}

function getFileSizeString(size) {
	var unit = "B";
	if (size >= 1024)
	{
		size /= 1024;
		unit = "KB";
	}
	if (size >= 1024)
	{
		size /= 1024;
		unit = "MB";
	}
	if (size >= 1024)
	{
		size /= 1024;
		unit = "GB";
	}
	size = Math.round(size * 100) / 100;
	return size + " " + unit;
}

// 0-字节 1-KB 2-MB 3-GB 4-TB 5-PB
function getFileSize(size) {
	var unit = 0;
	if (size >= 1024)
	{
		size /= 1024;
		unit = 1;
	}
	if (size >= 1024)
	{
		size /= 1024;
		unit = 2;
	}
	if (size >= 1024)
	{
		size /= 1024;
		unit = 3;
	}
	size = Math.round(size * 100) / 100;
	return [size, unit];
}

function clearFileList() {
	fileList = [];
	$uploadTable.bootstrapTable('removeAll');
}