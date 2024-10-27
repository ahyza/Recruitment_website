<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>人才招聘</title>
<link rel="stylesheet" href="<%=path%>/static/css/pintuer.css">
<link rel="stylesheet" href="<%=path%>/static/css/admin.css">
<script src="<%=path%>/static/js/jquery.js"></script>
<script src="<%=path%>/static/js/pintuer.js"></script>
<script type="text/javascript">
	if ("${mes}" != "") {
		alert("${mes}")
	}
</script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 用户列表</strong>
		</div>
		<div class="padding border-bottom">
			<ul class="search" style="padding-left: 10px;">
				<li><a class="button border-main icon-plus-square-o"
					href="<%=path%>/user/add"> 添加</a></li>
			</ul>
		</div>
		<table class="table table-hover text-center">
			<tr>
				<th>id</th>
				<th>用户名</th>
				<th>密码</th>
				<th>角色</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${userList}" var="item">
				<tr align="center">
					<td>${item.id}</td>
					<td>${item.userName}</td>
					<td>${item.userPass}</td>
					<td><c:if test="${item.userRole == 1}">
						求职者
					</c:if> <c:if test="${item.userRole == 2}">
						招聘者
					</c:if> <c:if test="${item.userRole == 3}">
						管理员
					</c:if></td>
					<td>
						<div class="button-group">
							<a class="button border-main" href="<%=path %>/user/update?id=${item.id}"><span
								class="icon-edit"></span> 修改</a>
						</div>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8">
					<div class="pagelist">
						<c:if test="${page.pageNumber==1 || page.totalPage==0 }">
							<a>首页</a>
							<a>上一页 </a>
						</c:if>
						<c:if test="${page.pageNumber!=1 && page.totalPage!=0 }">
							<a href="<%=path%>/user/list?pageNumber=1">首页</a>
							<a
								href="<%=path %>/user/list?pageNumber=${page.pageNumber-1 }">上一页
							</a>
						</c:if>
						<c:if
							test="${page.pageNumber==page.totalPage || page.totalPage==0 }">
							<a>下一页 </a>
							<a>尾页 </a>
						</c:if>
						<c:if
							test="${page.pageNumber!=page.totalPage && page.totalPage!=0 }">
							<a
								href="<%=path %>/user/list?pageNumber=${page.pageNumber+1 }">下一页
							</a>
							<a
								href="<%=path %>/user/list?pageNumber=${page.totalPage }">尾页</a>
						</c:if>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>