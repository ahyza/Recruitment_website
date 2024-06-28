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
					<a href="#">招聘信息</a>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<form role="form" action="<%=path %>/searchJob" method="post">
								<div class="form-group">
									<input type="text" class="form-control" name="jobName" value="${jobName }" placeholder="搜索职位">
								</div>
								<button type="submit" class="btn btn-primary">搜索</button>
								<c:if test="${sessionScope.user.userRole == 2 }">
									<a href="<%=path %>/publishJobPage.action" class="btn btn-info" style="float: right;">发布职位信息</a>
								</c:if>
							</form>
						</div>
					</div>
					<br />
					<div class="card">
						<div class="card-body">
							<div>
								<strong>行业：</strong>
								<a href="<%=path %>/recruitment" <c:if test="${jobType == null }">class="active"</c:if>><span>全部</span></a> &nbsp;&nbsp;&nbsp;
								<a href="<%=path %>/searchJobByType?jobType=1" <c:if test="${jobType == 1 }">class="active"</c:if>><span>python开发</span></a> &nbsp;&nbsp;&nbsp;
								<a href="<%=path %>/searchJobByType?jobType=2" <c:if test="${jobType == 2 }">class="active"</c:if>><span>python运维</span></a> &nbsp;&nbsp;&nbsp;
								<a href="<%=path %>/searchJobByType?jobType=3" <c:if test="${jobType == 3 }">class="active"</c:if>><span>爬虫</span></a> &nbsp;&nbsp;&nbsp;
								<a href="<%=path %>/searchJobByType?jobType=4" <c:if test="${jobType == 4 }">class="active"</c:if>><span>python工程师</span></a> &nbsp;&nbsp;&nbsp;
								<a href="<%=path %>/searchJobByType?jobType=5" <c:if test="${jobType == 5 }">class="active"</c:if>><span>python讲师</span></a> &nbsp;&nbsp;&nbsp;
								<a href="<%=path %>/searchJobByType?jobType=6" <c:if test="${jobType == 6 }">class="active"</c:if>><span>python脚本工程师</span></a> &nbsp;&nbsp;&nbsp;
								<a href="<%=path %>/searchJobByType?jobType=7" <c:if test="${jobType == 7 }">class="active"</c:if>><span>python数据分析师</span></a> &nbsp;&nbsp;&nbsp;
								<a href="<%=path %>/searchJobByType?jobType=8" <c:if test="${jobType == 8 }">class="active"</c:if>><span>python算法工程师</span></a> &nbsp;&nbsp;&nbsp;
							</div>
						</div>
					</div>
					<br />
					<div class="row">
						<c:forEach items="${jobList }" var="job">
						<div class="col-lg-4 line">
							<a href="<%=path %>/jobDetail?id=${job.id}">
								<div class="card">
									<div class="card-body">
										<div class="card-title">
											<p>
												${job.jobName }
												<span class="salary">${job.jobSalary }</span>
											</p>
										</div>
										<p class="job_text">
											<span>${job.jobAddress } | </span>
											<span>${job.jobXlyq }  |</span>
											<span>${job.jobYyyq }</span>
										</p>
										<hr />
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
							</a>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
			
		</div>
		
	</body>

</html>