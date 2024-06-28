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
			<h2>公司信息管理</h2>
			<form action="<%=path%>/updateCompanyInfo" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${company.id }">
				<input type="hidden" name="companyLogo" value="${company.companyLogo }">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<%--@declare id="companyname"--%><label for="companyName">公司名称</label>
							<input type="text" class="form-control" name="companyName" placeholder="公司名称" value="${company.companyName }">
						</div>
						<div class="form-group">
							<%--@declare id="infoname"--%><label for="infoName">公司logo</label>
							<input type="file" class="form-control" name="logo">
						</div>
						<div class="form-group">
							<%--@declare id="companytype"--%><label for="companyType">公司类型</label>
							<select name="companyType" class="form-control">
								<option value="1" <c:if test="${company.companyType == 1}">selected="selected"</c:if>>国企</option>
						 		<option value="2" <c:if test="${company.companyType == 2}">selected="selected"</c:if>>私人公司</option>
								<option value="3" <c:if test="${company.companyType == 3}">selected="selected"</c:if>>上市公司</option>
							</select>
						</div>
						<div class="form-group">
							<%--@declare id="companyscale"--%><label for="companyScale">公司规模</label>
							<select name="companyScale" class="form-control">
								<option value="0-99人" <c:if test="${company.companyScale == '0-99人' }">selected="selected"</c:if>>0-99人</option>
								<option value="99-500人" <c:if test="${company.companyScale == '99-500人' }">selected="selected"</c:if>>99-500人</option>
								<option value="500-999人" <c:if test="${company.companyScale == '500-999人' }">selected="selected"</c:if>>500-999人</option>
								<option value="1000人以上" <c:if test="${company.companyScale == '1000人以上' }">selected="selected"</c:if>>1000人以上</option>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<%--@declare id="companyphone"--%><label for="companyPhone">公司电话</label>
							<input type="text" class="form-control" name="companyPhone" placeholder="公司电话" value="${company.companyPhone }">
						</div>
						<div class="form-group">
							<%--@declare id="companyuser"--%><label for="companyUser">负责人姓名</label>
							<input type="text" class="form-control" name="companyUser" placeholder="负责人姓名" value="${company.companyUser }"> 
						</div>
						<div class="form-group">
							<%--@declare id="companymanager"--%><label for="companyManager">联系人姓名</label>
							<input type="text" class="form-control" name="companyManager" placeholder="联系人姓名" value="${company.companyManager }">
						</div>
						<div class="form-group">
							<%--@declare id="companytel"--%><label for="companyTel">联系人电话</label>
							<input type="text" class="form-control" name="companyTel" placeholder="联系人电话" value="${company.companyTel }"> 
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="companyDesc">公司介绍</label> 
					<textarea rows="5" cols="10" id="companyDesc" name="companyDesc" class="form-control">${company.companyDesc }</textarea>
				</div>
				<div class="form-group">
					<label for="companyAddress">地址</label> 
					<textarea rows="5" cols="10" id="companyAddress" name="companyAddress" class="form-control">${company.companyAddress }</textarea>
				</div>
				<button type="submit" class="btn btn-primary">更新</button>
				<font color="red">${mes }</font>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</body>

</html>