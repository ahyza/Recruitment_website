<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		var userName = $('#userName').val();
		var password = $('#password').val();
		if (userName == "" || userName == null) {
			alert("请输入用户名！");
			return false;
		} else if (password == "" || password == null) {
			alert("请输入密码！")
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
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<form action="<%=path %>/login" method="post">
				<div class="form-group">
					<label for="userName">登陆账号</label> 
					<input type="text" class="form-control" id="userName" name="userName" placeholder="登录账号"> 
					<font id="userErrorInfo" color="red"></font>
				</div>
				<div class="form-group">
					<%--@declare id="password1"--%><label for="password1">密码</label>
					<input type="password" class="form-control" id="password" name="userPass" placeholder="密码"> 
				</div>
				<div class="form-group">${mes }</div>
				<button type="submit" class="btn btn-primary" onclick="return checkForm()">登录</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>

</html>