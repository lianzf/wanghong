<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<div class="modal-body">
	<div class="row-fluid">
		<table class="table table-striped table-bordered table-hover table-full-width dataTable" id="portlet2_Tables" aria-describedby="sample_2_info">
			<thead>
				<tr>
					<th>序号</th>
					<th>图片</th>
					<th>ID</th>
					<th>昵称</th>
					<th>评论</th>
					<th>人气</th>
					<th>关注</th>
					<th>状态</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<div class="modal-footer">
	<button type="button" data-dismiss="modal" class="btn">关闭</button>
</div>
<script>
var userStateDic = constructDictionaryOption1("COMMON_STATE_01");
initActor("${id}");
function initActor(id){
	var oTable = $('#portlet2_Tables').dataTable({
		"bLengthChange" : false, //改变每页显示数据数量 可选的每页展示的数据数量，默认为10条
		"iDisplayLength" : 50, // 默认煤业显示条数
		"bDestroy" : true,
		"bServerSide" : true, // 使用服务器端处理
		"searching" : false, // 是否增加搜索功能
		"sDom": "<'row-fluid'<f>r>t<'row-fluid'<'span6'i><'span6'p>>", // table布局
        "aoColumnDefs": [{'bSortable': false,'aTargets': [0,1,2,3,4,5,6,7]}],
        "aaSorting" : [[ 0, "desc" ]], 
		"fnServerParams" : function(aoData) {
			aoData.push({"name" : "id","value" : id});
		},
		"sServerMethod" : "POST",
		"sAjaxSource" : "./getActorByRegulation",
		"aoColumns" : [ {
			"sClass" : "center",
			"mDataProp" : "id"
		},{
			"sClass" : "center",
			"mDataProp" : "icon",
			"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
				var html = "";
				if(oData.icon != null && oData.icon != ''){
					html += '<img src="../downloadFile.jsp?identity='+oData.systemPath+'&path='+oData.icon+'" width="38" height="54"/>';
				}
				return $(nTd).html(html);	
			}
		},{
			"sClass" : "center",
			"mDataProp" : "id"
		}, {
			"sClass" : "left",
			"mDataProp" : "nickname",
			"mRender" : function(obj){
				if(obj != null){
					return cutString(obj,20);
				}else{
					return "";
				}
			}
		}, {
			"sClass" : "left",
			"mDataProp" : "commentNum"
		}, {
			"sClass" : "left",
			"mDataProp" : "fans"
		}, {
			"sClass" : "left",
			"mDataProp" : "attentionNum"
		}, {
			"sClass" : "left",
			"mDataProp" : "state",
			"mRender" : function(obj){
				for(var i=0;i<userStateDic.length;i++){
					if(userStateDic[i].id == (obj+"")){
						return userStateDic[i].name;
					}
				}
				return "";
			}
		} ],
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
</script>