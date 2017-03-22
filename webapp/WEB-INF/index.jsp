<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page language="java" import="com.tasting.admin.constant.Constant"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<%@ include file="/common/meta.jsp"%>
<!-- BEGIN HEAD -->
<head>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-footer-fixed">
	<!-- BEGIN HEADER -->
	<%@ include file="/common/nav.jsp"%>
	<!-- END HEADER -->
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<%@ include file="/common/menu.jsp"%>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<ul class="breadcrumb">
							<li><i class="icon-home"></i><a href="＃">首页</a><i class="icon-angle-right"></i></li>
							<!-- <li><a href="#">修改密码</a></li> -->
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<div class="row-fluid">
						<div class="span3 responsive" data-tablet="span6" data-desktop="span3">
							<div class="dashboard-stat blue">
								<div class="visual">
									<i class="icon-comments"></i>
								</div>
								<div class="details">
									<div class="number">
										${commentCount }
									</div>
									<div class="desc">                           
										评论数
									</div>
								</div>
								<a class="more" href="<%=request.getContextPath()%>/comment/comment">
								更多 <i class="m-icon-swapright m-icon-white"></i>
								</a>        
							</div>
						</div>
						<div class="span3 responsive" data-tablet="span6" data-desktop="span3">
							<div class="dashboard-stat green">
								<div class="visual">
									<i class="icon-user"></i>
								</div>
								<div class="details">
									<div class="number">${actorCount }</div>
									<div class="desc">主播数</div>
								</div>
								<a class="more" href="<%=request.getContextPath()%>/actor/actor">
								更多 <i class="m-icon-swapright m-icon-white"></i>
								</a>  
							</div>
						</div>
						<div class="span3 responsive" data-tablet="span6  fix-offset" data-desktop="span3">
							<div class="dashboard-stat purple">
								<div class="visual">
									<i class="icon-globe"></i>
								</div>
								<div class="details">
									<div class="number">${videoCount }</div>
									<div class="desc">视频数</div>
								</div>
								<a class="more" href="<%=request.getContextPath()%>/video/video">
								更多 <i class="m-icon-swapright m-icon-white"></i>
								</a>  
							</div>
						</div>
						<div class="span3 responsive" data-tablet="span6" data-desktop="span3">
							<div class="dashboard-stat yellow">
								<div class="visual">
									<i class="icon-bar-chart"></i>
								</div>
								<div class="details">
									<div class="number">待议</div>
									<div class="desc">活跃数</div>
								</div>
								<a class="more" href="#">
								更多 <i class="m-icon-swapright m-icon-white"></i>
								</a>        
							</div>
						</div>
					</div>
			</div>
		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<%@include file="/common/footer.jsp"%>
	<script>
		jQuery(document).ready(function() {
			App.init(); // initlayout and core plugins
		});
	</script>
</body>
<!-- END BODY -->
</html>