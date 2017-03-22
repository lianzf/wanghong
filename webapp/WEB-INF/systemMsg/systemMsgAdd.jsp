<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<div class="modal-body">
		<div class="portlet-body form row-fluid">
			<form id="form_sample_1" action="#" class="form-horizontal dialog" onsubmit="return false;" method="post">
				<input type="hidden" id="initID" name="id" value="${systemMsg.id}"/> 
				<div class="control-group">
					<label class="control-label">标题<span class="required">*</span></label>
					<div class="controls">
						<input id="subject" name="subject" type="text" value="${systemMsg.subject}" class="m-wrap large">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">简介</label>
					<div class="controls">
						<textarea name="introduction" class="m-wrap large">${systemMsg.introduction}</textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">公告详情<span class="required">*</span></label>
					<div class="controls">
						<textarea name="message" class="m-wrap large">${systemMsg.message}</textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn green" id="submit_btn" >保存</button>
					<button type="button" data-dismiss="modal" class="btn">关闭</button>
				</div>
			</form>
		</div>
	</div>
<script>
jQuery(document).ready(function() {
	FormComponents.init();
	$("#submit_btn").click(function(){
		var id = $("#initID").val();
		if(id != "" && id != null){
			$("#form_sample_1").attr("action","./editSystemMsg");
		}else{
			$("#form_sample_1").attr("action","./addSystemMsg");
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
			"subject" : {
				required : true
			},
			"message" : {
				required : true
			}
		}
	});
});
</script>
</body>
</html>