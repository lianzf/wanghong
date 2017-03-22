<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
	<div class="modal-body">
		<div class="tab-pane profile-classic row-fluid ">
			<input type="hidden" id="userId" value="${user.id }"/>
			<div class="span2"><img src="../downloadFile.jsp?identity=${userIcon }&path=${user.userIcon}" width="161" height="132"/></div>
			<ul class="unstyled span10">
				<li><span>用户名:</span> ${user.userName }</li>
				<li><span>性别:</span> ${user.userSex == 1 ? "男" : "女" }</li>
				<li><span>用户身份</span>
				<select id="identity" class="m-wrap xsmall" placeholder="用户身份">
					<c:forEach items="${identifyList}" var="identify">
						<c:if test="${identify.id == user.userIdentity }">
							<option value="${identify.id}" selected="selected">${identify.name}</option>
						</c:if>
						<c:if test="${identify.id != user.userIdentity }">
							<option value="${identify.id}">${identify.name}</option>
						</c:if>
					</c:forEach>
				</select>
				</li>
			</ul>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn green" id="submit_btn" >保存</button>
		<button type="button" data-dismiss="modal" class="btn">关闭</button>
	</div>
<script>
$("#submit_btn").click(function(){
	var userId = $("#userId").val();
	var userIdentity = $("#identity").val();
	$.ajax({
		type : 'POST',
		url : './updateUser',
		dataType : "text",
		data : {
			id : userId,
			userIdentity : userIdentity
		},
		success : function(data) {
			$("#dialog").modal('hide');
			initPage();
		}
	})
});
</script>