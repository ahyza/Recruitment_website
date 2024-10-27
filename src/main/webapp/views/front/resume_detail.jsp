<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
	<meta charset="UTF-8">
	<title>简历详情</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=path %>css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path %>css/style.css" rel="stylesheet">
	<style>
		body {
			font-family: 'Arial', sans-serif;
			background-color: #f8f9fa;
		}
		.container {
			background-color: #ffffff;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			border-radius: 8px;
			padding: 20px;
			margin-top: 30px;
		}
		h2 {
			color: #007bff;
			font-weight: bold;
		}
		.resume-item {
			margin-bottom: 10px;
			line-height: 1.8;
		}
		.resume-item label {
			font-weight: bold;
			color: #333;
		}
		.resume-photo img {
			border-radius: 5px;
		}
		.btn-back {
			margin-top: 20px;
		}
	</style>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
	<h2 class="text-center">简历详情</h2>
	<hr>
	<div class="row">
		<div class="col-md-4 text-center resume-photo">
			照片：<img alt="简历照片" src="<%=path %>/${resume.seeker.seekerImag}" width="120px" height="160px">
		</div>
		<div class="col-md-8">
			<div class="resume-item"><label>姓名：</label>${resume.seeker.seekerName } &nbsp;&nbsp;&nbsp; <label>性别：</label>${resume.seeker.seekerGender }</div>
			<div class="resume-item"><label>生日：</label>${resume.seeker.seekerBirth } &nbsp;&nbsp;&nbsp; <label>是否结婚：</label>${resume.seeker.seekerMarry }</div>
			<div class="resume-item"><label>学历：</label>${resume.seeker.seekerEducation } &nbsp;&nbsp;&nbsp; <label>Email：</label>${resume.seeker.seekerEmail }</div>
			<div class="resume-item"><label>户籍：</label>${resume.seeker.seekerHj } &nbsp;&nbsp;&nbsp; <label>期望薪资：</label>${resume.seeker.seekerQwxz}</div>
			<div class="resume-item"><label>期望工作类型：</label>${resume.seeker.seekerQwgzlx} &nbsp;&nbsp;&nbsp; <label>外语等级：</label>${resume.seeker.seekerWydj }</div>
			<div class="resume-item"><label>是否在职：</label>${resume.seeker.seekerOnjob } &nbsp;&nbsp;&nbsp; <label>所在城市：</label>${resume.seeker.seekerAddress }</div>
			<div class="resume-item"><label>暂住地：</label>${resume.seeker.seekerZzd } &nbsp;&nbsp;&nbsp; <label>期望工作地点：</label>${resume.seeker.seekerQwgzdd}</div>
			<div class="resume-item"><label>简历名称：</label>${resume.seeker.seekerResume }</div>
		</div>
	</div>
	<hr>
	<div class="resume-item"><label>自我评价：</label><br>${resume.seeker.seekerEvaluation }</div>
	<div class="resume-item"><label>得奖情况：</label><br>${resume.seeker.seekerReward }</div>
	<div class="resume-item"><label>工作经历：</label><br>${resume.seeker.seekerGzjl }</div>
	<div class="resume-item"><label>项目经验：</label><br>${resume.seeker.seekerXmjy }</div>
	<div class="text-center">
		<a href="<%=path%>/resumeManage" class="btn btn-info btn-back">返回</a>
	</div>
</div>
</body>

</html>
