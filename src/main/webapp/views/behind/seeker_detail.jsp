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
	<title>求职者详细信息</title>
	<link rel="stylesheet" href="<%=path%>/static/css/pintuer.css">
	<link rel="stylesheet" href="<%=path%>/static/css/admin.css">
	<script src="<%=path%>/static/js/jquery.js"></script>
	<script src="<%=path%>/static/js/pintuer.js"></script>

	<style>
		body {
			background-color: #f5f5f5;
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			margin: 0;
			padding: 0;
		}
		.container {
			max-width: 900px;
			margin: 40px auto;
			background-color: #ffffff;
			border-radius: 12px;
			box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
			padding: 30px;
			box-sizing: border-box;
		}
		.header {
			background-color: #007BFF;
			color: white;
			text-align: center;
			padding: 15px 0;
			border-radius: 12px 12px 0 0;
			font-size: 1.5em;
			font-weight: bold;
		}
		.content {
			display: grid;
			grid-template-columns: 1fr 2fr;
			grid-gap: 20px;
			padding: 20px 0;
			font-size: 1.1em;
		}
		.content img {
			max-width: 150px;
			border-radius: 50%;
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
		求职者详细信息
	</div>
	<div class="content">
		<div>
			<img alt="求职者照片" src="<%=path %>/pic/${seeker.seekerImag}">
		</div>
		<div class="info-grid">
			<div class="info-row">
				<span class="info-label">姓名：</span>
				<span class="info-value">${seeker.seekerName}</span>
			</div>
			<div class="info-row">
				<span class="info-label">性别：</span>
				<span class="info-value">${seeker.seekerGender}</span>
			</div>
			<div class="info-row">
				<span class="info-label">生日：</span>
				<span class="info-value">${seeker.seekerBirth}</span>
			</div>
			<div class="info-row">
				<span class="info-label">婚姻状态：</span>
				<span class="info-value">${seeker.seekerMarry}</span>
			</div>
			<div class="info-row">
				<span class="info-label">学历：</span>
				<span class="info-value">${seeker.seekerEducation}</span>
			</div>
			<div class="info-row">
				<span class="info-label">Email：</span>
				<span class="info-value">${seeker.seekerEmail}</span>
			</div>
			<div class="info-row">
				<span class="info-label">户籍：</span>
				<span class="info-value">${seeker.seekerHj}</span>
			</div>
			<div class="info-row">
				<span class="info-label">期望薪资：</span>
				<span class="info-value">${seeker.seekerQwxz}</span>
			</div>
			<div class="info-row">
				<span class="info-label">期望工作类型：</span>
				<span class="info-value">${seeker.seekerQwgzlx}</span>
			</div>
			<div class="info-row">
				<span class="info-label">外语等级：</span>
				<span class="info-value">${seeker.seekerWydj}</span>
			</div>
			<div class="info-row">
				<span class="info-label">是否在职：</span>
				<span class="info-value">${seeker.seekerOnjob}</span>
			</div>
			<div class="info-row">
				<span class="info-label">所在城市：</span>
				<span class="info-value">${seeker.seekerAddress}</span>
			</div>
			<div class="info-row">
				<span class="info-label">暂住地：</span>
				<span class="info-value">${seeker.seekerZzd}</span>
			</div>
			<div class="info-row">
				<span class="info-label">期望工作地点：</span>
				<span class="info-value">${seeker.seekerQwgzdd}</span>
			</div>
			<div class="info-row">
				<span class="info-label">简历名称：</span>
				<span class="info-value">${seeker.seekerResume}</span>
			</div>
			<div class="info-row">
				<span class="info-label">自我评价：</span>
				<span class="info-value">${seeker.seekerEvaluation}</span>
			</div>
			<div class="info-row">
				<span class="info-label">得奖情况：</span>
				<span class="info-value">${seeker.seekerReward}</span>
			</div>
			<div class="info-row">
				<span class="info-label">工作经历：</span>
				<span class="info-value">${seeker.seekerGzjl}</span>
			</div>
			<div class="info-row">
				<span class="info-label">项目经验：</span>
				<span class="info-value">${seeker.seekerXmjy}</span>
			</div>
		</div>
	</div>
	<div class="button-container">
		<a href="javascript:history.back(-1)" class="button">返回</a>
	</div>
</div>
</body>
</html>
