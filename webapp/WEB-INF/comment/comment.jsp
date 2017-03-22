<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<%@ include file="/common/meta.jsp"%>
<%@include file="/common/footer.jsp"%>
<head>
<style type="text/css">
.row {
	margin-left: 0px;
}
</style>
</head>
<body class="page-header-fixed page-footer-fixed">
	<%@ include file="/common/nav.jsp"%>
	<div class="page-container">
		<%@ include file="/common/menu.jsp"%>
		<div class="page-content">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><i class="icon-list"></i><a href="＃">评论</a><i class="icon-angle-right"></i></li>
							<li><a href="#" >列表</a></li>
						</ul>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="tabbable tabbable-custom boxless">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#actorComment" onclick="initActorPage();" data-toggle="tab">主播评论</a></li>
								<li><a class="" href="#videoComment" onclick="initVideoPage();" data-toggle="tab">视频评论</a></li>
							</ul>
							<div class="tab-content">
								<jsp:include page="actorComment.jsp"></jsp:include>
								<jsp:include page="videoComment.jsp"></jsp:include>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var userStateDic = constructDictionaryOption1("RECOMMENT");
jQuery(document).ready(function() {
	App.init(); // initlayout and core plugins
	UIModals.init();
	TableManaged.init();
	initActorPage();
	FormComponents.init();
	constructDictionaryOption("RECOMMENT", "", "state","是否显示");
	constructDictionaryOption("RECOMMENT", "", "recommend","是否推荐");
	constructDictionaryOption("RECOMMENT", "","isEditorComment", "是否编辑");
	constructDictionaryOption("RECOMMENT", "", "state1","是否显示");
	constructDictionaryOption("RECOMMENT", "", "recommend1","是否推荐");
	constructDictionaryOption("RECOMMENT", "","isEditorComment1", "是否编辑");
});
</script>
</html>