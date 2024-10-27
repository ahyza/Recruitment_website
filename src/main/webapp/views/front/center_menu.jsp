<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>个人中心</title>
	<link rel="stylesheet" href="<%=path%>/static/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=path%>/static/css/style.css" />
	<script type="text/JavaScript" src="<%=path%>/static/js/jquery-1.12.4.js"></script>
	<script type="text/JavaScript" src="<%=path%>/static/js/bootstrap.js"></script>
</head>

<body>
<div class="col-md-3">
	<div class="card mb-4">
		<div class="card-header bg-primary text-white">
			<h4 class="my-0">个人中心</h4>
		</div>
		<div class="list-group list-group-flush">
			<c:if test="${sessionScope.user.userRole == 1 }">
				<a href="<%=path %>/userInfo" class="list-group-item list-group-item-action">个人信息管理</a>
				<a href="<%=path %>/resumeManage" class="list-group-item list-group-item-action">已投递简历管理</a>
				<a href="<%=path %>/userInfosPage" class="list-group-item list-group-item-action">求职意向管理</a>
			</c:if>
			<c:if test="${sessionScope.user.userRole == 2 }">
				<a href="<%=path %>/companyInfo" class="list-group-item list-group-item-action">企业信息管理</a>
				<a href="<%=path %>/resumeManage" class="list-group-item list-group-item-action">已收到简历管理</a>
				<a href="<%=path %>/userRecruitmentPage" class="list-group-item list-group-item-action">职位信息管理</a>
			</c:if>
			<a href="<%=path %>/updatePwdPage" class="list-group-item list-group-item-action">修改密码</a>
		</div>
	</div>
</div>
</body>

</html>
