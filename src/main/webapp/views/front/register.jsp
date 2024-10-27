<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>用户注册</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<style>
		body {
			background-image: url('<%=path %>/static/img_login/loginbg.png');
			background-size: cover; /* 确保背景图像覆盖整个背景 */
		}
		.main-body {
			top: 50%;
			left: 50%;
			position: absolute;
			transform: translate(-50%, -50%);
			overflow: hidden;
		}
		.register-main {
			width: 428px;
			position: relative;
		}
		.register-main .register-top {
			height: 117px;
			background-color: #148be4;
			border-radius: 12px 12px 0 0;
			font-size: 30px;
			color: #fff;
			line-height: 117px;
			text-align: center;
		}
		.register-main .register-bottom {
			width: 428px;
			background: #fff;
			border-radius: 0 0 12px 12px;
			padding-bottom: 53px;
		}
		.register-main .register-bottom .center {
			width: 288px;
			margin: 0 auto;
			padding-top: 40px;
			padding-bottom: 15px;
		}
		.register-main .register-bottom .item {
			width: 288px;
			height: 35px;
			margin-bottom: 35px;
			position: relative; /* 使下划线定位相对 */
		}
		.register-main .register-bottom .form-control {
			display: inline-block;
			width: 100%;
			height: 38px;
			padding: 0 10px;
			border: none; /* 去掉边框 */
			outline: none; /* 去掉聚焦时的轮廓 */
			font-size: 14px;
			letter-spacing: 0;
			border-bottom: 1px solid #dae1e6; /* 添加灰色下划线 */
			background: transparent; /* 背景透明 */
		}
		.register-main .register-bottom .register-btn {
			width: 288px;
			height: 40px;
			background-color: #1E9FFF;
			border-radius: 16px;
			margin: 24px auto 0;
			text-align: center;
			line-height: 40px;
			color: #fff;
			font-size: 14px;
			cursor: pointer;
			border: none;
		}
		.login-link {
			display: block;
			text-align: center;
			margin-top: 10px;
			font-size: 14px;
		}
		.login-link a {
			color: #1E9FFF;
			text-decoration: none;
		}
		.login-link a:hover {
			text-decoration: underline;
		}
	</style>

	<script type="text/javascript">
		function checkForm() {
			var userName = document.getElementById('userName').value;
			var password1 = document.getElementById('password1').value;
			var password2 = document.getElementById('password2').value;
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
<div class="main-body">
	<div class="register-main">
		<div class="register-top">
			<span>用户注册</span>
		</div>
		<form action="<%=path %>/register" method="post" class="register-bottom">
			<div class="center">
				<div class="item">
					<input type="text" class="form-control" id="userName" name="userName" placeholder="登录账户名">
				</div>
				<div class="item">
					<input type="password" class="form-control" id="password1" name="userPass" placeholder="密码">
				</div>
				<div class="item">
					<input type="password" class="form-control" id="password2" placeholder="再次输入密码">
				</div>
				<div class="form-group">
					<label for="userRole">角色</label>
					<select name="userRole" class="form-control">
						<option value="1">求职者</option>
						<option value="2">招聘者</option>
					</select>
				</div>
				<div class="form-group">${mes }</div>
				<button type="submit" class="register-btn" onclick="return checkForm()">注册</button>
				<div class="login-link">
					<span>已有账号，<a href="<%=path %>/views/front/login.jsp">点击登录</a></span>
				</div>
			</div>
		</form>
	</div>
</div>
</body>

</html>
