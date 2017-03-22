<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="meta.jsp"%>
</head>
<body class="page-header-fixed page-footer-fixed">

	<%@ include file="nav.jsp"%>

	<div class="page-container">
		<%@ include file="menu.jsp"%>
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<div class="container-fluid">您的权限不够</div>
		</div>
	</div>

	<%@ include file="footer.jsp" %>
	<script>
		jQuery(document).ready(function() {
			App.init(); // initlayout and core plugins
		});
	</script>
</body>
</html>