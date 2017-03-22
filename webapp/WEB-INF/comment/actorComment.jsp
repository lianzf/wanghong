<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="tab-pane active" id="actorComment">
	<div class="portlet box blue" id="portlet">
		<div class="portlet-title">
			<div class="caption">
				<i class="icon-th"></i>列表
			</div>
		</div>
		<div class="portlet-body">
			<div id="sample_2_wrapper" class="dataTables_wrapper form-inline"
				role="grid">
				<div class="row-fluid">
					<select id="state" class="m-wrap xsmall"></select>
					<!-- 是否可见 -->
					<select id="recommend" class="m-wrap xsmall"></select>
					<!-- 是否推荐评论 -->
					<select id="isEditorComment" class="m-wrap xsmall"></select>
					<!-- 是否编辑评论 -->
					<div class="input-prepend">
						<span class="add-on"><i class="icon-calendar"></i></span> <input
							class="m-wrap xsmall date-picker" size="16" id="startTime"
							placeholder="开始时间" type="text" value="" />
					</div>
					<div class="input-prepend">
						<span class="add-on"><i class="icon-calendar"></i></span> <input
							class="m-wrap xsmall date-picker" size="16" id="endTime"
							placeholder="结束时间" type="text" value="" />
					</div>
					<input class="m-wrap xsmall" size="10" id="content1" type="text" placeholder="正文">
					<button id="search1" class="btn red"><i class="icon-search"></i> 查询</button>
				</div>
				<div class="row-fluid">
					<table
						class="table table-striped table-bordered table-hover table-full-width dataTable"
						id="portlet_Tables" aria-describedby="sample_2_info">
						<thead>
							<tr>
								<th>ID</th>
								<th>用户ID</th>
								<th>主播ID</th>
								<th>显示</th>
								<th>推荐</th>
								<th>编辑评论</th>
								<th>分数</th>
								<th>赞同数</th>
								<th>正文</th>
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
<script>

	$("#search1").bind('click', function() {
		initActorPage();
	});

	function confirmActor(id, state, value) {
		$.ajax({
			type : 'POST',
			url : './onlineComment',
			dataType : "text",
			data : {
				id : id,
				state : state
			},
			success : function(data, status) {
				initActorPage();
			}
		})
	}

	function initActorPage() {
		var state = document.getElementById("state").value;
		var recommend = document.getElementById("recommend").value;
		var isEditorComment = document.getElementById("isEditorComment").value;
		var startTime = document.getElementById("startTime").value;
		var endTime = document.getElementById("endTime").value;
		var content1 = document.getElementById("content1").value;
		var oTable = $('#portlet_Tables').dataTable({
			"bLengthChange" : false, //改变每页显示数据数量 可选的每页展示的数据数量，默认为10条
			"iDisplayLength" : 20, // 默认煤业显示条数
			"bDestroy" : true,
			"bServerSide" : true, // 使用服务器端处理
			"searching" : false, // 是否增加搜索功能
			"sDom" : "<'row-fluid'<f>r>t<'row-fluid'<'span6'i><'span6'p>>", // table布局
			"aoColumnDefs" : [ {
				'bSortable' : false,
				'aTargets' : [ 1, 3, 4, 5, 2, 7 ]
			} ],
			"aaSorting" : [ [ 0, "desc" ] ],
			"fnServerParams" : function(aoData) {
				aoData.push({"name" : "state","value" : state});
				aoData.push({"name" : "recommend","value" : recommend});
				aoData.push({"name" : "isEditorComment","value" : isEditorComment});
				aoData.push({"name" : "type","value" : 1});
				aoData.push({"name" : "startTime","value" : startTime});
				aoData.push({"name" : "endTime","value" : endTime});
				aoData.push({"name" : "content","value" : content1});
			},
			"sServerMethod" : "POST",
			"sAjaxSource" : "getList",
			"aoColumns" : [{
				"sClass" : "center",
				"mDataProp" : "id"
			},{
				"sClass" : "left",
				"mDataProp" : "userId"
			},{
				"sClass" : "left",
				"mDataProp" : "actorVideoId"
			},{
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
			},{
				"sClass" : "left",
				"mDataProp" : "recommend",
				"mRender" : function(obj){
					for(var i=0;i<userStateDic.length;i++){
						if(userStateDic[i].id == (obj+"")){
							return userStateDic[i].name;
						}
					}
					return "";
				}
			},{
				"sClass" : "left",
				"mDataProp" : "isEditorComment",
				"mRender" : function(obj){
					for(var i=0;i<userStateDic.length;i++){
						if(userStateDic[i].id == (obj+"")){
							return userStateDic[i].name;
						}
					}
					return "";
				}
			},{
				"sClass" : "left",
				"mDataProp" : "starLevel"
			},{
				"sClass" : "left",
				"mDataProp" : "agreeNumber"
			},{
				"sClass" : "left",
				"mDataProp" : "content",
				"mRender" : function(obj) {
					if (obj != null) {
						return cutString(obj, 50);
					} else {
						return "";
					}
				}
			},{
				"sClass" : "left",
				"mDataProp" : "createTime",
				"mRender" : function(obj) {
					if (obj != null) {
						return new Date(obj).toLocaleString();
					} else {
						return '';
					}
				}
			},{
				"sClass" : "center",
				"mDataProp" : "id",
				"fnCreatedCell" : function(nTd, sData,oData, iRow, iCol) {
					var html = "";
					html += '<a class="btn mini purple" onclick="editActor('+ oData.id + ')"><i class="icon-edit"></i>编辑</a>';
					if (oData.state == 0 || oData.state == null) {
						html += " <a class='btn mini red' href='javascript:;' onclick=confirmActor('"+ oData.id+ "',"+ oData.state+ ",'您确认要显示该评论吗？')><i class='icon-ok'></i> 显示</a>";
					} else {
						html += " <a class='btn mini green' href='javascript:;' onclick=confirmActor('"+ oData.id+ "',"+ oData.state+ ",'您确认要隐藏该评论吗？')><i class='icon-remove'></i> 隐藏</a>";
					}
					return $(nTd).html(html);
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
			}, //多语言配置
		});
	}

	function editActor(id) {
		App.Modal.load("./add", {'id' : id, 'table' : 'portlet'}, {"title" : "修改评论"});
	}
</script>
</body>
<!-- END BODY -->
</html>