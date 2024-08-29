<%--
  Created by IntelliJ IDEA.
  User: t007
  Date: 2024-08-09
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>浦东路桥</title>
    <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico">
    <link type="text/css" href="css/login.css" rel="stylesheet">
</head>
<body>
<div>
    <img id="login-font" height="auto" width="auto" src="./images/login-font.png">
</div>
<div>
    <img id="login-bridge" height="auto" width="auto" src="./images/bridge.png">
</div>
<div id="form-data">
    <span>浦东路桥数字化管理平台</span>
    <form action="login" method="post">
        <input id="username" type="text" name="username" placeholder="请输入用户名" value="STCS-Y"/>
        <input type="password" name="password" placeholder="请输入密码"  value="qwerty123"/>
        <button type="submit" id="btnSubmit">登陆</button>
    </form>
    <div id="responseMessage">
        <%= request.getAttribute("loginMessage") != null ? request.getAttribute("loginMessage") : "" %>
    </div>
</div>
</body>
</html>
