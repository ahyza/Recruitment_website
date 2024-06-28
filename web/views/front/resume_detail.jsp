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
<meta charset="UTF-8">
<title></title>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<br />
	<div class="row">
		<jsp:include page="center_menu.jsp"></jsp:include>
		<div class="col-md-7">
			<h2>简历详情</h2>
			<hr>
			<div style="padding: 10px; font-size: 16px">
				照片：<img alt="" src="<%=path %>/${resume.seeker.seekerImag}" width="70px" height="100px"><br>
				姓名：${resume.seeker.seekerName } &nbsp;&nbsp;&nbsp; 性别：${resume.seeker.seekerGender }<br>
				生日：${resume.seeker.seekerBirth } &nbsp;&nbsp;&nbsp; 是否结婚：${resume.seeker.seekerMarry }<br>
				学历：${resume.seeker.seekerEducation } &nbsp;&nbsp;&nbsp; email：${resume.seeker.seekerEmail }<br>
				户籍：${resume.seeker.seekerHj } &nbsp;&nbsp;&nbsp; 期望薪资：${resume.seeker.seekerQwxz}<br>
				期望工作类型：${resume.seeker.seekerQwgzlx} &nbsp;&nbsp;&nbsp; 外语等级：${resume.seeker.seekerWydj }<br>
				是否在职：${resume.seeker.seekerOnjob } &nbsp;&nbsp;&nbsp; 所在城市：${resume.seeker.seekerAddress }<br>
				暂住地：${resume.seeker.seekerZzd } &nbsp;&nbsp;&nbsp; 期望工作地点：${resume.seeker.seekerQwgzdd}<br>
				简历名称：${resume.seeker.seekerResume }
				<br>
				自我评价：<br>
				${resume.seeker.seekerEvaluation }<br>
				得奖情况：<br>
				${resume.seeker.seekerReward }<br>
				工作经历：<br>
				${resume.seeker.seekerGzjl }<br>
				项目经验：<br>
				${resume.seeker.seekerXmjy }<br>
			</div>
			<a href="<%=path%>/resumeManage" class="btn btn-info">返回</a>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>

</html>