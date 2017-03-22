<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="modal-body">
	<div class="row-fluid">
		<div class="control-group">
			<input class="m-wrap small" size="10" id="actorName" type="text" placeholder="主播">
			<button id="search" onclick="initPageColumnActor(${columnId})" class="btn red">查询</button>
		</div>
	</div>
	<div class="row-fluid">
		<table class="table table-striped table-bordered table-hover table-full-width dataTable" id="portlet2_Tables" aria-describedby="sample_2_info">
			<thead>
				<tr>
					<th>#ID</th>
					<th>主播</th>
					<th>关注数</th>
					<th>来源</th>
					<th>操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<div class="modal-footer">
	<button type="button" data-dismiss="modal" class="btn">关闭</button>
</div>
<script>
initPageColumnActor("${columnId}");
function initPageColumnActor(columnId){
	var actorName = $("#actorName").val();
	var oTable = $('#portlet2_Tables').dataTable({
		"bLengthChange" : false, //改变每页显示数据数量 可选的每页展示的数据数量，默认为10条
		"iDisplayLength" : 50, // 默认煤业显示条数
		"bDestroy" : true,
		"bServerSide" : true, // 使用服务器端处理
		"searching" : false, // 是否增加搜索功能
		"sDom": "<'row-fluid'<f>r>t<'row-fluid'<'span6'i><'span6'p>>", // table布局
        "aoColumnDefs": [{'bSortable': false,'aTargets': [0,1,3,4]}],
        "aaSorting" : [[ 0, "desc" ]], 
		"fnServerParams" : function(aoData) {
			aoData.push({"name" : "column","value" : "${columnId}"});
			aoData.push({"name" : "actorName","value" : actorName});
		},
		"sServerMethod" : "POST",
		"sAjaxSource" : "./getColumnList",
		"aoColumns" : [ {
			"sClass" : "center",
			"mDataProp" : "id"
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
			"mDataProp" : "fans"
		}, {
			"sClass" : "left",
			"mDataProp" : "websiteName"
		}, {
			"sClass" : "center",
			"mDataProp" : "id",
			"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
				var state = oData.state;
				var html = "";
				if(state == null){
					var click = 'chooseActor('+oData.id+','+columnId+',"您确认要在此频道选择该主播吗？",this);';
					html += "<a class='btn mini red' href='javascript:;' onclick='"+click+"'>选择</a>";
				}else{
					html += "<a class='btn mini green' href='#'>已选</a>";
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

function chooseActor(id,columnId,desc,obj){
	$.ajax({
		type : 'POST',
		url : './chooseActor',
		dataType : "text",
		data : {
			id : id,
			columnId : columnId
		},
		success : function(data, status) {
			if(data == '操作成功'){
				$("#dialog").modal('hide');
				initDoWorker();
			}
		}
	});
}
</script>