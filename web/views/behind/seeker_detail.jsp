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
<title>python相关岗位招聘系统</title>
<link rel="stylesheet" href="<%=path%>/static/css/pintuer.css">
<link rel="stylesheet" href="<%=path%>/static/css/admin.css">
<script src="<%=path%>/static/js/jquery.js"></script>
<script src="<%=path%>/static/js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>求职者详细信息</strong>
		</div>
		<div class="body-content">
			<div style="padding: 10px; font-size: 16px; margin-left: 20px">
				照片：<img alt="" src="<%=path %>/pic/${seeker.seekerImag}" width="100px" height="100px"><br>
				姓名：${seeker.seekerName } &nbsp;&nbsp;&nbsp; 性别：${seeker.seekerGender }<br>
				生日：${seeker.seekerBirth } &nbsp;&nbsp;&nbsp; 是否结婚：${seeker.seekerMarry }<br>
				学历：${seeker.seekerEducation } &nbsp;&nbsp;&nbsp; email：${seeker.seekerEmail }<br>
				户籍：${seeker.seekerHj } &nbsp;&nbsp;&nbsp; 期望薪资：${seeker.seekerQwxz}<br>
				期望工作类型：${seeker.seekerQwgzlx} &nbsp;&nbsp;&nbsp; 外语等级：${seeker.seekerWydj }<br>
				是否在职：${seeker.seekerOnjob } &nbsp;&nbsp;&nbsp; 所在城市：${seeker.seekerAddress }<br>
				暂住地：${seeker.seekerZzd } &nbsp;&nbsp;&nbsp; 期望工作地点：${seeker.seekerQwgzdd}<br>
				简历名称：${seeker.seekerResume }
				<br>
				自我评价：<br>
				${seeker.seekerEvaluation }<br>
				得奖情况：<br>
				${seeker.seekerReward }<br>
				工作经历：<br>
				${seeker.seekerGzjl }<br>
				项目经验：<br>
				${seeker.seekerXmjy }<br>
				<a href="javascript:history.back(-1)" class="button border-main">返回</a>
			</div>
		</div>
	</div>

</body>
</html>