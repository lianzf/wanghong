<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" import="com.tasting.admin.constant.Constant"%>
<%
	String menu = "";
	if (request.getRequestURI().indexOf("index.jsp") > 0) {
		menu = Constant.MENU_INDEX;
	} else {
		menu = request.getAttribute("menu").toString();
	}
%>
<div class="page-sidebar nav-collapse collapse">
	<!-- BEGIN SIDEBAR MENU -->
	<input id="path" type="hidden" value="<%=menu%>" />
	<ul class="page-sidebar-menu">
		<li>
			<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
			<div class="sidebar-toggler hidden-phone"></div> <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
		</li>
		<li id="<%=Constant.MENU_INDEX %>" class="start">
			<a href="<%=request.getContextPath()%>/index.jsp"> 
				<i class="icon-home"></i> 
				<span class="title">首页</span> 
				<span class="selected"></span>
			</a>
		</li>
		<li class="last">
			<a href="javascript:;"> 
				<i class="icon-info-sign"></i>
				<span class="title">信息发布</span> 
				<span class="arrow "></span>
			</a>
			<ul class="sub-menu">
				<li>
					<a href="javascript:;">首页管理<span class="arrow "></span></a>
					<ul class="sub-menu">
						<li id="banner"><a href="<%=request.getContextPath()%>/banner/banner"> Banner管理</a></li>
						<li id="classify"><a href="<%=request.getContextPath()%>/classify/classify"> Icon管理</a></li>
						<li id="<%=Constant.MENU_MESSAGE_EXQUISITEACTOR%>"><a href="<%=request.getContextPath()%>/exquisiteActor/exquisiteActor"> 精选主播</a></li>
						<li id="<%=Constant.MENU_MESSAGE_EXQUISITEORDER%>"><a href="<%=request.getContextPath()%>/boutiqueVideo/boutiqueVideo"> 精品播单</a></li>
						<li id="<%=Constant.MENU_MESSAGE_EXQUISITEVIDEO%>"><a href="<%=request.getContextPath()%>/exquisiteVideo/exquisiteVideo"> 精品视频</a></li>
					</ul>
				</li>
				<li id="liveActor"><a href="<%=request.getContextPath()%>/liveActor/liveActor"> 直播频道</a></li>
			</ul>
		</li>
		<li class="last">
			<a href="javascript:;"> 
				<i class="icon-file-text"></i>
				<span class="title">内容管理</span> 
				<span class="arrow "></span>
			</a>
			<ul class="sub-menu">
				<li id="<%=Constant.MENU_OPERATION_ACTOR%>"><a href="<%=request.getContextPath()%>/actor/actor" title="主播库">主播库</a></li>
				<li id="<%=Constant.MENU_OPERATION_VIDEO%>"><a href="<%=request.getContextPath()%>/video/video">视频库</a></li>
				<li id="<%=Constant.MENU_OPERATION_TAG%>"><a href="<%=request.getContextPath()%>/tag/tag">标签库</a></li>
				<li id="<%=Constant.MENU_MESSAGE_LIVECHANNEL%>"><a href="<%=request.getContextPath()%>/liveColumn/liveColumn"> 主播分类管理</a></li>
				<li id="<%=Constant.MENU_OPERATION_RANKINGLIST_ACTOR%>"><a href="<%=request.getContextPath()%>/rankinglistActor/rankinglist">榜单管理</a></li>
				<li id="<%=Constant.MENU_OPERATION_ORDER%>"><a href="<%=request.getContextPath()%>/rankinglistVideo/rankinglist">播单管理</a></li>
			</ul>
		</li>
		<li class="last">
			<a href="javascript:;"> 
				<i class="icon-cogs"></i>
				<span class="title">运营管理</span> 
				<span class="arrow "></span>
			</a>
			<ul class="sub-menu">
				<li id="<%=Constant.MENU_OPERATION_COMMENT%>"><a href="<%=request.getContextPath()%>/comment/comment">评论管理</a></li>
				<li id="<%=Constant.MENU_OPERATION_USER%>"><a href="<%=request.getContextPath()%>/user/user" >用户管理</a></li>
				<li id="<%=Constant.MENU_MESSAGE_SYSTEM%>"><a href="<%=request.getContextPath()%>/systemMsg/systemMsg">系统公告</a></li>
			</ul>
		</li>
		<li class="last">
			<a href="javascript:;"> 
				<i class="icon-cogs"></i>
				<span class="title">系统管理</span> 
				<span class="arrow "></span>
			</a>
			<ul class="sub-menu">
				<li id="<%=Constant.MENU_SYSTEM_DICTIONARY%>"><a href="<%=request.getContextPath()%>/dictionary/dictionary">数据字典</a></li>
				<li id="<%=Constant.MENU_OPERATION_COLUMN%>"><a href="<%=request.getContextPath()%>/column/column">频道管理</a></li>
			</ul>
		</li>
	</ul>
	<!-- END SIDEBAR MENU -->
</div>