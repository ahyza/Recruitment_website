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
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>人才招聘网站</title>
	<link rel="stylesheet" href="<%=path %>/static/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=path %>/static/css/style.css" />
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f8f9fa;
			margin: 0;
			padding: 0;
		}

		/* 干净大方的导航栏 */
		.navbar {
			background-color: #007bff;
			padding: 10px 15px;
		}

		.navbar-brand img {
			border-radius: 50%;
			height: 50px;
		}

		.nav-link {
			color: white !important;
			padding: 8px 15px;
		}

		.nav-link:hover {
			background-color: #0056b3;
			border-radius: 5px;
		}

		.navbar-toggler {
			border: none;
		}

		.navbar-toggler-icon {
			color: white;
		}

		.pull-right a {
			color: white;
			margin-right: 15px;
		}

		.pull-right a:hover {
			text-decoration: underline;
		}

		/* 页面结构清晰 */
		.container {
			margin-top: 20px;
		}

		.bs-component {
			margin-bottom: 20px;
		}
	</style>
</head>

<body>
<div class="bs-docs-section clearfix">
	<div class="row">
		<div class="col-lg-12">
			<div class="bs-component">
				<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
					<a class="navbar-brand" href="<%=path %>/index">
						<img src="<%=path %>/pic/logo.gif" alt="Logo" /> 人才招聘网站
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarColor01">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item">
								<a class="nav-link" href="<%=path %>/recruitment">招聘信息</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="<%=path %>/infos">求职意向</a>
							</li>
							<!-- 新增数据分析模块 -->
							<li class="nav-item">
								<a class="nav-link" href="http://127.0.0.1:5500/index.html">数据分析</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="<%=path %>/resumes">简历模板</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="<%=path %>/mail">信箱</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="<%=path %>/views/behind/login.jsp">管理员后台管理</a>
							</li>
						</ul>
					</div>

					<div class="pull-right">
						<c:if test="${sessionScope.user != null }">
							<a href="<%=path %>/userCenter">欢迎, ${sessionScope.user.userName }</a>
							<a href="<%=path %>/logout">退出</a>
						</c:if>
						<c:if test="${sessionScope.user == null }">
							<a href="<%=path %>/views/front/login.jsp">登录</a>
							<a href="<%=path %>/views/front/register.jsp">注册</a>
						</c:if>
					</div>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<!-- 页面内容区域 -->
	<div class="row">
		<!-- 这里可以放页面的具体内容 -->
	</div>
</div>

<script type="text/javascript" src="<%=path %>/static/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="<%=path %>/static/js/bootstrap.bundle.min.js"></script>
</body>

</html>
