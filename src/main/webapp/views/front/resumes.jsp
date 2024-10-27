<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>招聘岗位分析</title>
	<link rel="stylesheet" href="<%=path%>/static/css/bootstrap.min.css">
	<style>
		body {
			background-color: #f4f7f6;
			font-family: 'Arial', sans-serif;
		}

		.container {
			margin-top: 50px;
		}

		.card {
			border: none;
			border-radius: 10px;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			transition: all 0.3s ease-in-out;
		}

		.card:hover {
			transform: translateY(-5px);
			box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
		}

		.card-body img {
			border-radius: 10px;
			width: 100%;
			height: auto;
		}

		.card-text-container {
			margin-top: 10px;
		}

		.card-text {
			font-size: 14px;
			font-weight: 600;
			color: #333;
		}

		.download-text {
			font-size: 14px;
			color: #010203;
			text-decoration: none;
			margin-left: 10px;
		}

		.download-text:hover {
			text-decoration: underline;
		}

		.section-title {
			font-size: 32px;
			font-weight: 700;
			color: #333;
			text-align: center;
			margin-bottom: 40px;
		}

		.row {
			justify-content: center;
			margin-bottom: 30px;
		}

		@media (max-width: 768px) {
			.card-text {
				font-size: 16px;
			}
		}
	</style>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<h2 class="section-title">招聘岗位分析</h2>

	<div class="row">
		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/static/template3/template1.jpg">
				<div class="card">
					<div class="card-body text-center">
						<img src="<%=path %>/static/img3/template1.jpg" alt="单页个人简历通用求职模板" />
						<div class="card-text-container">
							<p class="card-text">单页个人简历通用求职模板</p>
							<a href="<%=path %>/static/template3/template1.docx" class="download-text">
								<img src="<%=path %>/static/img4/download-icon.png" alt="下载" style="width: 20px; height: 20px; vertical-align: middle;" />

							</a>
						</div>
					</div>
				</div>
			</a>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/static/template3/template2.jpg">
				<div class="card">
					<div class="card-body text-center">
						<img src="<%=path %>/static/img3/template2.jpg" alt="个人简历通用单页模板" />
						<div class="card-text-container">
							<p class="card-text">个人简历通用单页模板</p>
							<a href="<%=path %>/static/template3/template2.docx" class="download-text">
								<img src="<%=path %>/static/img4/download-icon.png" alt="下载" style="width: 20px; height: 20px; vertical-align: middle;" />

							</a>
						</div>
					</div>
				</div>
			</a>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/static/template3/template3.jpg">
				<div class="card">
					<div class="card-body text-center">
						<img src="<%=path %>/static/img3/template3.jpg" alt="个人简历单页求职模板" />
						<div class="card-text-container">
							<p class="card-text">个人简历单页求职模板</p>
							<a href="<%=path %>/static/template3/template3.docx" class="download-text">
								<img src="<%=path %>/static/img4/download-icon.png" alt="下载" style="width: 20px; height: 20px; vertical-align: middle;" />
							</a>
						</div>
					</div>
				</div>
			</a>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/static/template3/template4.jpg">
				<div class="card">
					<div class="card-body text-center">
						<img src="<%=path %>/static/img3/template4.jpg" alt="个人简历模板" />
						<div class="card-text-container">
							<p class="card-text">个人简历模板</p>
							<a href="<%=path %>/static/template3/template4.docx" class="download-text">
								<img src="<%=path %>/static/img4/download-icon.png" alt="下载" style="width: 20px; height: 20px; vertical-align: middle;" />
							</a>
						</div>
					</div>
				</div>
			</a>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/static/template3/template5.jpg">
				<div class="card">
					<div class="card-body text-center">
						<img src="<%=path %>/static/img3/template5.jpg" alt="个人简历应届生求职模板" />
						<div class="card-text-container">
							<p class="card-text">个人简历应届生求职模板</p>
							<a href="<%=path %>/static/template3/template5.docx" class="download-text">
								<img src="<%=path %>/static/img4/download-icon.png" alt="下载" style="width: 20px; height: 20px; vertical-align: middle;" />
							</a>
						</div>
					</div>
				</div>
			</a>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/static/template3/template6.jpg">
				<div class="card">
					<div class="card-body text-center">
						<img src="<%=path %>/static/img3/template6.jpg" alt="应届生求职个人简历模板" />
						<div class="card-text-container">
							<p class="card-text">应届生求职个人简历模板</p>
							<a href="<%=path %>/static/template3/template6.docx" class="download-text">
								<img src="<%=path %>/static/img4/download-icon.png" alt="下载" style="width: 20px; height: 20px; vertical-align: middle;" />
							</a>
						</div>
					</div>
				</div>
			</a>
		</div>

		<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
			<a href="<%=path %>/static/template3/template7.jpg">
				<div class="card">
					<div class="card-body text-center">
						<img src="<%=path %>/static/img3/template7.jpg" alt="个人简历应届生求职模板" />
						<div class="card-text-container">
							<p class="card-text">个人简历应届生求职模板</p>
							<a href="<%=path %>/static/template3/template7.docx" class="download-text">
								<img src="<%=path %>/static/img4/download-icon.png" alt="下载" style="width: 20px; height: 20px; vertical-align: middle;" />
							</a>
						</div>
					</div>
			</a>
		</div>
	</div>

	<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
		<a href="<%=path %>/static/template3/template8.jpg">
			<div class="card">
				<div class="card-body text-center">
					<img src="<%=path %>/static/img3/template8.jpg" alt="个人简历应届生求职模板" />
					<div class="card-text-container">
						<p class="card-text">个人简历应届生求职模板</p>
						<a href="<%=path %>/static/template3/template8.docx" class="download-text">
							<img src="<%=path %>/static/img4/download-icon.png" alt="下载" style="width: 20px; height: 20px; vertical-align: middle;" />
						</a>
					</div>
				</div>
			</div>
		</a>
	</div>
</div>
</div>
</body>
</html>
