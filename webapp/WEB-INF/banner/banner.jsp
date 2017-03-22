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
							<li><i class="icon-list"></i><a href="＃">Banner</a><i class="icon-angle-right"></i></li>
							<li><a href="#">列表</a></li>
						</ul>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<span class="label label-important">说明!</span>
						<span>发布状态下的banner只能有4个;列表排列顺序状态、优先级、创建时间</span>
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
											<a id="add" class="btn green" ><i class="icon-plus"></i> 添加</a>
										</div>
									</div>
									<div class="row-fluid">
										<table class="table table-striped table-bordered table-hover table-full-width dataTable" id="portlet_Tables"
											aria-describedby="sample_2_info">
											<thead>
												<tr>
													<th>序号</th>
													<th>名称</th>
													<th>图片</th>
													<th>优先级<i class="icon-sort-by-order-alt"></i></th>
													<th>发布状态<i class="icon-sort-by-order-alt"></i></th>
													<th>创建日期<i class="icon-sort-by-order-alt"></i></th>
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
		jQuery(document).ready(function() {
			App.init(); // initlayout and core plugins
			UIModals.init();
			TableManaged.init();
			initPage();
			FormComponents.init();
			$('.btn.green').click(function(){
				   App.Modal.load('./add',{},{'title':'添加Banner'});
			});
		});
		$("#search").bind('click', function() {
			initPage();
		});
		
		function confirm(id,state,value){
			$.ajax({
				type : 'POST',
				url : './onlineBanner',
				dataType : "text",
				data : {
					id : id,
					state : state
				},
				success : function(data, status) {
					if(data != '操作成功'){
						bootbox.alert(data);
					}else{
						initPage();
					}
				}
			})
		}
		
		function initPage() {
			var oTable = $('#portlet_Tables').dataTable({
				"bLengthChange" : false, //改变每页显示数据数量 可选的每页展示的数据数量，默认为10条
				"iDisplayLength" : 20, // 默认煤业显示条数
				"bDestroy" : true,
				"bServerSide" : true, // 使用服务器端处理
				"searching" : false, // 是否增加搜索功能
				"bPaginate": true,
				"sDom": "<'row-fluid'<f>r>t<'row-fluid'<'span6'i><'span6'p>>", // table布局
		        "aoColumnDefs": [{'bSortable': false,'aTargets': [0,1,2,4,5,6]}],
		        "aaSorting" : [[ 3, "desc" ]], 
				"sServerMethod" : "POST",
				"sAjaxSource" : "getList",
				"aoColumns" : [{
					"sClass" : "center",
					"mDataProp" : "id"
				},{
					"sClass" : "center",
					"mDataProp" : "displayName",
					"mRender" : function(obj){
						if(obj != null){
							return cutString(obj,20);
						}else{
							return "";
						}
					}
				}, {
					"sClass" : "center",
					"mDataProp" : "icon",
					"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						var html = "";
						if(oData.icon != null && oData.icon != ''){
							html += '<img src="../downloadFile.jsp?identity='+oData.configPath+'&path='+oData.icon+'" width="38" height="54" />';
						}
						return $(nTd).html(html);	
					}
				}, {
					"sClass" : "center",
					"mDataProp" : "displayOrder",
					"mRender" : function(obj){
						if(obj != null){
							return obj;
						}else{
							return 0;
						}
					}
				},{
					"sClass" : "center",
					"mDataProp" : "state",
					"mRender" : function(obj){
						if(obj == 0 || obj == null){
							return '停用';
						}else{
							return '已发布';
						}
					}
				},{
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
						html += '<a class="btn mini purple" onclick="edit('+oData.id+')"><i class="icon-edit"></i>编辑</a>';
						if(oData.state == 0 || oData.state == null){
							html += " <a class='btn mini red' href='javascript:;' onclick=confirm('"+oData.id+"',"+oData.state+",'您确认要发布该banner吗?')><i class='icon-ok'></i> 发布</a>";
						}else{
							html += " <a class='btn mini green' href='javascript:;' onclick=confirm('"+oData.id+"',"+oData.state+",'您确认要停用该banner吗?')><i class='icon-remove'></i> 停用</a>";
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
				},
				"fnDrawCallback": function(){
					var api = this.api();
					var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
					api.column(0).nodes().each(function(cell, i) {
						cell.innerHTML = startIndex + i + 1;
					});
				}
			});
		}
		
		function edit(id){
			App.Modal.load("./add",{'id' : id},{"title":"修改Banner"});
		}
	</script>
</body>
</html>