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
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>招聘企业详细信息</strong>
		</div>
		<div class="body-content">
			<div style="padding: 10px; font-size: 16px;margin-left: 20px">
				logo：<img alt="" src="<%=path %>/pic/${company.companyLogo}" width="100px" height="100px"><br>
				招聘人姓名：${company.companyUser } <br>
				公司类型：${company.companyType } <br>
				公司规模：${company.companyScale } <br>
				email：${company.companyEmail } <br>
				公司电话：${company.companyPhone} <br>
				联系人姓名：${company.companyManager } <br>
				联系人电话：${company.companyTel } <br>
				<br>
				地址：<br>
				${company.companyAddress }<br>
				公司介绍：<br>
				${company.companyDesc }<br>
				<a href="javascript:history.back(-1)" class="button border-main">返回</a>
			</div>
		</div>
	</div>

</body>
</html>