<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>人才招聘</title>
<link rel="stylesheet" href="<%=path%>/static/css/pintuer.css">
<link rel="stylesheet" href="<%=path%>/static/css/admin.css">
<script src="<%=path%>/static/js/jquery.js"></script>
<script src="<%=path%>/static/js/pintuer.js"></script>
</head>
<body>
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 公司列表</strong></div>
    <div class="padding border-bottom">
    </div>
    <table class="table table-hover text-center">
		<tr>
			<th>
				id
			</th>
			<th>
				公司名称
			</th>
			<th>
				公司logo
			</th>
			<th>
				招聘人姓名
			</th>
			<th>操作</th>
		</tr>
   		<c:forEach items="${companyList}" var="item">
			<tr align="center">
				<td>
					${item.id}
				</td>
				<td>
					${item.companyName}
				</td>
				<td>
					<img alt="" src="<%=path %>/pic/${item.companyLogo}" width="72px" height="72px">
				</td>
				<td>
					${item.companyUser}
				</td>
			<td>	
				<div class="button-group"> 
				<a class="button border-main" href="<%=path %>/company/detail?id=${item.id}"><span class="icon-edit"></span> 详细信息</a>
				</div>
			</td>
			</tr>
		</c:forEach>
      <tr>
        <td colspan="8">
			<div class="pagelist">
				<c:if test="${page.pageNumber==1 || page.totalPage==0 }">
					<a>首页</a>
					<a>上一页 </a>
				</c:if>
				<c:if test="${page.pageNumber!=1 && page.totalPage!=0 }">
					<a href="<%=path %>/company/list?pageNumber=1">首页</a>
					<a href="<%=path %>/company/list?pageNumber=${page.pageNumber-1 }">上一页 </a>
				</c:if>
				<c:if test="${page.pageNumber==page.totalPage || page.totalPage==0 }">
					<a>下一页 </a>
					<a>尾页 </a>
				</c:if>
				<c:if test="${page.pageNumber!=page.totalPage && page.totalPage!=0 }">
					<a href="<%=path %>/company/list?pageNumber=${page.pageNumber+1 }">下一页 </a>
					<a href="<%=path %>/company/list?pageNumber=${page.totalPage }">尾页</a>
				</c:if>	
			</div>
		</td>
      </tr>
    </table>
  </div>
</body>
</html>