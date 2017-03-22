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
							<li><i class="icon-list"></i><a href="＃">标签</a><i class="icon-angle-right"></i></li>
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
									<i class="icon-th"></i>列表
								</div>
							</div>
							<div class="portlet-body">
								<div id="sample_2_wrapper" class="dataTables_wrapper form-inline" role="grid">
									<div class="row-fluid">
										<div class="control-group">
											<select id=tagType class="m-wrap xsmall" placeholder="状态"></select>
											<input class="m-wrap xsmall" size="10" id="tagName" type="text" placeholder="标签名">
											<button id="search" class="btn red"><i class="icon-search"></i> 查询</button>
											<a id="add" class="btn green" ><i class="icon-plus"></i> 添加</a>
										</div>
									</div>
									<div class="row-fluid">
										<table class="table table-striped table-bordered table-hover table-full-width dataTable" id="portlet_Tables"
											aria-describedby="sample_2_info">
											<thead>
												<tr>
													<th>ID</th>
													<th>标签</th>
													<th>类型</th>
													<th>关联主播数</th>
													<th>创建时间</th>
													<th>操作</th>
												</tr>
											</thead>
										</table>
									</div>
									<%-- <%@include file="./tagAdd.jsp" %> --%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var tagTypeDic = constructDictionaryOption1("TAG_TYPE");
		jQuery(document).ready(function() {
			App.init(); // initlayout and core plugins
			UIModals.init();
			TableAdvanced.init();
			initPage();
			FormComponents.init();
			$('.btn.green').click(function(){
				   App.Modal.load('./add',{},{'title':'添加标签'});
			});
			constructDictionaryOption("TAG_TYPE","","tagType","标签类型");
		});
		$("#search").bind('click', function() {
			initPage();
		});
		function initPage() {
			var tagName = document.getElementById("tagName").value;
			var tagType = document.getElementById("tagType").value;
			var oTable = $('#portlet_Tables').dataTable({
				"bLengthChange" : false, //改变每页显示数据数量 可选的每页展示的数据数量，默认为10条
				"iDisplayLength" : 50, // 默认煤业显示条数
				"bDestroy" : true,
				"bServerSide" : true, // 使用服务器端处理
				"searching" : false, // 是否增加搜索功能
				"sDom": "<'row-fluid'<f>r>t<'row-fluid'<'span6'i><'span6'p>>", // table布局
		        "aoColumnDefs": [{'bSortable': false,'aTargets': [2,3,4]}],
		        "aaSorting" : [[ 0, "desc" ]], 
				"fnServerParams" : function(aoData) {
					aoData.push({ "name" : "tagName", "value" : tagName });
					aoData.push({ "name" : "tagType", "value" : tagType });
				},
				"sServerMethod" : "POST",
				"sAjaxSource" : "getList",
				"aoColumns" : [{
					"sClass" : "center",
					"mDataProp" : "id"
				},{
					"sClass" : "center",
					"mDataProp" : "tagName"
				},{
					"sClass" : "center",
					"mDataProp" : "property",
					"mRender" : function(obj){
						for(var i=0;i<tagTypeDic.length;i++){
							if(tagTypeDic[i].id == (obj+"")){
								return tagTypeDic[i].name;
							}
						}
						return "";
					}
				},{
					"sClass" : "center",
					"mDataProp" : "actorNum",
					"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						var html = "<a href='javascript:;' onclick='actorView("+oData.id+")'><span class='badge badge-warning'>"+oData.actorNum+"</span></a>";
						return $(nTd).html(html);	
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
						html += '<a class="btn mini purple" onclick="edit('+oData.id+')"><i class="icon-edit"></i>编辑</a>';
						if(oData.state == 0 || oData.state == null){
							html += " <a class='btn mini red' href='javascript:;' onclick=confirm("+oData.id+","+oData.state+",'您确认要上线该标签吗?')><i class='icon-ok'></i> 上线</a>";
						}else{
							html += " <a class='btn mini green' href='javascript:;' onclick=confirm("+oData.id+","+oData.state+",'您确认要下线该标签吗?')><i class='icon-remove'></i> 下线</a>";
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
		
		function confirm(id,state,value){
			bootbox.confirm(value, function (result) {
				if(result){
					$.ajax({
						type : 'POST',
						url : './onlineTag',
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
			}); 
		}

		function edit(id){
			App.Modal.load("./add",{'id' : id},{"title":"修改标签"});
		}
		
		function actorView(id){
			App.Modal.load("./viewActor",{'id' : id},{"title":"标签相关主播"});
		}
	</script>
</body>
<!-- END BODY -->
</html>