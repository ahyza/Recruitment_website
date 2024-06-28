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
				<a href="#">首页</a> &gt; <a href="#">招聘信息</a> &gt; <a href="#">发布职位信息</a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h2>发布职位信息</h2>
				<form action="<%=path%>/publishJob" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="jobName">职位名称</label> 
								<input type="text" class="form-control" name="jobName" placeholder="职位名称" required="required">
							</div>
							<div class="form-group">
								<label for="jobNum">招聘人数</label>
								<input type="text" class="form-control" name="jobNum" placeholder="招聘人数" required="required">
							</div>
							<div class="form-group">
								<label for="jobType">所属行业</label> 
								<select name="jobType" class="form-control" required="required">
									<option value="1" <c:if test="${job.jobType == '1' }">selected="selected"</c:if>>python开发</option>
									<option value="2" <c:if test="${job.jobType == '2' }">selected="selected"</c:if>>python运维</option>
									<option value="3" <c:if test="${job.jobType == '3' }">selected="selected"</c:if>>爬虫</option>
									<option value="4" <c:if test="${job.jobType == '4' }">selected="selected"</c:if>>python工程师</option>
									<option value="5" <c:if test="${job.jobType == '5' }">selected="selected"</c:if>>python讲师</option>
									<option value="6" <c:if test="${job.jobType == '6' }">selected="selected"</c:if>>python脚本工程师</option>
									<option value="7" <c:if test="${job.jobType == '7' }">selected="selected"</c:if>>python数据分析师</option>
									<option value="8" <c:if test="${job.jobType == '8' }">selected="selected"</c:if>>python算法工程师</option>
								</select>
							</div>
							<div class="form-group">
								<label for="jobXlyq">学历要求</label> 
								<select name="jobXlyq" class="form-control" required="required">
									<option value="专科" <c:if test="${job.jobXlyq == '专科' }">selected="selected"</c:if>>专科</option>
									<option value="本科" <c:if test="${job.jobXlyq == '本科' }">selected="selected"</c:if>>本科</option>
									<option value="硕士" <c:if test="${job.jobXlyq == '硕士' }">selected="selected"</c:if>>硕士</option>
									<option value="硕士以上" <c:if test="${job.jobXlyq == '硕士以上' }">selected="selected"</c:if>>硕士以上</option>
								</select>
							</div>
							<div class="form-group">
								<label for="jobYyyq">语言要求</label> 
								<select name="jobYyyq" class="form-control" required="required">
									<option value="无" <c:if test="${job.jobYyyq == '无' }">selected="selected"</c:if>>无</option>
									<option value="英语" <c:if test="${job.jobYyyq == '英语' }">selected="selected"</c:if>>英语</option>
									<option value="日语" <c:if test="${job.jobYyyq == '日语' }">selected="selected"</c:if>>日语</option>
									<option value="德语" <c:if test="${job.jobYyyq == '德语' }">selected="selected"</c:if>>德语</option>
									<option value="其他" <c:if test="${job.jobYyyq == '其他' }">selected="selected"</c:if>>其他</option>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="jobSalary">薪资</label> 
								<input type="text" class="form-control" name="jobSalary" placeholder="薪资" required="required">
							</div>
							<div class="form-group">
								<label for="jobAddress">工作地点</label> 
								<input type="text" class="form-control" name="jobAddress" placeholder="工作地点" required="required">
							</div>
							<div class="form-group">
								<label for="jobStart">起始时间</label>
								<input type="text" class="form-control" name="jobStart" placeholder="起始时间" required="required">
							</div>
							<div class="form-group">
								<label for="jobEnd">截止时间</label> 
								<input type="text" class="form-control" name="jobEnd" placeholder="截止时间" required="required">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="jobDesc">岗位介绍</label>
						<textarea rows="5" cols="10" name="jobDesc" class="form-control" required="required"></textarea>
					</div>
					<a href="javascript:history.back(-1)" class="btn btn-info">返回</a>
					<button type="submit" class="btn btn-primary">发布</button>
					<font color="red">${mes }</font>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>

</html>