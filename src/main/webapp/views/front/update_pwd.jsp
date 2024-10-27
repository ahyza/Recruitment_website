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
<script type="text/javascript">
	function checkForm() {
		var oldPass = $('#oldPass').val();
		var newPass = $('#newPass').val();
		var newPass1 = $('#newPass1').val();
		if (oldPass == "" || oldPass == null) {
			alert("旧密码不能为空");
			return false;
		} else if (newPass == "" || newPass == null) {
			alert("新密码不能为空");
			return false;
		} else if (newPass1 == "" || newPass1 == null) {
			alert("重复密码不能为空");
			return false;
		} else if (newPass1 != newPass) {
			alert("重复密码不正确");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<br />
	<div class="row">
		<jsp:include page="center_menu.jsp"></jsp:include>
		<div class="col-md-4">
			<h2>修改密码</h2>
			<form action="<%=path %>/updatePwd" method="post">
				<div class="form-group">
					<label for="userName">原密码</label> 
					<input type="password" class="form-control" id="oldPass" name="oldPass" placeholder="旧密码"> 
					<font id="userErrorInfo" color="red"></font>
				</div>
				<div class="form-group">
					<label for="password1">新密码</label> 
					<input type="password" class="form-control" id="newPass" name="newPass" placeholder="新密码"> 
				</div>
				<div class="form-group">
					<label for="password1">重复密码</label> 
					<input type="password" class="form-control" id="newPass1" placeholder="重复密码"> 
				</div>
				<div class="form-group">${mes }</div>
				<button type="submit" class="btn btn-primary" onclick="return checkForm()">登录</button>
			</form>
		</div>
		<div class="col-md-4"></div>
	</div>
</body>

</html>