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
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Python 岗位专门招聘</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
	<style>
		/* 主体样式 */
		body {
			font-family: Arial, sans-serif;
			background-color: #f8f9fa;
		}

		h2 {
			font-size: 2.5rem;
			margin-bottom: 10px;
		}



		.card:hover {
			transform: scale(1.05);
		}

		.card-body img {
			margin-bottom: 15px;
		}

		.card-title {
			font-size: 1.25rem;
			margin-bottom: 10px;
		}

		.center {
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.btn-primary {
			padding: 10px 20px;
			font-size: 1rem;
		}

		.top {
			margin-top: 30px;
		}

		/* 优化布局 */
		.row {
			margin-bottom: 30px;
		}
		body {
			font-family: Arial, sans-serif;
			background: linear-gradient(to right, #a1c4fd 0%, #c2e9fb 100%); /* 渐变色背景 */
			margin: 0;
			padding: 0;
			min-height: 100vh;
			display: flex;
			flex-direction: column;
		}
		.no-margin {
			margin-top: 0 !important;
		}
		/* 缩小卡片的外边距 */

		.card {
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			border: none;
			margin-bottom: 10px;
			transition: transform 0.2s ease-in-out;
			border-radius: 30px; /* 增加圆角 */
		}

		.row {
			margin-bottom: 5px;
		}

	</style>
</head>

<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="container text-center no-margin">
	<div class="row top">
		<div class="col-lg-12">
			<h2>Python 岗位专门招聘</h2>
			<p>一个专注于 Python 岗位招聘的系统，提供精确匹配</p>
		</div>
	</div>

	<div class="row">
		<!-- 每个岗位类型的卡片 -->
		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/searchJobByType?jobType=1" class="card-link">
				<div class="card h-100 text-center">
					<div class="card-body">
						<img src="<%=path %>/static/img/1.png" width="64px" height="64px" alt="python开发">
						<h4 class="card-title">Python 开发</h4>
					</div>
				</div>
			</a>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/searchJobByType?jobType=2" class="card-link">
				<div class="card h-100 text-center">
					<div class="card-body">
						<img src="<%=path %>/static/img/2.png" width="64px" height="64px" alt="python运维">
						<h4 class="card-title">Python 运维</h4>
					</div>
				</div>
			</a>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/searchJobByType?jobType=3" class="card-link">
				<div class="card h-100 text-center">
					<div class="card-body">
						<img src="<%=path %>/static/img/3.png" width="64px" height="64px" alt="爬虫">
						<h4 class="card-title">爬虫</h4>
					</div>
				</div>
			</a>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/searchJobByType?jobType=4" class="card-link">
				<div class="card h-100 text-center">
					<div class="card-body">
						<img src="<%=path %>/static/img/4.png" width="64px" height="64px" alt="python工程师">
						<h4 class="card-title">Python 工程师</h4>
					</div>
				</div>
			</a>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/searchJobByType?jobType=5" class="card-link">
				<div class="card h-100 text-center">
					<div class="card-body">
						<img src="<%=path %>/static/img/5.png" width="64px" height="64px" alt="python讲师">
						<h4 class="card-title">Python 讲师</h4>
					</div>
				</div>
			</a>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/searchJobByType?jobType=6" class="card-link">
				<div class="card h-100 text-center">
					<div class="card-body">
						<img src="<%=path %>/static/img/6.png" width="64px" height="64px" alt="python脚本工程师">
						<h4 class="card-title">Python 脚本工程师</h4>
					</div>
				</div>
			</a>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/searchJobByType?jobType=7" class="card-link">
				<div class="card h-100 text-center">
					<div class="card-body">
						<img src="<%=path %>/static/img/7.png" width="64px" height="64px" alt="python数据分析师">
						<h4 class="card-title">Python 数据分析师</h4>
					</div>
				</div>
			</a>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/searchJobByType?jobType=8" class="card-link">
				<div class="card h-100 text-center">
					<div class="card-body">
						<img src="<%=path %>/static/img/8.png" width="64px" height="64px" alt="python算法工程师">
						<h4 class="card-title">Python 算法工程师</h4>
					</div>
				</div>
			</a>
		</div>
	</div>

	<!-- 更多职位按钮 -->
	<div class="row top no-margin">
		<div class="col-lg-12">
			<a class="btn btn-primary center" href="<%=path %>/recruitment">更多职位</a>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
