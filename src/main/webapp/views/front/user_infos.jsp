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
			<h2>我的求职意向</h2>
			<hr>
			<table class="table table-bordered tb-hover">
				<thead>
					<tr>
						<th>标题</th>
						<th>预期薪资</th>
						<th>预期工作地点</th>
						<th>内容</th>
						<th>发布时间</th>
						<th>信息类型</th>
						<th class="text-center">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${infoList}" var="item">
						<tr>
							<td>${item.infoTitle}</td>
							<td>${item.expectedSalary}</td>
							<td>${item.expectedLocation}</td>
							<td>${item.infoContent}</td>
							<td>${item.infoTime}</td>
							<td>求职信息</td>
							<td class=" text-center">
								<a href="<%=path %>/deleteInfos?info.id=${item.id}">删除</a>
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