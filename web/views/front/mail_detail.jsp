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
<meta charset="utf-8" />
<title></title>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="col-lg-8 offset-2">
		<div class="main-container"
			style="margin-top: 8px; margin-bottom: 8px;">
			<div class="bread-crumbs hidden-xs">
				<a href="#">首页</a> &gt; <a href="#">信箱</a> &gt; <a href="#">查看内容</a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="text-align: center;">
				<div style="padding: 8px">
				<strong>标题：</strong>${letter.letterTitle }<br><br>
				<strong>内容：</strong>${letter.letterContent }<br><br>
				<strong>发送人：</strong>${letter.send.userName }<br><br>
				</div>
				<a href="<%=path %>/mail" class="btn btn-info">返回</a>
				<a href="<%=path %>/replyMsg?letterReceive=${letter.letterSend}" class="btn btn-success">回复</a>
				
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>

</html>