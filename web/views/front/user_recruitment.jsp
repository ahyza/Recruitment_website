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
			<h2>我的招聘信息</h2>
			<hr>
			<table class="table table-bordered tb-hover">
				<thead>
					<tr>
						<th>职位名称</th>
						<th>招聘人数</th>
						<th>薪资</th>
						<th>起始时间</th>
						<th>截止时间</th>
						<th>职位状态</th>
						<th class="text-center">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${jobList}" var="job">
						<tr>
							<td>${job.jobName}</td>
							<td>${job.jobNum}</td>
							<td>${job.jobSalary}</td>
							<td>${job.jobStart}</td>
							<td>${job.jobEnd}</td>
							<td>
							<c:if test="${job.jobStatus == 1}">
								招聘中
							</c:if>
							<c:if test="${job.jobStatus == 2}">
								已结束
							</c:if>
							</td>
							<td class=" text-center">
								<c:if test="${job.jobStatus == 1}">
									<a href="<%=path %>/finishJob?id=${job.id}">结束</a>
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