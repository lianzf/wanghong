<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" import="com.framework.base.Constant"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
			<security:authorize url="AUTHMANAGE">
				<a href="javascript:;"><i class="icon-cogs"></i><span class="title">系统权限</span><span class="arrow"></span></a>
			</security:authorize>
			<ul class="sub-menu">
				<security:authorize url="/system/dictionary.jsp">
					<li id="<%=Constant.MENU_DICTIONARY%>"><a href="<%=request.getContextPath()%>/system/dictionary">数据字典</a></li>
				</security:authorize>
				<security:authorize url="/system/userManage.jsp">
					<li id="<%=Constant.MENU_DICTIONARY%>"><a href="<%=request.getContextPath()%>/system/userManage.jsp">用户管理</a></li>
				</security:authorize>
				<security:authorize url="/system/rolesManage.jsp">
					<li id="<%=Constant.MENU_DICTIONARY%>"><a href="<%=request.getContextPath()%>/system/rolesManage.jsp">角色管理</a></li>
				</security:authorize>
				<security:authorize url="/system/resManage.jsp">
					<li id="<%=Constant.MENU_DICTIONARY%>"><a href="<%=request.getContextPath()%>/system/resManage.jsp">资源管理</a></li>
				</security:authorize>
			</ul>
		</li>
	</ul>
	<!-- END SIDEBAR MENU -->
</div>