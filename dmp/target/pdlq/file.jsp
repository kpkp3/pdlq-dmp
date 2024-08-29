<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico">
    <title>浦东路桥</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        #header {
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        #header .system-info {
            display: flex;
            align-items: center;
        }

        #header .system-info h1 {
            margin: 0;
            font-size: 24px;
        }

        #header .system-info p {
            margin: 0;
            font-size: 16px;
        }

        #header .user-info {
            display: flex;
            align-items: center;
            margin-right: 1%;
            background-color: white;
            color: #333f47;
        }

        #header .user-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .system-info {
            display: block;
            width: 190px;
            background-color: #333f47;
            height: 100%;
        }

        #menu {
            width: 200px;
            background-color: #333f47;
            padding: 10px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            flex-shrink: 0;
        }

        #menu ul {
            list-style-type: none;
            padding: 0;
        }

        #menu ul li {
            margin: 10px 0;
        }

        #menu ul li a {
            text-decoration: none;
            color: white;
            display: block;
            padding: 10px;
            border-radius: 4px;
            font-size: 15px;
        }

        #menu ul li div a:hover {
            background-color: #6cbf4d;
        }

        #content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }

        #content{
            background-color: #f3f3f4;
        }
        #top-left{
            width: 50%;
            height: 50%;
            margin: 5%;
            border-bottom: 1px solid black;
        }
        #top-right{
            width: 50%;
            height: 50%;
            margin: 5%;
            border-bottom: 1px solid black;
        }
        #foot{
            width: 50%;
            height: 50%;
            margin: 5%;
            border-bottom: 1px solid black;
        }
    </style>
</head>

<body>
<!-- Header Section -->
<div id="header">
    <div class="system-info" style="padding-left: 30px;">
        <img src="./images/index-right.png" style="margin-right: 10px;">
        <span style="color: white;font-size: 20px;font-weight: bold">浦东路桥</span>
    </div>
    <div class="user-info">
        <!-- 假设用户头像和名称在 session 中 -->
        <% String userName=(String) session.getAttribute("username");%>
        <h3>当前用户：</h3>
        <span>
            <%= userName %>
        </span>
    </div>
</div>
<div style="display: flex; flex: 1;">
    <!-- Menu Section -->
    <div id="menu">
        <ul>
            <li>
                <div><a href="index.jsp">主页</a></div>
            </li>
            <li>
                <div><a>知识中心</a></div>
            </li>
            <li>
                <div><a>电子招投标</a></div>
            </li>
            <li>
                <div><a>竣工资料管理</a></div>
            </li>
            <li>
                <div><a>供应商管理</a></div>
            </li>
            <li>
                <div><a>采购管理</a></div>
            </li>
            <li>
                <div><a>付款计划管理</a></div>
            </li>
            <li>
                <div><a>发票核算</a></div>
            </li>
            <li>
                <div><a href="file.jsp">文件管理</a></div>
            </li>
        </ul>
    </div>
    <!-- Content Section -->
    <div id="content">
        <h1>压缩包上传</h1>
        <form enctype="multipart/form-data" action="upload" method="post">
            <input type="file" name="file" accept=".zip" required>
            <button type="submit">上传压缩文件</button>
        </form>
    </div>
</body>
</html>