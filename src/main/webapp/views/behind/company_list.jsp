<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title>人才招聘</title>
	<link rel="stylesheet" href="<%=path%>/static/css/pintuer.css">
	<link rel="stylesheet" href="<%=path%>/static/css/admin.css">
	<script src="<%=path%>/static/js/jquery.js"></script>
	<script src="<%=path%>/static/js/pintuer.js"></script>
	<style>
		body {
			font-family: "Helvetica Neue", Arial, sans-serif;
			background-color: #f9f9f9;
			margin: 0;
			padding: 0;
		}
		.panel {
			background-color: #fff;
			border-radius: 8px;
			box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
			padding: 20px;
		}
		.panel-head {
			font-size: 20px;
			font-weight: bold;
			padding-bottom: 10px;
			border-bottom: 2px solid #ddd;
		}
		table {
			width: 100%;
			margin-top: 20px;
		}
		th, td {
			padding: 15px;
			text-align: center;
			border-bottom: 1px solid #e0e0e0;
		}
		th {
			background-color: #f4f4f4;
		}
		.button-group .button {
			background-color: #3498db;
			border-color: #3498db;
			color: #fff;
			padding: 10px 20px;
			border-radius: 4px;
			text-decoration: none;
			font-size: 14px;
		}
		.button-group .button:hover {
			background-color: #2980b9;
			border-color: #2980b9;
		}
		.pagelist a {
			padding: 8px 12px;
			margin: 0 5px;
			border-radius: 4px;
			text-decoration: none;
			background-color: #3498db;
			color: #fff;
		}
		.pagelist a:hover {
			background-color: #2980b9;
		}
		.pagelist a:disabled {
			background-color: #ccc;
		}
	</style>
</head>
<body>
<div class="panel admin-panel">
	<div class="panel-head"><strong class="icon-reorder"> 公司列表</strong></div>
	<div class="padding border-bottom"></div>
	<table class="table table-hover text-center">
		<tr>
			<th>ID</th>
			<th>公司名称</th>
			<th>公司Logo</th>
			<th>招聘人姓名</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${companyList}" var="item">
			<tr align="center">
				<td>${item.id}</td>
				<td>${item.companyName}</td>
				<td><img alt="" src="<%=path %>/pic/${item.companyLogo}" width="72px" height="72px" style="border-radius: 50%;"></td>
				<td>${item.companyUser}</td>
				<td>
					<div class="button-group">
						<a class="button border-main" href="<%=path %>/company/detail?id=${item.id}"><span class="icon-edit"></span> 详细信息</a>
					</div>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<div class="pagelist">
					<c:if test="${page.pageNumber==1 || page.totalPage==0 }">
						<a disabled>首页</a>
						<a disabled>上一页 </a>
					</c:if>
					<c:if test="${page.pageNumber!=1 && page.totalPage!=0 }">
						<a href="<%=path %>/company/list?pageNumber=1">首页</a>
						<a href="<%=path %>/company/list?pageNumber=${page.pageNumber-1 }">上一页 </a>
					</c:if>
					<c:if test="${page.pageNumber==page.totalPage || page.totalPage==0 }">
						<a disabled>下一页 </a>
						<a disabled>尾页 </a>
					</c:if>
					<c:if test="${page.pageNumber!=page.totalPage && page.totalPage!=0 }">
						<a href="<%=path %>/company/list?pageNumber=${page.pageNumber+1 }">下一页 </a>
						<a href="<%=path %>/company/list?pageNumber=${page.totalPage }">尾页</a>
					</c:if>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
