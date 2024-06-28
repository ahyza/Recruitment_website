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
<title></title>
<link rel="stylesheet" href="<%=path%>/static/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=path%>/static/css/style.css" />
<script type="text/JavaScript" src="<%=path%>/static/js/jquery-1.12.4.js"></script>
<script type="text/JavaScript" src="<%=path%>/static/js/bootstrap.js"></script>
</head>

<body>
	<div class="col-md-3 offset-1">
		<div class="panel panel-default">
			<div>
				<h3>个人中心</h3>
			</div>
			<div class="panel-body">
				<div class="list-group">
					<c:if test="${sessionScope.user.userRole == 1 }">
						<a href="<%=path %>/userInfo" class="list-group-item active">个人信息管理</a>
						<hr>
						<a href="<%=path %>/resumeManage" class="list-group-item active">已投递简历管理</a>
						<hr>
						<a href="<%=path %>/userInfosPage" class="list-group-item active">求职意向管理</a>
						<hr>
					</c:if>
					<c:if test="${sessionScope.user.userRole == 2 }">
						<a href="<%=path %>/companyInfo" class="list-group-item active">企业信息管理</a>
						<hr>
						<a href="<%=path %>/resumeManage" class="list-group-item active">已收到简历管理</a>
						<hr>
						<a href="<%=path %>/userRecruitmentPage." class="list-group-item active">职位信息管理</a>
						<hr>
					</c:if>
					<a href="<%=path %>/updatePwdPage" class="list-group-item active">修改密码</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>