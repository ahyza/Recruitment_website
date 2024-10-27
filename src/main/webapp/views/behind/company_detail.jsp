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
	<title>人才招聘 - 企业详细信息</title>
	<link rel="stylesheet" href="<%=path%>/static/css/pintuer.css">
	<link rel="stylesheet" href="<%=path%>/static/css/admin.css">
	<script src="<%=path%>/static/js/jquery.js"></script>
	<script src="<%=path%>/static/js/pintuer.js"></script>

	<style>
		body {
			background-color: #f7f8fa;
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			margin: 0;
			padding: 0;
		}
		.container {
			max-width: 900px;
			margin: 40px auto;
			background-color: #fff;
			border-radius: 10px;
			box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
			padding: 30px;
			box-sizing: border-box;
		}
		.header {
			background-color: #007BFF;
			color: white;
			text-align: center;
			padding: 15px;
			border-radius: 10px 10px 0 0;
			font-size: 1.8em;
			font-weight: bold;
		}
		.content {
			padding: 20px 0;
			font-size: 1.1em;
			display: grid;
			grid-template-columns: 1fr 2fr;
			grid-gap: 30px;
		}
		.content img {
			max-width: 150px;
			border-radius: 10px;
			border: 4px solid #eaeaea;
			box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		}
		.info-grid {
			display: grid;
			grid-template-columns: 1fr 2fr;
			grid-gap: 10px;
		}
		.info-label {
			font-weight: bold;
			color: #555;
			text-align: right;
			padding-right: 10px;
		}
		.info-value {
			color: #333;
		}
		.info-row {
			padding: 10px 0;
			border-bottom: 1px solid #eaeaea;
		}
		.button {
			background-color: #007BFF;
			color: white;
			padding: 12px 25px;
			border: none;
			border-radius: 5px;
			text-decoration: none;
			font-size: 1.1em;
			margin-top: 20px;
			display: inline-block;
			text-align: center;
		}
		.button:hover {
			background-color: #0056b3;
		}
		.button-container {
			text-align: center;
			margin-top: 20px;
		}
	</style>
</head>

<body>
<div class="container">
	<div class="header">
		招聘企业详细信息
	</div>
	<div class="content">
		<div>
			<img alt="公司Logo" src="<%=path %>/pic/${company.companyLogo}" />
		</div>
		<div class="info-grid">
			<div class="info-row">
				<span class="info-label">招聘人姓名：</span>
				<span class="info-value">${company.companyUser}</span>
			</div>
			<div class="info-row">
				<span class="info-label">公司类型：</span>
				<span class="info-value">${company.companyType}</span>
			</div>
			<div class="info-row">
				<span class="info-label">公司规模：</span>
				<span class="info-value">${company.companyScale}</span>
			</div>
			<div class="info-row">
				<span class="info-label">Email：</span>
				<span class="info-value">${company.companyEmail}</span>
			</div>
			<div class="info-row">
				<span class="info-label">公司电话：</span>
				<span class="info-value">${company.companyPhone}</span>
			</div>
			<div class="info-row">
				<span class="info-label">联系人姓名：</span>
				<span class="info-value">${company.companyManager}</span>
			</div>
			<div class="info-row">
				<span class="info-label">联系人电话：</span>
				<span class="info-value">${company.companyTel}</span>
			</div>
			<div class="info-row">
				<span class="info-label">地址：</span>
				<span class="info-value">${company.companyAddress}</span>
			</div>
			<div class="info-row">
				<span class="info-label">公司介绍：</span>
				<span class="info-value">${company.companyDesc}</span>
			</div>
		</div>
	</div>
	<div class="button-container">
		<a href="javascript:history.back(-1)" class="button">返回</a>
	</div>
</div>
</body>
</html>
