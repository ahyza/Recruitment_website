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
<title>python岗位招聘</title>
<link rel="stylesheet" href="<%=path%>/static/css/pintuer.css">
<link rel="stylesheet" href="<%=path%>/static/css/admin.css">
<script src="<%=path%>/static/js/jquery.js"></script>
</head>
<body style="background-color: #f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				<img src="<%=path%>/pic/logo.gif" class="radius-circle rotate-hover" height="50" alt="" />python相关岗位招牌系统
			</h1>
		</div>
		<div class="head-l">
			<a class="button button-little bg-red"
				href="<%=path%>/user/logout"><span class="icon-power-off"></span>退出登录</a>
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<h2>
			<span class="icon-user"></span>基本功能
		</h2>
		<ul style="display: block">
			<li><a href="<%=path%>/user/list" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
			<li><a href="<%=path%>/seeker/list" target="right"><span class="icon-caret-right"></span>求职者管理</a></li>
			<li><a href="<%=path%>/company/list" target="right"><span class="icon-caret-right"></span>招聘企业管理</a></li>
			<li><a href="<%=path%>/info/list" target="right"><span class="icon-caret-right"></span>求职信息管理</a></li>
			<li><a href="<%=path%>/user/data" target="right"><span class="icon-caret-right"></span>数据备份</a></li>
		</ul>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
		});
	</script>
	<ul class="bread">
		<li><a href="<%=path%>/views/behind/info.jsp" target="right" class="icon-home"> 首页</a></li>
		<li><a href="##" id="a_leader_txt">网站信息</a></li>
	</ul>
	<div class="admin">
		<iframe scrolling="auto" rameborder="0" src="<%=path %>/views/behind/info.jsp" name="right" width="100%" height="100%"></iframe>
	</div>
</body>
</html>