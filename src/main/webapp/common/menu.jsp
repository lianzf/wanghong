<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" import="com.wanghong.constant.Constant"%>
<%@ page language="java" import="com.wanghong.po.User"%>
<%
	String menu = "";
	if(request.getRequestURI().indexOf("index.jsp") > 0) {
		menu = Constant.MENU_INDEX;
	}
	else {
		menu = request.getAttribute("menu").toString();
	}
	
	Object obj = request.getSession().getAttribute("userInfo");
	User user = null;
	if(obj != null) {
		user = (User)obj;
	}
%>
<div class="page-sidebar nav-collapse collapse">
	<!-- BEGIN SIDEBAR MENU -->
	<input id="path" type="hidden" value="<%=menu%>" />
	<ul class="page-sidebar-menu">
		<li>
			<div class="sidebar-toggler hidden-phone"></div> 
		</li>
		<li id="<%=Constant.MENU_INDEX %>" class="start">
			<a href="<%=request.getContextPath()%>/index.jsp"> 
				<i class="icon-home"></i> 
				<span class="title">首页</span> 
				<span class="selected"></span>
			</a>
		</li>
		<li class="last"><a href="javascript:;"> <i
				class="icon-info-sign"></i> <span class="title">主播自服务</span> <span
				class="arrow "></span>
		</a>
			<ul class="sub-menu">
				<li id=<%=Constant.MENU_ACTOR_INFO%>><a
					href="<%=request.getContextPath()%>/actor/getInfo"> 我的信息</a></li>
				<li id="<%=Constant.MENU_ACTOR_PHOTO%>"><a
					href="<%=request.getContextPath()%>/classify/classify"> 相册管理</a></li>
				<li id="<%=Constant.MENU_ACTOR_BILL%>"><a
					href="<%=request.getContextPath()%>/classify/classify"> 我的账单</a></li>
			</ul></li>
		<li class="last"><a href="javascript:;"> <i
				class="icon-file-text"></i> <span class="title">运营管理</span> <span
				class="arrow "></span>
		</a>
			<ul class="sub-menu">
				<li id="st"><a href="<%=request.getContextPath()%>/actor/actor"
					title="主播库">主播库</a></li>
			</ul></li>
	</ul>
	<!-- END SIDEBAR MENU -->
</div>