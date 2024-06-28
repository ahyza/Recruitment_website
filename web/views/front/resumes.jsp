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
							<h2>招聘岗位分析</h2>
							<span class="dark-gray"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-3">
							<a href="<%=path %>/static/template2/template1.jpg">
							<div class="card">
								<div class="card-body text-center">
									<img class="bottom" src="<%=path %>/static/img2/template1.jpg" width="260px" height="380px"/>
									<p class="card-text dark-gray">全国python岗位分布</p>
								</div>
							</div>
							</a>
						</div>
						<div class="col-lg-3">
							<a href="<%=path %>/static/template2/template2.jpg">
							<div class="card">
								<div class="card-body text-center">
									<img class="bottom" src="<%=path %>/static/img2/template2.jpg" width="260px" height="380px"/>
									<p class="card-text dark-gray">互联网行业分析</p>
								</div>
							</div>
							</a>
						</div>
						<div class="col-lg-3">
							<a href="<%=path %>/static/template2/template3.jpg">
							<div class="card">
								<div class="card-body text-center">
									<img class="bottom" src="<%=path %>/static/img2/template3.jpg" width="260px" height="380px"/>
									<p class="card-text dark-gray">需求分析</p>
								</div>
							</div>
							</a>
						</div>
						<div class="col-lg-3">
							<a href="<%=path %>/static/template2/template4.jpg">
							<div class="card">
								<div class="card-body text-center">
									<img class="bottom" src="<%=path %>/static/img2/template4.jpg" width="260px" height="380px"/>
									
									<p class="card-text dark-gray">岗位增添</p>
								</div>
							</div>
							</a>
						</div>
						<div class="col-lg-3">
							<a href="<%=path %>/static/template2/template5.jpg">
							<div class="card">
								<div class="card-body text-center">
									<img class="bottom" src="<%=path %>/static/img2/template5.jpg" width="260px" height="380px"/>
									
									<p class="card-text dark-gray">学历要求分析</p>
								</div>
							</div>
							</a>
						</div>
								<div class="col-lg-3">
							<a href="<%=path %>/static/template2/template6.jpg">
							<div class="card">
								<div class="card-body text-center">
									<img class="bottom" src="<%=path %>/static/img2/template6.jpg" width="260px" height="380px"/>
									
									<p class="card-text dark-gray">公司类型分析</p>
								</div>
							</div>
							</a>
						</div>
								<div class="col-lg-3">
							<a href="<%=path %>/static/template2/template7.jpg">
							<div class="card">
								<div class="card-body text-center">
									<img class="bottom" src="<%=path %>/static/img2/template7.jpg" width="260px" height="380px"/>
									
									<p class="card-text dark-gray">各地工资分布</p>
								</div>
							</div>
							</a>
						</div>
								<div class="col-lg-3">
							<a href="<%=path %>/static/template2/template8.jpg">
							<div class="card">
								<div class="card-body text-center">
									<img class="bottom" src="<%=path %>/static/img2/template8.jpg" width="260px" height="380px"/>
									
									<p class="card-text dark-gray">工作经验要求</p>
								</div>
							</div>
							</a>
						</div>
					</div>
					<!--<div class="row top">
						<a class="btn btn-primary center" href="#">更多大数据分析</a>
					</div>-->
				</div>
			</div>
			
		</div>
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/swiper.min.js"></script>
	</body>
</html>