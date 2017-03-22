一、搜索框式下拉框
	1、html
	<label class="control-label">键</label>
	<div class="controls">
		<select id="actor" class="span6 chosen" data-placeholder="Choose a Category" tabindex="1"></select>
	</div>
	2、js
	$("#actor").empty();
	$.ajax({
		type : 'POST',
		url : "../actor/getActor",
		dataType : "json",
		async : false,
		success : function(respData) {
			var option = '';
			$.each(respData,function(tindex, telement) {
				option += "<option value='" + telement.id + "'>" + telement.name + "</option>";
			});
			$("#actor").append(option);
			$('#actor').select2();
		}
	});
	3、action
	List<Actor> actorList = actorService.getActorAll();
	if(actorList!= null && actorList.size()>0){
		Gson g = new GsonBuilder().serializeNulls().create();
		this.writerToClient(g.toJson(actorList));
	}else{
		this.writerToClient("暂无主播");
	}
	
二、弹出窗口
	1、按钮添加方式
	<a class="btn blue" data-toggle="modal" href="#responsive">添加</a>
	2、table下增加div
	<div id="responsive" class="modal hide fade" tabindex="-1" data-width="760">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3>添加</h3>
		</div>
		<div class="modal-body">
			<div class="row-fluid">
				<div class="span6">
				</div>
				<div class="span6">
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" data-dismiss="modal" class="btn">关闭</button>
			<button type="button" class="btn blue">保存</button>
		</div>
	</div>
	
三、datatable使用demo
	var oTable = $('#dataTables').dataTable({
		"bLengthChange" : false, //改变每页显示数据数量 可选的每页展示的数据数量，默认为10条
		"iDisplayLength" : 10, // 默认煤业显示条数
		"bServerSide" : true, // 使用服务器端处理
		"searching" : false, // 是否增加搜索功能
		"sDom": "<'row-fluid'<f>r>t<'row-fluid'<'span6'i><'span6'p>>", // table布局
        "aoColumnDefs": [{'bSortable': false,'aTargets': [2,3,4]}], // 页面中不进行排序的列，数组形式
		"fnServerParams" : function(aoData) {
			aoData.push({ "name" : "name", "value" : name });
			aoData.push({ "name" : "websiteid", "value" : websiteid });
		},
		"sServerMethod" : "POST",
		"sAjaxSource" : "getList",
		"aoColumns" : [{
			"sClass" : "center",
			"mDataProp" : "name"
		}, {
			"sClass" : "center",
			"mDataProp" : "nickname"
		},{
			"sClass" : "center",	
			"mDataProp" : "catagoryName"
		}, {
			"sClass" : "center",
			"mDataProp" : "websiteName"
		}, {
			"sClass" : "center",
			"mDataProp" : "id",
			"mRender" : function(data, type, full) {
				var html = "";
				html += "<a class='btn mini blue' href='./edit?id="+data+"'>修改</a>";
				return html;
			}
		} ],
        "sPaginationType": "bootstrap",
        "oLanguage": {
           	"sProcessing" : "处理中...",
           	"sInfo" : "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
           	"oPaginate": {
              	"sFirst" : "首页",
		        "sPrevious": "上一页",
		        "sNext": "下一页",
		        "sLast" : "尾页"
           	}
		}
	});
	
四、日期控件
	<input type="text" value="2012-05-15 21:05" id="datetimepicker" data-date-format="yyyy-mm-dd">
	$("#datetimepicker").datetimepicker({
		format: "yyyy-mm-dd",
		autoclose: true,
		todayBtn: true,
		language:'zh-CN',
		pickerPosition:"bottom-left"
	});