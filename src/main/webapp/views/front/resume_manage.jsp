<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<br />
	<div class="row">
		<jsp:include page="center_menu.jsp"></jsp:include>
		<div class="col-md-7">
			<h2>
			<c:if test="${sessionScope.user.userRole == 1 }">
				已投递简历列表
			</c:if>
			<c:if test="${sessionScope.user.userRole == 2 }">
				已收到简历列表
			</c:if>
			</h2>
			<hr>
			<table class="table table-bordered tb-hover">
				<thead>
					<tr>
						<th>公司名称</th>
						<th>职位名称</th>
						<th>求职者姓名</th>
						<th>简历名称</th>
						<th>状态</th>
						<th class="text-center">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${resumeList}" var="item">
						<tr>
							<td>${item.company.companyName}</td>
							<td>${item.job.jobName}</td>
							<td>${item.seeker.seekerName}</td>
							<td>${item.resumeName}</td>
							<td>
							<c:if test="${item.resumeStatus ==  1}">
								<span class="label label-danger">未查看</span>
							</c:if>
							<c:if test="${item.resumeStatus ==  2}">
								<span class="label label-success">已查看</span>
							</c:if>
							</td>
							<td class=" text-center">
								<c:if test="${sessionScope.user.userRole == 1 }">
									<a href="<%=path %>/deleteResume?id=${item.id}">删除</a>
								</c:if>
								<c:if test="${sessionScope.user.userRole == 2}">
									<a href="<%=path %>/resumeDetail?id=${item.id}">查看</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>

</html>