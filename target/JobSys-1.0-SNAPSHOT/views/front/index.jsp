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
	</head>

	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<br />
		<div class="bs-docs-section">

			<div class="row">
				<div class="col-lg-10 offset-1">
					<div class="row top bottom">
						<div class="col-lg-12 text-center">
							<h2>python岗位专门招聘</h2>
							<span>一个只致力于python岗位招聘的系统，为你提供最精细的匹配</span>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-3">
							<a href="<%=path %>/searchJobByType?jobType=1" class="card-link center">
								<div class="card">
									<div class="card-body text-center">
										<img class="bottom" src="<%=path %>/static/img/1.png" width="64px" height="64px" />
										<h4 class="card-title">python开发</h4>
										<p class="card-text dark-gray"></p>
									</div>
								</div>
							</a>
						</div>
						<div class="col-lg-3">
							<a href="<%=path %>/searchJobByType?jobType=2" class="card-link center">
								<div class="card">
									<div class="card-body text-center">
										<img class="bottom" src="<%=path %>/static/img/2.png" width="64px" height="64px" />
										<h4 class="card-title">python运维</h4>
										<p class="card-text dark-gray"></p>
									</div>
								</div>
							</a>
						</div>
						<div class="col-lg-3">
							<a href="<%=path %>/searchJobByType?jobType=3" class="card-link center">
								<div class="card">
									<div class="card-body text-center">
										<img class="bottom" src="<%=path %>/static/img/3.png" width="64px" height="64px" />
										<h4 class="card-title">爬虫</h4>
										<p class="card-text dark-gray"></p>
									</div>
								</div>
							</a>
						</div>
						<div class="col-lg-3">
							<a href="<%=path %>/searchJobByType?jobType=4" class="card-link center">
								<div class="card">
									<div class="card-body text-center">
										<img class="bottom" src="<%=path %>/static/img/4.png" width="64px" height="64px" />
										<h4 class="card-title">python工程师</h4>
										<p class="card-text dark-gray"></p>
									</div>
								</div>
							</a>
						</div>
					</div>
					<br />
					<div class="row">
						<div class="col-lg-3">
							<a href="<%=path %>/searchJobByType?jobType=5" class="card-link center">
								<div class="card">
									<div class="card-body text-center">
										<img class="bottom" src="<%=path %>/static/img/5.png" width="64px" height="64px" />
										<h4 class="card-title">python讲师</h4>
										<p class="card-text dark-gray"></p>
									</div>
								</div>
							</a>
						</div>
						<div class="col-lg-3">
							<a href="<%=path %>/searchJobByType?jobType=6" class="card-link center">
								<div class="card">
									<div class="card-body text-center">
										<img class="bottom" src="<%=path %>/static/img/6.png" width="64px" height="64px" />
										<h4 class="card-title">python脚本工程师</h4>
										<p class="card-text dark-gray"></p>
									</div>
								</div>
							</a>
						</div>
						<div class="col-lg-3">
							<a href="<%=path %>/searchJobByType?jobType=7" class="card-link center">
								<div class="card">
									<div class="card-body text-center">
										<img class="bottom" src="<%=path %>/static/img/7.png" width="64px" height="64px" />
										<h4 class="card-title">python数据分析师</h4>
										<p class="card-text dark-gray"></p>
									</div>
								</div>
							</a>
						</div>
						<div class="col-lg-3">
							<a href="<%=path %>/searchJobByType?jobType=8" class="card-link center">
								<div class="card">
									<div class="card-body text-center">
										<img class="bottom" src="<%=path %>/static/img/8.png" width="64px" height="64px" />
										<h4 class="card-title">python算法工程师</h4>
										<p class="card-text dark-gray"></p>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="row top">
						<a class="btn btn-primary center" href="<%=path %>/recruitment">更多职位</a>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/swiper.min.js"></script>
	</body>

</html>