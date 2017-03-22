<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
	<form id="form_sample_1" action="#" class="form-horizontal">
		<input type="hidden" id="initID" name="id" value="${comment.id }"/> 
		<div class="modal-body">
			<div class="row-fluid">
				<div class="control-group">
					<label class="control-label">是否推荐评论</label>
					<div class="controls">
						<select id="orecommend" name="recommend" class=" m-wrap span8">
							<c:forEach items="${stateList}" var="selectGroup">
								<c:if test="${selectGroup.id == comment.recommend }">
									<option value="${selectGroup.id}" selected="selected">${selectGroup.name}</option>
								</c:if>
								<c:if test="${selectGroup.id != comment.recommend }">
									<option value="${selectGroup.id}">${selectGroup.name}</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="control-group">
					<label class="control-label">分数</label>
					<div class="controls">
						<input id="ostarLevel" readonly name="starLevel" class=" m-wrap span8" value="${comment.starLevel }"/>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="control-group">
					<label class="control-label">是否显示</label>
					<div class="controls">
						<select id="ostate" name="state" readonly class=" m-wrap span8">
							<c:forEach items="${stateList}" var="selectGroup">
								<c:if test="${selectGroup.id == comment.state }">
									<option value="${selectGroup.id}" selected="selected">${selectGroup.name}</option>
								</c:if>
								<c:if test="${selectGroup.id != comment.state }">
									<option value="${selectGroup.id}">${selectGroup.name}</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="control-group">
					<label class="control-label">评论内容</label>
					<div class="controls">
						<textarea name="content" readonly class=" m-wrap span8">${comment.content }</textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
		<div class="row-fluid">
			<label class="control-label"></label>
			<div class="controls span8" align="left">
				<button type="button" class="btn green" id="submit_btn" >保存</button>
				<button type="button" data-dismiss="modal" class="btn">关闭</button>
				</div>
			</div>
		</div>
	</form>
<script type="text/javascript">
$("#submit_btn").click(function(){
	var id = $("#initID").val();
	if(id != "" && id != null){
		$("#form_sample_1").attr("action","./editComment");
	}else{
		$("#form_sample_1").attr("action","./addComment");
	}
	if($('#form_sample_1').valid()){
		App.Ajax.submit('form_sample_1',{
			fn : function(json){
				App.Tables.refresh('${table}');
			}
		});
	}
});

App.validate('form_sample_1',{
	rules : {
		"content" : {
			required : true
		}
	}
});
</script>