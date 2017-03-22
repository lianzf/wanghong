<%@page import="java.io.OutputStreamWriter"%>
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
							<li><i class="icon-list"></i><a href="＃">榜单添加主播</a><i class="icon-angle-right"></i></li>
							<li><a href="#">列表</a></li>
						</ul>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<span class="label label-important">说明!</span>
						<span>列表排列优先级<i class="icon-sort-by-order-alt"></i>、创建时间<i class="icon-sort-by-order-alt"></i></span>
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
											<a id="add" class="btn green" ><i class="icon-plus"></i> 添加主播</a>
											<button type="button" class="btn blue" onclick="window.location.href = './rankinglist'" class="btn">返回</button>
										</div>
									</div>
									<div class="row-fluid">
										<table class="table table-striped table-bordered table-hover table-full-width dataTable" id="portlet_Tables"
											aria-describedby="sample_2_info">
											<thead>
												<tr>
													<th>序号</th>
													<th>主播图片</th>
													<th>ID</th>
													<th>昵称</th>
													<th>人气数</th>
													<th>关注数</th>
													<th>评论数</th>
													<th>状态</th>
													<th>优先级</th>
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
		var userStateDic = constructDictionaryOption1("COMMON_STATE_01");
		jQuery(document).ready(function() {
			App.init(); // initlayout and core plugins
			UIModals.init();
			TableManaged.init();
			
			FormComponents.init();
			$('.btn.green').click(function(){
				   App.Modal.load('./addActorList',{rankinglistActorId : '${rankinglistActorId}'},{'title':'添加主播'});
			});
		});initPage();
		$("#search").bind('click', function() {
			initPage();
		});
		
		function confirm(id,rankinglistActorId){
			$.ajax({
				type : 'POST',
				url : './deletRankinglist',
				dataType : "text",
				data : {
					id : id,
					rankinglistActorId : rankinglistActorId
				},
				success : function(data, status) {
					initPage();
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
				"sDom": "<'row-fluid'<f>r>t<'row-fluid'<'span6'i><'span6'p>>", // table布局
		        "aoColumnDefs": [{'bSortable': false,'aTargets': [0,1,2,3,4,5,6,7,8]}],
		        "aaSorting" : [[ 0, "desc" ]], 
				"sServerMethod" : "POST",
				"sAjaxSource" : "getRankingActorList",
				"fnServerParams" : function(aoData) {
					aoData.push({ "name" : "rankinglistActorId", "value" : "${rankinglistActorId}" });
				},
				"aoColumns" : [{
					"sClass" : "center",
					"mDataProp" : "id"
				},{
					"sClass" : "center",
					"mDataProp" : "icon",
					"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						var html = "";
						if(oData.icon != null && oData.icon != ''){
							html += '<img src="../downloadFile.jsp?identity='+oData.systemPath+'&path='+oData.icon+'" width="38" height="54" />';
						}
						return $(nTd).html(html);	
					}
				},{
					"sClass" : "center",
					"mDataProp" : "id"
				},{
					"sClass" : "center",
					"mDataProp" : "nickname",
					"mRender" : function(obj){
						if(obj != null){
							return cutString(obj,30);
						}else{
							return "";
						}
					}
				}, {
					"sClass" : "center",
					"mDataProp" : "fans",
				},{
					"sClass" : "center",
					"mDataProp" : "collectionNum",
				},{
					"sClass" : "center",
					"mDataProp" : "commentNum"
				}, {
					"sClass" : "center",
					"mDataProp" : "state",
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
					"mDataProp" : "displayOrder"
				}, {
					"sClass" : "center",
					"mDataProp" : "id",
					"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						var html = "";
						html += " <a class='btn mini red' href='javascript:;' onclick=confirm('"+oData.id+"',${rankinglistActorId})><i class='icon-trash'></i> 删除</a>";
						html += " <a class='btn mini purple' href='javascript:;' onclick=editDisplayOrder('"+oData.id+"',${rankinglistActorId})><i class='icon-edit'></i> 调整优先级</a>";
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
		function editDisplayOrder(actorId,rankinglistActorId){
			App.Modal.load('./editDisplayOrder',{actorId : actorId,rankinglistActorId : rankinglistActorId},{'title':'编辑优先级'});
		}
	</script>
</body>
<!-- END BODY -->
</html>