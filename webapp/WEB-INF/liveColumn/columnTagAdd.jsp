<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="tagList" class="modal hide fade" tabindex="-1"
	data-width="800">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true"></button>
		<h3 id="title">添加标签</h3>
	</div>
	<form id="form_sample_2" action="#" class="form-horizontal">
		<div class="modal-body">
			<div id="tagTable" class="row-fluid span12">
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" data-dismiss="modal" class="btn">关闭</button>
		</div>
	</form>
</div>
<script>
function columnTagAddModal(id){
	document.getElementById("form_sample_2").reset();
	$.ajax({
		type : 'POST',
		url : './getColumnTagByColumnId',
		dataType : "json",
		data : {
			columnId : id					
		},
		success : function(data, status) {
			var option = "";
			$.each(data,function(tindex, telement) {
				if(data.length == 0){
					$(".modal-body").html("没有可选的标签");
					return;
				}
				if(tindex == 0){
					if(telement.columnId == id){
						option += '<div class="row-fluid"><div class="span3"><label class="checkbox line">'+telement.tagName+'<input onclick="optColumnTag('+id+','+telement.id+',this.checked)" type="checkbox" checked value=""></label></div>';
					}else{
						option += '<div class="row-fluid"><div class="span3"><label class="checkbox line">'+telement.tagName+'<input onclick="optColumnTag('+id+','+telement.id+',this.checked)" type="checkbox" value=""></label></div>';
					}
				}else if(tindex + 1 == data.length){
					if(telement.columnId == id){
						option += '<div class="span3"><label class="checkbox line">'+telement.tagName+'<input onclick="optColumnTag('+id+','+telement.id+',this.checked)" type="checkbox" checked value=""></label></div></div>';
					}else{
						option += '<div class="span3"><label class="checkbox line">'+telement.tagName+'<input onclick="optColumnTag('+id+','+telement.id+',this.checked)" type="checkbox" value=""></label></div></div>';
					}
				}else if((tindex + 1) % 4 == 0){
					if(telement.columnId == id){
						option += '<div class="span3"><label class="checkbox line">'+telement.tagName+'<input onclick="optColumnTag('+id+','+telement.id+',this.checked)" type="checkbox" checked value=""></label></div></div><div class="row-fluid">';
					}else{
						option += '<div class="span3"><label class="checkbox line">'+telement.tagName+'<input onclick="optColumnTag('+id+','+telement.id+',this.checked)" type="checkbox" value=""></label></div></div><div class="row-fluid">';
					}
				}else if((tindex + 1) % 4 > 0){
					if(telement.columnId == id){
						option += '<div class="span3"><label class="checkbox line">'+telement.tagName+'<input onclick="optColumnTag('+id+','+telement.id+',this.checked)" type="checkbox" checked value=""></label></div>';
					}else{
						option += '<div class="span3"><label class="checkbox line">'+telement.tagName+'<input onclick="optColumnTag('+id+','+telement.id+',this.checked)" type="checkbox" value=""></label></div>';
					}
				}
			});
			$("#tagTable").html(option);
		}
	})
}

function optColumnTag(columnId,tagId,state){
	var action = './addColumnTag';
	if(!state){
		action = './delColumnTag';
	}
	$.ajax({
		type : 'POST',
		url : action,
		dataType : "text",
		data : {
			columnId : columnId,
			tagId : tagId
		},
		success : function(data, status) {
			initPage();
		}
	})
	
}
</script>