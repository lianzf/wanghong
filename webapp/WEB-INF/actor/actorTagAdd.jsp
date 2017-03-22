<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="modal-body">
	<div class="row-fluid span12">
		<input class="m-wrap " size="10" id="tagName" type="text" placeholder="标签名">
		<button id="addTag" class="btn green">添加</button>
	</div>
	<div id="tagTable" class="row-fluid span12">
	</div>
</div>
<div class="modal-footer">
	<button type="button" data-dismiss="modal" class="btn">关闭</button>
</div>
<script>
var actorId = "${actorId}"
initTag(actorId);
function initTag(id){
	$.ajax({
		type : 'POST',
		url : './getActorTagByActorId',
		dataType : "json",
		data : {
			actorId : id					
		},
		success : function(data, status) {
			var option = "";
			$.each(data,function(tindex, telement) {
				if(data.length == 0){
					$(".modal-body").html("没有可选的标签");
					return;
				}
				if(tindex == 0){
					option += '<div class="row-fluid"><div class="span3"><label class="checkbox line">'+telement.tagName+'<input onclick="optActorTag('+id+','+telement.id+',this.checked)" type="checkbox" checked value=""></label></div>';
				}else if(tindex + 1 == data.length){
					option += '<div class="span3"><label class="checkbox line">'+telement.tagName+'<input onclick="optActorTag('+id+','+telement.id+',this.checked)" type="checkbox" checked value=""></label></div></div>';
				}else if((tindex + 1) % 4 == 0){
					option += '<div class="span3"><label class="checkbox line">'+telement.tagName+'<input onclick="optActorTag('+id+','+telement.id+',this.checked)" type="checkbox" checked value=""></label></div></div><div class="row-fluid">';
				}else if((tindex + 1) % 4 > 0){
					option += '<div class="span3"><label class="checkbox line">'+telement.tagName+'<input onclick="optActorTag('+id+','+telement.id+',this.checked)" type="checkbox" checked value=""></label></div>';
					
				}
			});
			$("#tagTable").html(option);
		}
	})
}

$("#addTag").bind('click', function() {
	var tagName = $("#tagName").val();
	if(tagName == null || tagName == ''){
		bootbox.alert("请您输入要添加的标签，谢谢!");
		return false;
	}
	
	$.ajax({
		type : 'POST',
		url : './addTagToActor',
		dataType : "text",
		data : {
			actorId : actorId,
			tagName : tagName
		},
		success : function(data) {
			if(data != '操作成功'){
				bootbox.alert("请检查用户是否已添加该标签!");
			}
			initTag(actorId);
		}
	})
	
});

function optActorTag(actorId,tagId,state){
	var action = './addActorTag';
	if(!state){
		action = './delActorTag';
	}
	$.ajax({
		type : 'POST',
		url : action,
		dataType : "text",
		data : {
			actorId : actorId,
			tagId : tagId
		},
		success : function(data, status) {
			
		}
	})
	
}
</script>