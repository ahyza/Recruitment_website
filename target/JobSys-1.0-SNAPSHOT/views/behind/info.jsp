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
    <title>网站信息</title>  
    <link rel="stylesheet" href="<%=path%>/behind/css/pintuer.css">
    <link rel="stylesheet" href="<%=path%>/behind/css/admin.css">
    <script src="<%=path%>/behind/js/jquery.js"></script>
    <script src="<%=path%>/behind/js/pintuer.js"></script>  
</head>
<body>
<div class="body-content">
<div class="alert">
<span class="close rotate-hover"></span>python相关岗位招聘系统
</div>
</div>
</body></html>