<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<%@ include file="/common/meta.jsp"%>
<%@include file="/common/footer.jsp"%>
<!-- BEGIN HEAD -->
<head>
<style type="text/css">

.col-md-12{
	position: relative;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
}

#jstree1, #jstree2, .demo {
    max-width: 100%;
    overflow: auto;
    font: 10px Verdana, sans-serif;
    box-shadow: 0 0 5px #ccc;
    padding: 10px;
    border-radius: 5px;
}

.jstree-default>.jstree-striped {
    background-size: auto 48px;
}
.jstree-default>.jstree-striped {
    min-width: 100%;
    display: inline-block;
    background: left top repeat;
}

.jstree-wholerow-ul {
    position: relative;
    display: inline-block;
    min-width: 100%;
}
.jstree-node, .jstree-children, .jstree-container-ul {
    display: block;
    margin: 0;
    padding: 0;
    list-style-type: none;
    list-style-image: none;
}

.jstree-default>.jstree-container-ul>.jstree-node {
    margin-left: 0;
    margin-right: 0;
}
.jstree-default>.jstree-no-dots .jstree-node, .jstree-default>.jstree-no-dots .jstree-leaf>.jstree-ocl {
    background: 0 0;
}

.jstree-default .jstree-node {
    background-position: -292px -4px;
    background-repeat: repeat-y;
}
.jstree-default .jstree-node {
    min-height: 24px;
    line-height: 24px;
    margin-left: 24px;
    min-width: 24px;
}
.jstree-default .jstree-node, .jstree-default .jstree-icon {
    background-repeat: no-repeat;
    background-color: transparent;
}
.jstree-node {
    white-space: nowrap;
}
.jstree-node, .jstree-children, .jstree-container-ul {
    display: block;
    margin: 0;
    padding: 0;
    list-style-type: none;
    list-style-image: none;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-footer-fixed">
	<!-- BEGIN HEADER -->
	<%@ include file="/common/nav.jsp"%>
	<!-- END HEADER -->
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<%@ include file="/common/menu.jsp"%>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<ul class="breadcrumb">
							<li><i class="icon-list"></i><a href="＃">频道</a><i class="icon-angle-right"></i></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="col-md-4 col-sm-8 col-xs-8">
							<button type="button" class="btn btn-success btn-sm" onclick="createRoot();"><i class="glyphicon glyphicon-asterisk"></i> 添加主目录</button>
							<button type="button" class="btn btn-success btn-sm" onclick="create();"><i class="glyphicon glyphicon-asterisk"></i> 添加</button>
							<button type="button" class="btn btn-danger btn-sm" onclick="deleteColumn();"><i class="glyphicon glyphicon-remove"></i> 删除</button>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="span4">
							<div class="col-md-12">
								<div  class="row">
									<div class="col-md-12">
										<div id="jstree_demo" class="demo jstree jstree-1 jstree-default">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="span8">
							<form id="form_icon" class="form-horizontal" enctype="multipart/form-data">
								<div class="control-group">
									<label class="control-label" for="firstName">icon</label>
									<div class="controls">
										<input id="file-Portrait1" type="file">
									</div>
								</div>
							</form>
							<form action="#" id="form_sample_1" class="form-horizontal" method="post">
								<input type="hidden" id="initID" name="id"/> 
								<input type="hidden" id="icon" name="icon">
								<div class="control-group">
									<label class="control-label">父频道</label>
									<div class="controls">
										<select id="parentId" name="parentId" class="m-wrap span8">
											<c:forEach items="${columnList}" var="column">
												<option value="${column.id}">${column.displayName}</option>
											</c:forEach>
										</select>
									</div>
									<span class="help-block"></span>
								</div>
								<div class="control-group">
									<label class="control-label">频道名称<span class="required">*</span></label>
									<div class="controls">
										<input name="displayName" type="text" class="span8 m-wrap">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">标识</label>
									<div class="controls">
										<input name="identifying" type="text" class="span8 m-wrap">
										<span class="help-block">用于频道的唯一性标识</span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">访问地址</label>
									<div class="controls">
										<input name="visitUrl" type="text" class="span8 m-wrap">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">关联内容<span class="required">*</span></label>
									<div class="controls">
										<select id="contentType" name="contentType" class="m-wrap span8">
											<c:forEach items="${selectGroupList }" var="selectGroup">
												<option value="${selectGroup.id }">${selectGroup.name }</option>
											</c:forEach>
										</select>
										<span class="help-block">用于表示该频道是主播还是视频</span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">内容规则</label>
									<div class="controls">
										<input name="contentRegulation" type="text" class="span8 m-wrap">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">排序<span class="required">*</span></label>
									<div class="controls">
										<input name="displayOrder" type="text" class="span8 m-wrap">
										<span class="help-block">频道的排序、正序</span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">描述</label>
									<div class="controls">
										<textarea id="description" name="description" class="span8 m-wrap"></textarea>
									</div>
								</div>
								<div class="form-actions">
									<button type="button" class="btn green" id="submit_btn" >保存</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	jQuery(document).ready(function() {
		App.init(); // initlayout and core plugins
		$("#parentId").select2();
	});
	var menuId = "";
	var menuText = "";
	$('#jstree_demo').data('jstree', false).empty();
	$('#jstree_demo').jstree({
		"core" : {
			"animation" : 0,
			"check_callback" : true,
			"themes" : {"stripes" : true},
			'data' : {'url' : "./getList",'dataType' : "json"}
		},
		"types" : {
			"default" : { "icon" : false }, // 关闭默认图标
			"#" : {
				"max_children" : 1,
				"max_depth" : 4,
				"valid_children" : [ "root" ]
			},
			"root" : {
				"icon" : "/static/3.3.3/assets/images/tree_icon.png",
				"valid_children" : [ "default" ]
			},
			"file" : {
				"icon" : "glyphicon glyphicon-file",
				"valid_children" : []
			}
		},
		"plugins" : ["checkbox","types","themes","state"],
		"checkbox":{  // 去除checkbox插件的默认效果
		    tie_selection : false,
		    keep_selected_style : false,
		    whole_node : false
		}
	}).bind('select_node.jstree', function(event, data) { //绑定的点击事件
		menuId = "";
		menuId = data.node.id;
		menuText = data.node.text;
		getColumnById(menuId); // 获取我自己定义的属性menuid，可以根据自己实际情况定义
	});
	$('#jstree_demo').jstree().hide_icons();
	function getColumnById(id){
		$.ajax({
			type : 'POST',
			url : './getColumnById',
			dataType : "json",
			data : {
				id : id
			},
			success : function(data, status) {
				$("#initID").val(data.id);
				$("#parentId").val(data.parentId);
				$("#parentId").change();
				$("#imagepre").attr("src","../downloadFile.jsp?identity=<%=request.getAttribute("uploadColumn")%>&path="+ data.icon);
				document.getElementsByName("displayName")[0].value = data.displayName;
				document.getElementsByName("icon")[0].value = data.icon;
				document.getElementsByName("identifying")[0].value = data.identifying;
				document.getElementsByName("visitUrl")[0].value = data.visitUrl;
				document.getElementsByName("contentType")[0].value = data.contentType;
				document.getElementsByName("contentRegulation")[0].value = data.contentRegulation;
				document.getElementsByName("displayOrder")[0].value = data.displayOrder;
			}
		})
	}
	
	$("#file-Portrait1").fileinput({
		language : 'zh',
		uploadUrl : "../UploadFile?type=column", // server upload action
		uploadAsync : false,
		maxFileCount : 1,
		showCaption: false,
		allowedFileTypes : [ 'image' ],
		initialPreview: [
		   "<img id='imagepre' src='../media/image/20161115155443.jpeg' class='file-preview-image' />"
		],
	});
	$('#file-Portrait1').on('filebatchuploadsuccess',function(event, data, previewId, index) {
		var form = data.form, files = data.files, extra = data.extra, response = data.response, reader = data.reader;
		$("#icon").val(response.filePath);
	});
	$("#submit_btn").click(function(){
		var id = $("#initID").val();
		var url = "";
		if(id != "" && id != null){
			url = "./editColumn";
		}else{
			url = "./addColumn";
		}
		if($('#form_sample_1').valid()){
			$.ajax({
				type : 'POST',
				url : url,
				dataType : "json",
				data : $('#form_sample_1').serializeArray(),
				success : function(data, status) {
					bootbox.alert(data.msg, function() {
						window.location = "./column"
					});
				}
			})
		}
	});
	App.validate('form_sample_1',{
		rules : {
			"displayName" : {
				required : true
			},
			"displayOrder" :{
				number : true
			}
		}
	});
	function create(){
		bootbox.confirm("您确认是在"+menuText+"下添加子栏目？", function (result) {
			if(result){
				$("#form_sample_1")[0].reset();
				$("#imagepre").attr("src","../media/image/20161115155443.jpeg");
				$("#initID").val("");
				$("#icon").val("");
				$("#parentId").val(menuId);
				$("#parentId").change();
			}
		}); 
	}
	function createRoot(){
		$("#form_sample_1")[0].reset();
		$("#parentId").val("");
		$("#parentId").change();
		$("#imagepre").attr("src","../media/image/20161115155443.jpeg");
		$("#initID").val("");
		$("#icon").val("");
		menuId = "";
	}
	function deleteColumn(){
		if(menuId == '' || menuId == null){
			bootbox.alert("请选择频道", function() {
				return;
			});
		}
		$.ajax({
			type : 'POST',
			url : "./delete",
			dataType : "json",
			data : {id : menuId},
			success : function(data, status) {
				bootbox.alert(data.msg, function() {
					window.location = "./column"
				});
			}
		})
	}
	</script>
</body>
<!-- END BODY -->
</html>