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
		<h2>个人信息管理</h2>
		<form action="<%=path%>/updateUserInfo" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${seeker.id }">
			<input type="hidden" name="seekerUserid" value="${seeker.seekerUserid }">
			<input type="hidden" name="seekerImag" value="${seeker.seekerImag }">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="seekerEmail">邮箱</label>
						<input type="text" class="form-control" name="seekerEmail" placeholder="邮箱" value="${seeker.seekerEmail }" required="required">
					</div>
					<div class="form-group">
						<label for="seekerName">姓名</label>
						<input type="text" class="form-control" name="seekerName" placeholder="姓名" value="${seeker.seekerEmail }" required="required">
					</div>
					<div class="form-group">
						<label for="seekerGender">性别</label> <br>
						<input type="radio" name="seekerGender" value="男" <c:if test="${seeker.seekerGender == '男' }">checked="checked"</c:if>>男
						<input type="radio" name="seekerGender" value="女" <c:if test="${seeker.seekerGender == '女' }">checked="checked"</c:if>>女
					</div>
					<div class="form-group">
						<label for="infoGender">照片</label> <br>
						<input type="file" name="userImage" class="form-control">
					</div>
					<div class="form-group">
						<label for="seekerHj">户籍</label> <br>
						<input type="text" class="form-control" name="seekerHj" placeholder="户籍" value="${seeker.seekerHj }" required="required">
					</div>
					<div class="form-group">
						<label for="seekerQwxz">期望薪资</label> <br>
						<input type="text" class="form-control" name="seekerQwxz" placeholder="期望薪资" value="${seeker.seekerQwxz }" required="required">
					</div>
					<div class="form-group">
						<label for="seekerQwgzlx">期望工作类型</label> <br>
						<input type="text" class="form-control" name="seekerQwgzlx" placeholder="期望工作类型" value="${seeker.seekerQwgzlx }" required="required">
					</div>
					<div class="form-group">
						<label for="seekerResume">简历名称</label> <br>
						<input type="text" class="form-control" name="seekerResume" placeholder="简历名称" value="${seeker.seekerResume }" required="required">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="seekerBirth">生日</label>
						<input type="text" class="form-control" name="seekerBirth" placeholder="生日" value="${seeker.seekerBirth }" required="required">
					</div>
					<div class="form-group">
						<label for="seekerMarry">是否结婚</label> <br>
						<input type="radio" name="seekerMarry" value="是" <c:if test="${seeker.seekerMarry == '是' }">checked="checked"</c:if>>是
						<input type="radio" name="seekerMarry" value="否" <c:if test="${seeker.seekerMarry == '否' }">checked="checked"</c:if>>否
					</div>
					<div class="form-group">
						<label for="seekerOnjob">是否在职</label> <br>
						<input type="radio" name="seekerOnjob" value="是" <c:if test="${seeker.seekerOnjob == '是' }">checked="checked"</c:if>>是
						<input type="radio" name="seekerOnjob" value="否" <c:if test="${seeker.seekerOnjob == '否' }">checked="checked"</c:if>>否
					</div>
					<div class="form-group">
						<label for="seekerEducation">学历</label>
						<input type="text" class="form-control" name="seekerEducation" placeholder="学历" value="${seeker.seekerEducation }" required="required">
					</div>
					<div class="form-group">
						<label for="seekerAddress">所在城市</label>
						<input type="text" class="form-control" name="seekerAddress" placeholder="所在城市" value="${seeker.seekerAddress }" required="required">
					</div>
					<div class="form-group">
						<label for="seekerZzd">暂住地</label>
						<input type="text" class="form-control" name="seekerZzd" placeholder="暂住地" value="${seeker.seekerZzd }" required="required">
					</div>
					<div class="form-group">
						<label for="seekerQwgzdd">期望工作地点</label>
						<input type="text" class="form-control" name="seekerQwgzdd" placeholder="期望工作地点" value="${seeker.seekerQwgzdd }" required="required">
					</div>
					<div class="form-group">
						<label for="seekerWydj">外语等级</label>
						<input type="text" class="form-control" name="seekerWydj" placeholder="外语等级" value="${seeker.seekerWydj }" required="required">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="seekerEvaluation">自我评价</label>
				<textarea rows="5" cols="10" name="seekerEvaluation" class="form-control">${seeker.seekerEvaluation }</textarea>
			</div>
			<div class="form-group">
				<label for="seekerReward">得奖情况</label>
				<textarea rows="5" cols="10" name="seekerReward" class="form-control">${seeker.seekerReward }</textarea>
			</div>
			<div class="form-group">
				<label for="seekerGzjl">工作经历</label>
				<textarea rows="5" cols="10" name="seekerGzjl" class="form-control">${seeker.seekerGzjl }</textarea>
			</div>
			<div class="form-group">
				<label for="seekerXmjy">项目经验</label>
				<textarea rows="5" cols="10" name="seekerXmjy" class="form-control">${seeker.seekerXmjy }</textarea>
			</div>
			<button type="submit" class="btn btn-primary"
					onclick="return checkForm()">更新</button>
			<font color="red">${mes }</font>
		</form>
	</div>
	<div class="col-md-2"></div>
</div>
</body>

</html>