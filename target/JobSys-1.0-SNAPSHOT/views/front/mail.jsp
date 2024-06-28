<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
			<div class="main-container" style="margin-top: 8px; margin-bottom: 8px;">
				<div class="bread-crumbs hidden-xs">
					<a href="#">首页</a> &gt;
					<a href="#">信箱</a>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div>
								<form role="form" action="<%=path %>/mail" method="post">
								<div class="form-group">
									<input type="text" class="form-control" name="letter.letterTitle" value="${letter.letterTitle }" placeholder="搜索标题">
								</div>
								<button type="submit" class="btn btn-primary">搜索</button>
							</form>
							</div>
							<br />
							<h4 class="card-title">信箱列表</h4>
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th width="40%">标题</th>
										<th>发送人</th>
										<th>内容</th>
										<th>状态</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${letterList }" var="item">
										<tr>
											<td>${item.letterTitle }</td>
											<td>${item.send.userName }</td>
											<td><a class="btn btn-info btn-sm" href="<%=path %>/mailDetail?id=${item.id}">查看</a></td>
											<td>
											<c:if test="${item.letterStatus ==  1}">
												<span class="label label-danger">未读</span>
											</c:if>
											<c:if test="${item.letterStatus ==  2}">
												<span class="label label-success">已读</span>
											</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<ul class="pagination" style="float:right;">
								<c:if test="${page.pageNumber==1 || page.totalPage==0 }">
									<li class="page-item disabled">
										<a class="page-link" href="#">上一页</a>
									</li>
								</c:if>
								<c:if test="${page.pageNumber!=1 && page.totalPage!=0 }">
									<li class="page-item disabled">
										<a href="<%=path %>/mail?pageNumber=${page.pageNumber-1 }" class="page-link" href="#">上一页</a>
									</li>
								</c:if>
								<c:if test="${page.pageNumber!=page.totalPage && page.totalPage!=0 }">
									<li class="page-item">
										<a href="<%=path %>/mail?pageNumber=${page.pageNumber+1 }" class="page-link" href="#">下一页</a>
									</li>
								</c:if>	
								<c:if test="${page.pageNumber==page.totalPage || page.totalPage==0 }">
									<li class="page-item disabled">
										<a class="page-link" href="#">下一页</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
		<script type="text/javascript" src="js/bootstrap.js"></script>
		<script type="text/javascript" src="js/swiper.min.js"></script>
	</body>

</html>