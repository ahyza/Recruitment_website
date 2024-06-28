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
		<link rel="stylesheet" href="<%=path %>/front/css/style.css?121" />
		<script type="text/javascript">
			if("${mes}" != ""){
				alert("${mes}")
			}
		</script>
	</head>

	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="col-lg-8 offset-2">
			<div class="main-container" style="margin-top: 8px; margin-bottom: 8px;">
				<div class="bread-crumbs hidden-xs">
					<a href="#">首页</a> &gt;
					<a href="#">招聘信息</a> &gt;
					<a href="#">${job.jobName }</a>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-md-9" style="padding-left: 50px;">
									<div class="job-status">
										<c:if test="${job.jobStatus == 1 }">
											招聘中
										</c:if>
										<c:if test="${job.jobStatus == 2 }">
											已关闭
										</c:if>
									</div>
									<div>
										<span class="job-name">${job.jobName }</span>
										<span class="job-salary">${job.jobSalary }</span>
									</div>
									<p>
										<span class="job-pos">${job.jobAddress } · ${job.jobXlyq }</span>
									</p>
								</div>
								
								<div class="col-md-3">
									<br />
									<br />
									<p>
										<img src="<%=path %>/pic/${job.company.companyLogo }" class="rounded-circle" width="30px" height="30px"/>
										<span class="company_text">
											${job.company.companyName }
										</span>
										<span class="user_text">
											${job.company.companyManager }
										</span>
									</p>
								</div>
							</div>
							<c:if test="${job.jobStatus == 1 }">
								<c:if test="${sessionScope.user.userRole == 1 }">
									<a href="<%=path %>/chat?id=${job.id}" class="btn btn-info btn-lg" style="margin-top: 10px;margin-left: 30px;">立即沟通</a>
									<a href="<%=path %>/send?id=${job.id}" class="btn btn-info btn-lg" style="margin-top: 10px;margin-left: 30px;">投递简历</a>
								</c:if>
								<c:if test="${sessionScope.user.userRole == 2 }">
									<a href="javascript:alert('您不是求职者')" class="btn btn-info btn-lg" style="margin-top: 10px;margin-left: 30px;">立即沟通</a>
									<a href="javascript:alert('您不是求职者')" class="btn btn-info btn-lg" style="margin-top: 10px;margin-left: 30px;">投递简历</a>
								</c:if>
							</c:if>
						</div>
					</div>
					<br />
					<div class="card">
						<div class="card-body">
							<div style="margin-left: 30px;">
								<h4>职位描述</h4>
								<div class="text">
									${job.jobDesc }
								</div>
								<br />
								
								<h4>工作地点</h4>
								<div class="text">
									${job.jobAddress }
								</div>
								<br />
								<h4>公司介绍</h4>
								<div class="text">
									${job.company.companyDesc }
								</div>
							</div>
						</div>
					</div>
					<br />
				</div>
			</div>
			
		</div>
		
	</body>

</html>