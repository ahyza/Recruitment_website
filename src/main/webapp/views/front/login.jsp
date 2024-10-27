<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>后台管理-登陆</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<style>
		.main-body {
			top: 50%;
			left: 50%;
			position: absolute;
			transform: translate(-50%, -50%);
			overflow: hidden;
		}
		.login-main .login-bottom .center .item input {
			display: inline-block;
			width: 227px;
			height: 22px;
			padding: 0;
			position: absolute;
			border: 0;
			outline: 0;
			font-size: 14px;
			letter-spacing: 0;
		}
		.login-main .login-bottom .center .item {
			width: 288px;
			height: 35px;
			border-bottom: 1px solid #dae1e6;
			margin-bottom: 35px;
		}
		.login-main {
			width: 428px;
			position: relative;
		}
		.login-main .login-top {
			height: 117px;
			background-color: #148be4;
			border-radius: 12px 12px 0 0;
			font-size: 30px;
			color: #fff;
			line-height: 117px;
			text-align: center;
		}
		.login-main .login-bottom {
			width: 428px;
			background: #fff;
			border-radius: 0 0 12px 12px;
			padding-bottom: 53px;
		}
		.login-main .login-bottom .center {
			width: 288px;
			margin: 0 auto;
			padding-top: 40px;
			padding-bottom: 15px;
		}
		.login-main .login-bottom .login-btn {
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
		body {
			background-image: url('<%=path %>/static/img_login/loginbg.png');
			background-size: cover; /* 确保背景图像覆盖整个背景 */
		}
		.options {
			display: flex; /* 使用flex布局 */
			justify-content: space-between; /* 在子项之间均匀分配空间 */
			margin-top: 5px; /* 添加顶部间距 */
			font-size: 12px; /* 缩小字体 */
		}
		.remember-me {
			display: flex; /* 保证内部内容水平对齐 */
			align-items: center; /* 垂直居中 */
		}
		.forgot-password {
			align-self: center; /* 垂直居中 */
		}
		.forgot-password a {
			color: #1E9FFF;
			text-decoration: none;
		}
		.forgot-password a:hover {
			text-decoration: underline;
		}

		.register-link {
			display: block;
			text-align: center;
			margin-top: 10px;
			font-size: 14px;
		}

		/* 新增样式，使注册链接与登录链接一致 */
		.register-link a {
			color: #1E9FFF; /* 颜色与登录按钮一致 */
			text-decoration: none; /* 不加下划线 */
		}

		.register-link a:hover {
			text-decoration: underline; /* 鼠标悬停时添加下划线 */
		}
	</style>

	<script type="text/javascript">
		function checkForm() {
			var userName = document.getElementById('userName').value;
			var password = document.getElementById('password').value;
			if (userName == "" || userName == null) {
				alert("请输入用户名！");
				return false;
			} else if (password == "" || password == null) {
				alert("请输入密码！");
				return false;
			} else {
				return true;
			}
		}
	</script>
</head>

<body>
<div class="main-body">
	<div class="login-main">
		<div class="login-top">
			<span>后台管理登录</span>
		</div>
		<form action="<%=path %>/login" method="post" class="login-bottom">
			<div class="center">
				<div class="item">
					<input type="text" class="form-control" id="userName" name="userName" placeholder="登录账号">
					<font id="userErrorInfo" color="red"></font>
				</div>
				<div class="item">
					<input type="password" class="form-control" id="password" name="userPass" placeholder="密码">
				</div>
				<div class="options">
					<div class="remember-me">
						<input type="checkbox" id="rememberMe" name="rememberMe">
						<label for="rememberMe">保持登录</label>
					</div>
					<div class="forgot-password">
						<a href="<%=path %>/forgot-password">忘记密码？</a>
					</div>
				</div>
				<div class="form-group">${mes }</div>
				<button type="submit" class="login-btn" onclick="return checkForm()">登录</button>
				<span class="register-link">没有账号，<a href="<%=path %>/views/front/register.jsp">点击注册</a></span>
			</div>
		</form>
	</div>
</div>

</body>

</html>
