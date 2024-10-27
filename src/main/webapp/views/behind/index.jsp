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
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="renderer" content="webkit">
	<title>Python岗位招聘管理系统</title>
	<link rel="stylesheet" href="<%=path%>/static/css/pintuer.css">
	<link rel="stylesheet" href="<%=path%>/static/css/admin.css">
	<script src="<%=path%>/static/js/jquery.js"></script>

	<style>
		body {
			background-color: #f2f9fd;
			margin: 0;
			padding: 0;
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		}
		.header {
			background-color: #007BFF;
			color: white;
			padding: 20px;
			text-align: center;
			display: flex;
			justify-content: space-between;
			align-items: center;
			box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		}
		.header .logo h1 {
			margin: 0;
			font-size: 1.8em;
			display: flex;
			align-items: center;
		}
		.header .logo img {
			margin-right: 15px;
			border-radius: 50%;
		}
		.header .head-l {
			margin-right: 20px;
		}
		.leftnav {
			width: 220px;
			background-color: #f8f9fa;
			height: 100vh;
			position: fixed;
			top: 70px;
			left: 0;
			box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
			padding-top: 20px;
		}
		.leftnav-title {
			font-size: 1.1em;
			font-weight: bold;
			padding: 15px 20px;
			color: #030303;
			border-bottom: 2px solid #eaeaea;
		}
		.leftnav h2 {
			font-size: 1em;
			color: #007BFF;
			padding: 10px 20px;
			cursor: pointer;
			margin: 0;
			border-bottom: 1px solid #eaeaea;
			background-color: #e9ecef;
		}
		.leftnav ul {
			list-style: none;
			padding-left: 0;
			margin: 0;
		}
		.leftnav ul li {
			border-bottom: 1px solid #eaeaea;
		}
		.leftnav ul li a {
			display: block;
			padding: 10px 20px;
			font-size: 0.95em;
			text-decoration: none;
			color: #333;
		}
		.leftnav ul li a:hover, .leftnav ul li a.on {
			background-color: #007BFF;
			color: white;
		}
		.bread {
			margin-left: 240px;
			padding: 15px 0;
			background-color: #f8f9fa;
			padding-left: 20px;
			font-size: 1.05em;
			display: flex;
			align-items: center;
		}
		.bread li {
			list-style: none;
			margin-right: 10px;
		}
		.bread li a {
			text-decoration: none;
			color: #007BFF;
			padding: 5px;
			transition: all 0.2s ease-in-out;
		}
		.bread li a:hover {
			color: #0056b3;
		}
		.admin {
			margin-left: 240px;
			padding: 20px;
			height: calc(100vh - 70px);
			background-color: #fff;
		}
		iframe {
			border: none;
			width: 100%;
			height: 100%;
		}
	</style>
</head>
<body>
<div class="header">
	<div class="logo">
		<h1>
			<img src="<%=path%>/pic/logo.gif" height="50" alt="logo"> Python相关岗位招聘系统
		</h1>
	</div>
	<div class="head-l">
		<a class="button button-little bg-red" href="<%=path%>/index.jsp">
			<span class="icon-power-off"></span> 退出登录
		</a>
	</div>
</div>

<div class="leftnav">
	<div class="leftnav-title" style="text-align: left; font-size: 1.5em; padding-left: 20px; padding: 0px 20px;">
		<strong><span class="icon-list"></span> 菜单列表</strong>
	</div>

	<h2><span class="icon-user"></span> 基本功能</h2>
	<ul style="display: block;"> <!-- 确保ul默认展开显示 -->
		<li><a href="<%=path%>/user/list" target="right"><span class="icon-caret-right"></span> 用户管理</a></li>
		<li><a href="<%=path%>/seeker/list" target="right"><span class="icon-caret-right"></span> 求职者管理</a></li>
		<li><a href="<%=path%>/company/list" target="right"><span class="icon-caret-right"></span> 招聘企业管理</a></li>
		<li><a href="<%=path%>/info/list" target="right"><span class="icon-caret-right"></span> 求职信息管理</a></li>
		<li><a href="<%=path%>/user/data" target="right"><span class="icon-caret-right"></span> 数据备份</a></li>
	</ul>
</div>

<script type="text/javascript">
	$(function() {
		$(".leftnav h2").click(function() {
			$(this).next().slideToggle(200);
			$(this).toggleClass("on");
		});
		$(".leftnav ul li a").click(function() {
			$("#a_leader_txt").text($(this).text());
			$(".leftnav ul li a").removeClass("on");
			$(this).addClass("on");
		});
	});
</script>

<ul class="bread">
	<li><a href="<%=path%>/views/behind/info.jsp" target="right" class="icon-home"> 首页</a></li>
	<li><a href="##" id="a_leader_txt">网站信息</a></li>
</ul>

<div class="admin">
	<iframe scrolling="auto" src="<%=path %>/views/behind/info.jsp" name="right"></iframe>
</div>
</body>
</html>
