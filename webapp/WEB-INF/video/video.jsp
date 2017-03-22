<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
.row {
	margin-left: 0px;
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
							<li><i class="icon-list"></i><a href="＃">视频</a><i class="icon-angle-right"></i></li>
							<li><a href="#">列表</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet box blue">
							<div class="portlet-title">
								<div class="caption">
									<i class="icon-globe"></i>列表
								</div>
							</div>
							<div class="portlet-body">
								<div id="sample_2_wrapper" class="dataTables_wrapper form-inline" role="grid">
									<div class="row-fluid">
										<div class="control-group">
											<select id="websiteid" class="m-wrap xsmall"></select> 
											<select id="state" class="m-wrap xsmall"></select>
											<div class="input-prepend">
												<span class="add-on"><i class="icon-calendar"></i></span>
											<input class="m-wrap xsmall date-picker"  size="16" id="startTime" placeholder="开始时间" type="text" value="" />
											</div>
											<div class="input-prepend">
												<span class="add-on"><i class="icon-calendar"></i></span>
											<input class="m-wrap xsmall date-picker"  size="16" id="endTime" placeholder="结束时间" type="text" value="" />
											</div>
											<input class="m-wrap xsmall" size="10" id="videoId" type="text" placeholder="视频ID">
											<input class="m-wrap xsmall" size="10" id="name" type="text" placeholder="视频名">
											<button id="search" class="btn red"><i class="icon-search"></i> 查询</button>
											<a id="add" class="btn green" ><i class="icon-plus"></i> 添加</a>
										</div>
									</div>
									<div class="row-fluid">
										<table class="table table-striped table-bordered table-hover table-full-width dataTable" id="portlet_Tables"
											aria-describedby="sample_2_info">
											<thead>
												<tr>
													<th>#ID</th>
													<th>封面</th>
													<th>视频名称</th>
													<th>来源</th>
													<th>所属主播</th>
													<th>状态</th>
													<th>视频进度</th>
													<th>文件大小</th>
													<th>时长</th>
													<th>创建时间</th>
													<th>操作</th>
												</tr>
											</thead>
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
	<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<script>
		jQuery(document).ready(function() {
			App.init(); // initlayout and core plugins
			UIModals.init();
			TableManaged.init();
			initPage();
			FormComponents.init();
			$('.btn.green').click(function(){
				   App.Modal.load('./add',{},{'title':'添加视频'});
			});
			document.getElementById("websiteid").innerHTML = getWebsite("");
			constructDictionaryOption("COMMON_STATE_01","","state","是否上线");
		});
		$("#search").bind('click', function() {
			initPage();
		});
		
		function confirm(id,state,value){
			$.ajax({
				type : 'POST',
				url : './onlineVideo',
				dataType : "text",
				data : {
					id : id,
					state : state
				},
				success : function(data, status) {
					initPage();
				}
			})
		}
		function initPage() {
			var videoId = document.getElementById("videoId").value;
			var videoName = document.getElementById("name").value;
			var websiteid = document.getElementById("websiteid").value;
			var state = document.getElementById("state").value;
			var startTime = document.getElementById("startTime").value;
			var endTime = document.getElementById("endTime").value;
			var oTable = $('#portlet_Tables').dataTable({
				"bLengthChange" : false, //改变每页显示数据数量 可选的每页展示的数据数量，默认为10条
				"iDisplayLength" : 20, // 默认煤业显示条数
				"bDestroy" : true,
				"bServerSide" : true, // 使用服务器端处理
				"searching" : false, // 是否增加搜索功能
				"sDom": "<'row-fluid'<f>r>t<'row-fluid'<'span6'i><'span6'p>>", // table布局
		        "aoColumnDefs": [{'bSortable': false,'aTargets': [1,3,4,5,6,7,8]}],
		        "aaSorting" : [[ 0, "desc" ]], 
				"fnServerParams" : function(aoData) {
					aoData.push({"name" : "videoId","value" : videoId});
					aoData.push({"name" : "videoName","value" : videoName});
					aoData.push({"name" : "websiteid","value" : websiteid});
					aoData.push({"name" : "state","value" : state});
					aoData.push({"name" : "startTime","value" : startTime});
					aoData.push({"name" : "endTime","value" : endTime});
				},
				"sServerMethod" : "POST",
				"sAjaxSource" : "getList",
				"aoColumns" : [ {
					"sClass" : "center",
					"mDataProp" : "id"
				}, {
					"sClass" : "center",
					"mDataProp" : "id",
					"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						var html = "";
						if(oData.printscreenPath != null && oData.printscreenPath != ''){
							html += '<img src="../downloadFile.jsp?identity='+oData.saveUrl+'&path='+oData.printscreenPath+'" width="38" height="54"/>';
						}
						return $(nTd).html(html);	
					}
				}, {
					"sClass" : "left",
					"mDataProp" : "name",
					"mRender" : function(obj){
						if(obj != null){
							return cutString(obj,20);
						}else{
							return "";
						}
					}
				}, {
					"sClass" : "left",
					"mDataProp" : "websiteName"
				}, {
					"sClass" : "left",
					"mDataProp" : "actorName"
				}, {
					"sClass" : "left",
					"mDataProp" : "state",
					"mRender" : function(obj){
						if(obj == 0){
							return "下线";
						}else if(obj == 1){
							return "上线";
						}else{
							return '';
						}
					}
				}, {
					"sClass" : "left",
					"mDataProp" : "result"
				}, {
					"sClass" : "left",
					"mDataProp" : "size",
					"mRender" : function(obj){
						if(obj != null){
							return (obj/1024).toFixed(2) + "M";
						}else{
							return "";
						}
					}
				},{
					"sClass" : "left",
					"mDataProp" : "playTime",
					"mRender" : function(obj){
						if(obj != null){
							return formatSeconds(obj);
						}else{
							return "";
						}
					}
				}, {
					"sClass" : "left",
					"mDataProp" : "createTime",
					"mRender" : function(obj){
						if(obj != null){
						 	return new Date(obj).toLocaleString();
						}else{
							return '';
						}
					}
				}, {
					"sClass" : "center",
					"mDataProp" : "id",
					"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						var html = "";
						html += '<a class="btn mini purple" onclick="edit('+oData.id+')"><i class="icon-edit"></i>编辑</a>';
						if(oData.state == 0 || oData.state == null){
							html += " <a class='btn mini red' href='javascript:;' onclick=confirm('"+oData.id+"',"+oData.state+",'您确认要上线该视频吗？')><i class='icon-ok'></i> 上线</a>";
						}else{
							html += " <a class='btn mini green' href='javascript:;' onclick=confirm('"+oData.id+"',"+oData.state+",'您确认要下线该视频吗？')><i class='icon-remove'></i> 下线</a>";
						}
						if(oData.result == '下载成功'){
							html += "<button class='btn mini' href='javascript:;' onclick=preview('"+oData.id+"','来源:"+oData.websiteName+"')><i class='icon-play'></i></button>";
						}
						return $(nTd).html(html);	
					}
				}  ],
				"oLanguage" : { // 转移英文显示文字
					"sProcessing" : "处理中...", // 进度条显示信息 
					"sZeroRecords" : "没有匹配的记录", // 无记录的情况下显示的表格信息
					"sInfo" : "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项", // bInfo为true时，此处页脚显示信息
					"sInfoEmpty" : "显示第 0 至 0 项记录，共 0 项", // 当没有数据时显示的页脚信息
					"sInfoFiltered" : "(由 _MAX_ 项记录过滤)",
					"sInfoPostFix" : "",
					"oPaginate" : {
						"sFirst" : "首页",
						"sPrevious" : "上页",
						"sNext" : "下页",
						"sLast" : "尾页"
					}
				}, //多语言配置
			});
		}
		function edit(id){
			App.Modal.load("./add",{'id' : id},{"title":"修改视频"});
		}
		function preview(id,name){
			App.Modal.load("./preview",{"id" : id},{"title":name});
		}
		
	</script>
</body>
<!-- END BODY -->
</html>