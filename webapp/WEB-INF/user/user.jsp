<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<%@ include file="/common/meta.jsp"%>
<%@include file="/common/footer.jsp"%>
<head>
<style type="text/css">
.row {
	margin-left: 0px;
}
</style>
</head>
<body class="page-header-fixed page-footer-fixed">
	<%@ include file="/common/nav.jsp"%>
	<div class="page-container">
		<%@ include file="/common/menu.jsp"%>
		<div class="page-content">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><i class="icon-list"></i><a href="＃">用户管理</a><i class="icon-angle-right"></i></li>
							<li><a href="#">列表</a></li>
						</ul>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="portlet box blue">
							<div class="portlet-title">
								<div class="caption">
									<i class="icon-th"></i>列表
								</div>
							</div>
							<div class="portlet-body">
								<div id="sample_2_wrapper" class="dataTables_wrapper form-inline" role="grid">
									<div class="row-fluid">
										<div class="control-group">
											<select id=userStatus class="m-wrap xsmall" placeholder="状态"></select>
											<div class="input-prepend">
												<span class="add-on"><i class="icon-calendar"></i></span>
											<input class="m-wrap xsmall date-picker"  size="16" id="startTime" placeholder="创建时间：开始" type="text" value="" />
											</div>
											<div class="input-prepend">
												<span class="add-on"><i class="icon-calendar"></i></span>
											<input class="m-wrap xsmall date-picker"  size="16" id="endTime" placeholder="创建时间：结束" type="text" value="" />
											</div>
											<input class="m-wrap xsmall" size="10" id="userId" type="text" placeholder="用户ID">
											<input class="m-wrap xsmall" size="10" id="userName" type="text" placeholder="昵称">
											<input class="m-wrap xsmall" size="10" id="userPhone" type="text" placeholder="手机号">
											<button id="search" class="btn red"><i class="icon-search"></i> 查询</button>
										</div>
									</div>
									<div class="row-fluid">
										<table class="table table-striped table-bordered table-hover table-full-width dataTable" id="dataTables1"
											aria-describedby="sample_2_info">
											<thead>
												<tr>
													<th>ID</th>
													<th>昵称</th>
													<th>手机号</th>
													<th>状态</th>
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
	<script>
		var userStateDic = constructDictionaryOption1("COMMON_STATE_02");
		
		jQuery(document).ready(function() {
			App.init(); // initlayout and core plugins
			UIModals.init();
			TableManaged.init();
			initPage();
			FormComponents.init();
			constructDictionaryOption("COMMON_STATE_02","","userStatus","是否停用");
		});

		$("#search").bind('click', function() {
			initPage();
		});
		
		function initPage() {
			//看搜索条件是否有值
			var userName = document.getElementById("userName").value;
			var userPhone = document.getElementById("userPhone").value;
			var userStatus = document.getElementById("userStatus").value;
			var userId = document.getElementById("userId").value;
			var startTime = document.getElementById("startTime").value;
			var endTime = document.getElementById("endTime").value;
			//表格构建
			var oTable = $('#dataTables1').dataTable({
				"bLengthChange" : false, //改变每页显示数据数量 可选的每页展示的数据数量，默认为10条
				"iDisplayLength" : 20, // 默认煤业显示条数
				"bDestroy" : true,
				"bServerSide" : true, // 使用服务器端处理
				"searching" : false, // 是否增加搜索功能
				"sDom": "<'row-fluid'<f>r>t<'row-fluid'<'span6'i><'span6'p>>", // table布局
		        "aoColumnDefs": [{'bSortable': false,'aTargets': [1,2,3,4,5]}],
		        "aaSorting" : [[ 0, "desc" ]], 
				"fnServerParams" : function(aoData) {//搜索条件
					aoData.push({ "name" : "userName", "value" : userName });
					aoData.push({ "name" : "userPhone", "value" : userPhone });
					aoData.push({ "name" : "userStatus", "value" : userStatus });
					aoData.push({ "name" : "userId", "value" : userId });
					aoData.push({ "name" : "startTime", "value" : startTime });
					aoData.push({ "name" : "endTime", "value" : endTime });
				},
				"sServerMethod" : "POST",
				"sAjaxSource" : "getList",
				"aoColumns" : [{
					"sClass" : "center",
					"mDataProp" : "id"
				},{
					"sClass" : "center",
					"mDataProp" : "userName"
				}, {
					"sClass" : "center",
					"mDataProp" : "userPhone"
				}, {
					"sClass" : "center",
					"mDataProp" : "userStatus",
					"mRender" : function(obj){
						for(var i=0;i<userStateDic.length;i++){
							if(userStateDic[i].id == (obj+"")){
								return userStateDic[i].name;
							}
						}
						return "";
					}
 				}, {
					"sClass" : "center",
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
						// html += '<a class="btn mini purple" onclick="edit('+oData.id+')"><i class="icon-edit"></i>编辑</a>';
						if(oData.userStatus == 0 || oData.userStatus == null){
							html += "<a class='btn mini red' href='javascript:;' onclick=confirm('"+oData.id+"','"+oData.userStatus+"','您确认要启用该主播吗?')><i class='icon-ok'></i> 启用</a>";
						}else{
							html += "<a class='btn mini green' href='javascript:;' onclick=confirm('"+oData.id+"','"+oData.userStatus+"','您确认要下线该停用吗?')><i class='icon-remove'></i> 停用</a>";					
						}
						return $(nTd).html(html);	
					}
				} ],
				"sPaginationType": "bootstrap",
				"oLanguage": {
		           	"sProcessing" : "处理中...",
		           	"sZeroRecords" : "没有匹配的记录", // 无记录的情况下显示的表格信息
		           	"sInfoEmpty" : "显示第 0 至 0 项记录，共 0 项", // 当没有数据时显示的页脚信息
		           	"sInfo" : "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
		           	"oPaginate": {
		           		"sFirst" : "首页",
		              	"sPrevious": "上一页",
		              	"sNext": "下一页",
		              	"sLast" : "尾页"
		           	}
				}
			});
		}
		
		function edit(id){
			App.Modal.load("./add",{'id' : id},{"title":"编辑用户"});
		}

		function confirm(id,userStatus,value){
			$.ajax({
				type : 'POST',
				url : './onlineOrOffline',
				dataType : "text",
				data : {
					id : id,
					userStatus : userStatus
				},
				success : function(data) {
					bootbox.alert(data, function() {
						initPage();
					});
				}
			})
		}		
		
	</script>
</body>
<!-- END BODY -->
</html>