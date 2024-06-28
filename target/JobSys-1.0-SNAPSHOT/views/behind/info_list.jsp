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
    <div class="panel-head"><strong class="icon-reorder"> 求职信息列表</strong></div>
    <div class="padding border-bottom">
    </div>
    <table class="table table-hover text-center">
		<tr>
			<th>
				id
			</th>
			<th>
				标题
			</th>
			<th>
				内容
			</th>
			<th>
				发布时间
			</th>
			<th>
				用户
			</th>
			<th>
				信息类型
			</th>
			<th>操作</th>
		</tr>
   		<c:forEach items="${infoList}" var="item">
			<tr align="center">
				<td>
					${item.id}
				</td>
				<td>
					${item.infoTitle}
				</td>
				<td>
					${item.infoContent}
				</td>
				<td>
					${item.infoTime}
				</td>
				<td>
					${item.user.userName}
				</td>
				<td>
					求职信息
				</td>
			<td>	
				<div class="button-group"> 
				<a class="button border-red" href="<%=path %>/info/delete?id=${item.id}" onclick="return confirm('确定删除吗?')"><span class="icon-trash-o"></span> 删除</a> </div>
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
					<a href="<%=path %>/info/list?pageNumber=1">首页</a>
					<a href="<%=path %>/info/list?pageNumber=${page.pageNumber-1 }">上一页 </a>
				</c:if>
				<c:if test="${page.pageNumber==page.totalPage || page.totalPage==0 }">
					<a>下一页 </a>
					<a>尾页 </a>
				</c:if>
				<c:if test="${page.pageNumber!=page.totalPage && page.totalPage!=0 }">
					<a href="<%=path %>/info/list?pageNumber=${page.pageNumber+1 }">下一页 </a>
					<a href="<%=path %>/info/list?pageNumber=${page.totalPage }">尾页</a>
				</c:if>	
			</div>
		</td>
      </tr>
    </table>
  </div>
</body>
</html>