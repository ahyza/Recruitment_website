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
    <title>欢迎页面</title>
    <link rel="stylesheet" href="<%=path%>/behind/css/pintuer.css">
    <link rel="stylesheet" href="<%=path%>/behind/css/admin.css">
    <script src="<%=path%>/behind/js/jquery.js"></script>
    <script src="<%=path%>/behind/js/pintuer.js"></script>
    <style>
        body {
            background-color: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .welcome-container {
            text-align: center;
            background: #ffffff;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .welcome-container h1 {
            font-size: 36px;
            color: #333;
            margin-bottom: 20px;
        }
        .welcome-container p {
            font-size: 18px;
            color: #666;
        }
        .welcome-container .button {
            margin-top: 30px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #0e90d2;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
        }
        .welcome-container .button:hover {
            background-color: #0a74bb;
        }
    </style>
</head>
<body>
<div class="welcome-container">
    <h1>欢迎来到Python岗位招聘系统</h1>
    <p>提升职业发展，找到最适合您的工作。</p>
    <a href="<%=path%>/user/login" class="button">进入系统</a>
</div>
</body>
</html>
