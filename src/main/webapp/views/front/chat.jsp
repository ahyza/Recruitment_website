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
<meta charset="utf-8" />
<title></title>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="col-lg-8 offset-2">
		<div class="main-container"
			style="margin-top: 8px; margin-bottom: 8px;">
			<div class="bread-crumbs hidden-xs">
				<a href="#">首页</a> &gt; <a href="#">信箱</a> &gt; <a href="#">发送信息</a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2>发送信息</h2>
				<form action="<%=path%>/sendMsg" method="post">
				<input type="hidden" name="letterSend" value="${letter.letterSend }">
				<input type="hidden" name="letterReceive" value="${letter.letterReceive }">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<%--@declare id="lettertitle"--%><label for="letterTitle">标题</label>
								<input type="text" class="form-control" name="letterTitle" placeholder="标题" required="required">
							</div>
						</div>
						<div class="col-md-6">
						</div>
					</div>
					<div class="form-group">
						<%--@declare id="lettercontent"--%><label for="letterContent">内容</label>
						<textarea rows="5" cols="10" name="letterContent" class="form-control" required="required"></textarea>
					</div>
					<a href="javascript:history.back(-1)" class="btn btn-info">返回</a>
					<button type="submit" class="btn btn-primary">发送</button>
					<font color="red">${mes }</font>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>

</html>