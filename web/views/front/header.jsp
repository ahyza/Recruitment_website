<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="<%=path %>/static/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=path %>/static/css/style.css" />
		
		
	</head>

	<body>
		<div class="bs-docs-section clearfix">
			<div class="row">
				<div class="col-lg-12">
					<div class="bs-component">
						<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
							<a class="navbar-brand" href="<%=path %>/index"><img src="<%=path%>/pic/logo.gif" class="radius-circle rotate-hover" height="50" alt="" /> 人才招聘网站</a>
							<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>

							<div class="collapse navbar-collapse" id="navbarColor01">
								<ul class="navbar-nav mr-auto">
									<li class="nav-item">
										<a class="nav-link" href="<%=path %>/recruitment">招聘信息 </a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="<%=path %>/infos">求职意向</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="<%=path %>/resumes">岗位分析</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="<%=path %>/mail">信箱</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="<%=path %>/views/behind/login.jsp">管理员后台管理</a>
									</li>
								</ul>
							</div>
							<c:if test="${sessionScope.user != null }">
								<div class="pull-right">
									<a href="<%=path %>/userCenter">
										<font color="white">欢迎,${sessionScope.user.userName }</font>
									</a>
									<a href="<%=path %>/logout">
										<font color="white">退出</font>
									</a>
								</div>
							</c:if>
							<c:if test="${sessionScope.user == null }">
								<div class="pull-right">
									<a href="<%=path %>/views/front/login.jsp">
										<font color="white">登录</font>
									</a>
									<a href="<%=path %>/views/front/register.jsp">
										<font color="white">注册</font>
									</a>
								</div>
							</c:if>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<br />
		<script type="text/javascript" src="<%=path %>/static/js/jquery-1.12.4.js"></script>
		<script type="text/javascript" src="<%=path %>/static/js/bootstrap.js"></script>
	</body>

</html>