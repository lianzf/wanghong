<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
	<div class="modal-body" data-width="720" >
		<div class="portlet-body form row-fluid">
			<form id="form_sample_1" action="#" class="form-horizontal dialog" onsubmit="return false;" enctype="multipart/form-data">
				<input type="hidden" id="initID" name="id" value="${banner.id}"/> 
				<input type="hidden" id="parentId" name="parentId" value="${parentId}"/>
				<div class="control-group">
					<label class="control-label" for="firstName">名称<span class="required">*</span></label>
					<div class="controls">
						<input type="text" name="displayName" class="m-wrap span10" placeholder="名称" value="${banner.displayName}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label"><span class="required">*</span>图片</label>
					<div class="controls">
						<div class="fileupload fileupload-new" data-provides="fileupload">
							<div class="fileupload-new thumbnail" style="width: 150px; height: 115px;">
								<img src="${banner.icon != null && banner.icon != '' ? imageHref : '../media/image/default-img.png'}" alt=""/>
							</div>
							<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 100px; max-height: 75px; line-height: 20px;"></div>
							<div>
								<span class="btn btn-file">
									<span class="fileupload-new">选择图片</span> 
									<span class="fileupload-exists">更改</span> 
									<input type="file" class="default" name="icon"/>
								</span> 
								<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">删除</a>
							</div>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">优先级<span class="required">*</span></label>
					<div class="controls">
						<input type="number" class="m-wrap span10" name="displayOrder" value="${banner.displayOrder}" maxlength="4" />
						<span class="help-inline">正整数,数字越大优先级越高</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="firstName">内容类型</label>
					<div class="controls">
						<select id="contentType" name="contentType" class="m-wrap span10">
							<c:forEach items="${contentList}" var="selectType">
								<c:if test="${selectType.id == banner.contentType}">
									<option value="${selectType.id}" selected="selected">${selectType.name}</option>
								</c:if>
								<c:if test="${selectType.id != banner.contentType}">
									<option value="${selectType.id}">${selectType.name}</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="firstName">内容</label>
					<div class="controls">
						<input type="text" id="visitUrl" name="visitUrl" class="m-wrap span10" placeholder="访问地址" value="${banner.visitUrl}">
						<span class="help-inline">根据内容类型输入对应信息,除活动页面外其他都是输入对应的ID,必须填入有效信息</span>
					</div>
				</div>
				<div class="control-group">
					<div class="control-group">
						<label class="control-label">备注描述</label>
						<div class="controls">
							<textarea rows="3" class="m-wrap span10" name="description">${banner.description}</textarea>
						</div>
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
jQuery(document).ready(function() {
	var contentType = $("#contentType").val();
	if(contentType == 'noskip'){
		$("#visitUrl").attr("readonly",true);
	}
});

$("#contentType").change(function(){
	var contentType = $("#contentType").val();
	if(contentType == 'noskip'){
		$("#visitUrl").attr("readonly",true);
	}else{
		$("#visitUrl").attr("readonly",false);
	}
});
$("#submit_btn").click(function(){
	var id = $("#initID").val();
	if(id != "" && id != null){
		$("#form_sample_1").attr("action","./editBanner");
	}else{
		$("#form_sample_1").attr("action","./addBanner");
	}
	
	if($('#form_sample_1').valid()){
		App.Ajax.submit('form_sample_1',{
			fn : function(json){
				console.log(json);
				App.Tables.refresh('portlet');
			}
		});
	}
});

App.validate('form_sample_1',{
	rules : {
		"displayName" : {
			maxlength:50,
			required : true
		},
		"displayOrder" : {
			maxlength:4,
			isNumber : true,
			required : true
		}
	}
});
</script>