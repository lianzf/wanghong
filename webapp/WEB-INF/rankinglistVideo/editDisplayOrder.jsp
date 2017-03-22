<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
	<div class="modal-body" data-width="720">
		<div class="portlet-body form row-fluid">
			<form id="form_sample_2" action="#" class="form-horizontal dialog">
				<input type="hidden" name="rankinglistVideoId" value="${rankinglistVideoId}">
				<div class="control-group">
					<label class="control-label" for="firstName">视频ID<span class="required">*</span></label>
					<div class="controls">
						<input type="text" name="videoId" readonly class="m-wrap span10" value="${videoId}">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">优先级<span class="required">*</span></label>
					<div class="controls">
						<input type="number" class="m-wrap span10" name="displayOrder" value="" maxlength="4" />
						<span class="help-inline">正整数,数字越大优先级越高</span>
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
	$("#form_sample_2").attr("action","./saveDisplayOrder");
	if($('#form_sample_2').valid()){
		App.Ajax.submit('form_sample_2',{
			fn : function(json){
				App.Tables.refresh('portlet');
			}
		});
	}
});

App.validate('form_sample_2',{
	rules : {
		"displayOrder" : {
			maxlength:4,
			isNumber : true,
			required : true
		}
	}
});
</script>