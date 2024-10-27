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
<div class="col-lg-8 offset-2">
	<div class="main-container" style="margin-top: 8px; margin-bottom: 8px;">
		<div class="bread-crumbs hidden-xs">
			<a href="../JobSys/index">首页</a> &gt;
			<a href="#">求职意向</a>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div>
						<form role="form" action="<%=path %>/infos" method="post">
							<div class="form-group">
								<input type="text" class="form-control" name="infoName" value="${infoName }" placeholder="搜索标题">
							</div>
							<button type="submit" class="btn btn-primary">搜索</button>
							<c:if test="${sessionScope.user.userRole == 2 }">
								<a href="<%=path %>/publishInfosPage" class="btn btn-info" style="float: right;">发布求职意向</a>
							</c:if>
						</form>
					</div>
					<br />
					<h4 class="card-title">求职列表</h4>
					<table class="table table-hover table-striped">
						<thead>
						<tr>
							<th width="20%">标题</th>
							<th>预期薪资</th>
							<th>预期工作地点</th>
							<th>内容</th>
							<th>发布时间</th>
							<th>发布人</th>
							<th>信息类型</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${infoList }" var="info">
							<tr>
								<td>${info.infoTitle }</td>
								<td>${info.expectedSalary }</td>
								<td>${info.expectedLocation }</td>
								<td>${info.infoContent }</td>
								<td>${info.infoTime }</td>
								<td>${info.user.userName }</td>
								<td>求职信息</td>
								<!-- 这里添加一个详细信息按钮 -->
								<c:if test="${sessionScope.user.userRole != 1}">
									<td>
										<div class="button-group">
											<a class="button border-main" href="<%=path %>/seeker/detail?seekerName=${info.user.userName}">
												<span class="icon-edit"></span> 详细信息
											</a>
										</div>
									</td>
								</c:if>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<ul class="pagination" style="float:right;">
						<c:if test="${page.pageNumber==1 || page.totalPage==0 }">
							<li class="page-item disabled">
								<a class="page-link" href="#">上一页</a>
							</li>
						</c:if>
						<c:if test="${page.pageNumber!=1 && page.totalPage!=0 }">
							<li class="page-item disabled">
								<a href="<%=path %>/infos?pageNumber=${page.pageNumber-1 }" class="page-link" href="#">上一页</a>
							</li>
						</c:if>
						<c:if test="${page.pageNumber!=page.totalPage && page.totalPage!=0 }">
							<li class="page-item">
								<a href="<%=path %>/infos?pageNumber=${page.pageNumber+1 }" class="page-link" href="#">下一页</a>
							</li>
						</c:if>
						<c:if test="${page.pageNumber==page.totalPage || page.totalPage==0 }">
							<li class="page-item disabled">
								<a class="page-link" href="#">下一页</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/swiper.min.js"></script>
</body>

</html>
