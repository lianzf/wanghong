<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="modal-body" data-width="720">
	<div class="portlet-body form row-fluid">
		<!-- <form id="form_sample_1" action="#" class="form-horizontal dialog" onsubmit="return false;" enctype="multipart/form-data"> -->
		<form id="form_sample_1" action="#" class="form-horizontal dialog" onsubmit="return false;">
			<input type="hidden" id="initID" name="id" value="${tag.id }"/> 
			<%-- <div class="control-group">
				<label class="control-label">图片</label>
				<div class="controls">
					<div class="fileupload fileupload-new" data-provides="fileupload">
						<div class="fileupload-new thumbnail" style="width: 150px; height: 115px;">
							<img src="${tag.pic != null && tag.pic != '' ? imageHref : '../media/image/default-img.png'}" alt=""/>
						</div>
						<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 100px; max-height: 75px; line-height: 20px;"></div>
						<div>
							<span class="btn btn-file">
								<span class="fileupload-new">选择图片</span> 
								<span class="fileupload-exists">更改</span> 
								<input type="file" class="default" name="pic"/>
							</span> 
							<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">删除</a>
						</div>
					</div>
				</div>
			</div> --%>
			<div class="control-group">
				<label class="control-label" for="firstName"><span class="required">*</span>标签名</label>
				<div class="controls">
					<input type="text" name="tagName" class="m-wrap span10" placeholder="标签名" value="${tag.tagName}">
				</div>
			</div>
		</form>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn green" id="submit_btn" >保存</button>
	<button type="button" data-dismiss="modal" class="btn">关闭</button>
</div>
<script>
$("#submit_btn").click(function(){
	var id = $("#initID").val();
	if(id != "" && id != null){
		$("#form_sample_1").attr("action","./editTag");
	}else{
		$("#form_sample_1").attr("action","./addTag");
	}
	if($('#form_sample_1').valid()){
		App.Ajax.submit('form_sample_1',{
			fn : function(json){
				App.Tables.refresh('portlet');
			}
		});
	}
});
App.validate('form_sample_1',{
	rules : {
		"tagName" : {
			required : true
		}
	}
});
</script>