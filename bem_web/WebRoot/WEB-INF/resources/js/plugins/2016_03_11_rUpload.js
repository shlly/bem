var $uploadTable = $("#uploadTable");
var uploadBtnAll;

var maxSize = 40 * 1024 * 1024;
var maxNumber = 100;
var fileId = 0;

var fileList = [];
var xhr = new XMLHttpRequest();
var currentFileId;
var total = 0;

xhr.addEventListener("error", function(event){}, false);
xhr.addEventListener("abort", function(event){}, false);

$(".ladda-button").ladda("bind");
uploadBtnAll = Ladda.create(document.querySelector(".uploadBtnAll"));
$uploadTable.bootstrapTable({
    showRefresh: false,
    pagination: true,
    pageSize: 30,
    pageList: [30, 50, 100, "All"],
    columns: [{
        field: "id",
        title: "文件编号<br />File ID"
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
        field: "size",
        title: "文件大小<br />File Size",
        formatter: function(value, row, index) {
        	if (!row.canUpload) {
        		return "<span style=\"color: red;\">" + value + "</span>"
        	} else {
        		return value;
        	}
        }
    }, {
        field: "operate",
        title: "操作<br />Operate",
        formatter: function(value, row, index) {
        	if (row.canUpload) {
        		return "<button class=\"ladda-button btn btn-outline btn-primary uploadBtn uploadBtn" + row.id + "\" "
        			+ "type=\"button\" onclick=\"uploadFile(" + row.id + ")\" "
        			+ "data-style=\"contract\" style=\"width: auto;\"><i class=\"fa fa-upload\"></i></button>\n" +
        			"<button class=\"btn btn-outline btn-danger delBtn\" type=\"button\" onclick=\"\"><i class=\"fa fa-times\"></i></button>";
        	} else {
        		return "<button class=\"btn btn-outline btn-danger delBtn\" type=\"button\" onclick=\"\"><i class=\"fa fa-times\"></i></button>";
        	}
        }
    }, {
        field: "discription",
        title: "描述<br />Discription"
    }],
    onAll: function() {
    	$(".ladda-button").ladda("bind");
    }
});


function addFile() {
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
		if (file.size > maxSize) {
    		data.push({
    			id: fileId++,
    			name: file.name,
        		size: getFileSizeString(file.size),
        		topic: $("#topicNoUpload option:selected").text().replace(" / ", "<br/>"),
        		division: $("#divisionNoUpload option:selected").text().replace(" / ", "<br/>"),
        		section: $("#sectionNoUpload option:selected").text().replace(" / ", "<br/>"),
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
    		canUpload: true,
    		file: file
		});
		$uploadTable.bootstrapTable('append', data);
		fileList.push(data[0]);
		total++;
	}
	
	$("#file").val("");
}

var loadBtn;
var loadstart;
var load;
var progress;
function uploadFile(rowId, isStart) {
	xhr.removeEventListener("loadstart", loadstart);
	xhr.removeEventListener("load", load);
	xhr.upload.removeEventListener("progress", progress);
	var file;
	if (rowId == null) {
		loadstart = function(event){
    		$(".addBtn").attr("disabled", "true");
			$(".delBtn").attr("disabled", "true");
			$(".uploadBtn").attr("disabled", "true");
        	if (isStart == null)
        		uploadBtnAll.start();
		};
	    load = function(event){
			loadBtn.stop();
			$uploadTable.bootstrapTable('remove', {field: 'id', values: [currentFileId]});
	    	if (fileList.length > 0)
	        {
	        	uploadFile(null, true);
	        }
	    	else if (fileList.length == 0) {
    			uploadBtnAll.stop();
    			total = 0;
    			$(".addBtn").removeAttr("disabled");
    			$(".delBtn").removeAttr("disabled");
    			$(".uploadBtn").removeAttr("disabled");
    		}
	    };
	    progress = function(event){
	    	if (event.lengthComputable)
	        {
	        	// var percentComplete = Math.round(evt.loaded * 100 / evt.total);
	    		loadBtn.setProgress(event.loaded / event.total);
	    		uploadBtnAll.setProgress(event.loaded / event.total *
	    				(1 / total) +
	    				((total - fileList.length - 1) * (1 / total)));
	        }
	    }
        file = fileList.shift();
	} else {
		loadstart = function(event){
    		$(".addBtn").attr("disabled", "true");
			$(".delBtn").attr("disabled", "true");
			$(".uploadBtn").attr("disabled", "true");
    		uploadBtnAll.start();
		};
		load = function(event){
			loadBtn.stop();
			uploadBtnAll.stop();
        	total--;
			$uploadTable.bootstrapTable('remove', {field: 'id', values: [currentFileId]});
			$(".addBtn").removeAttr("disabled");
			$(".delBtn").removeAttr("disabled");
			$(".uploadBtn").removeAttr("disabled");
			
	    };
		progress = function(event){
	    	if (event.lengthComputable)
	        {
	        	// var percentComplete = Math.round(evt.loaded * 100 / evt.total);
	    		loadBtn.setProgress(event.loaded / event.total);
	    		uploadBtnAll.setProgress(event.loaded / event.total);
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
        currentFileId = file.id;
        loadBtn = Ladda.create(document.querySelector(".uploadBtn" + currentFileId));
        loadBtn.start();
    	xhr.open("POST", "file/uploadFiles");
        var fd = new FormData();
        fd.append("fileName" ,file.name);
        fd.append("fileContentType" ,file.file.type);
        fd.append("fileSize" ,file.file.size);
        fd.append("file", file.file);
        xhr.send(fd);
    }
}

function getFileSizeString (size) {
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