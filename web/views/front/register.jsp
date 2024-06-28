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
		var password1 = $('#password1').val();
		var password2 = $('#password2').val();
		if (userName == "" || userName == null) {
			alert("登录账号不能为空");
			return false;
		} else if (password1 == "" || password1 == null) {
			alert("密码不能为空");
			return false;
		} else if (password2 == "" || password2 == null) {
			alert("确认密码不能为空");
			return false;
		} else if (password2 != password1) {
			alert("确认密码不正确");
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
			<form action="<%=path %>/register" method="post">
				<div class="form-group">
					<label for="userName">登录账户名</label> <input type="text"
						class="form-control" id="userName" name="userName"
						placeholder="登录账户名" >
				</div>
				<div class="form-group">
					<label for="password1">密码</label> <input type="password"
						class="form-control" id="password1" name="userPass"
						placeholder="密码">
				</div>
				<div class="form-group">
					<label for="password2">确认密码</label> <input type="password"
						class="form-control" id="password2" placeholder="再次输入密码">
				</div>
				<div class="form-group">
					<label for="password2">角色</label> 
					<select name="userRole" class="form-control">
						<option value="1">求职者</option>
						<option value="2">招聘者</option>
					</select>
				</div>
				<div class="form-group">${mes }</div>
				<button type="submit" class="btn btn-primary" onclick="return checkForm()">注册</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>

</html>