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
            width: 1000px;
            height: 400px;
            margin-left: 20px;
            background-color: white;
        }
        #top-right{
            width: 600px;
            height: 400px;
            margin-left: 30px;
            background-color: white;
        }
        #foot{
            width: 1630px;
            height: 400px;
            margin-left: 20px;
            background-color: white;
        }
        #content-header{
            display: flex;
        }
        a{
            text-decoration: none;
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
        <div id="content-header">
            <div id="top-left">
                <div style="border-bottom: 2px solid black">
                    <h2 style="margin-left: 10px;align-items: center">快捷方式</h2>
                </div>
                <div id="top-left-content">
                    <h1 style="align-items: center;text-align: center">暂无设置</h1>
                </div>
            </div>
            <div id="top-right">
                <div style="border-bottom: 2px solid black">
                    <h2 style="margin-left: 10px;align-items: center">信息中心</h2>
                </div>
                <div id="top-right-content">
                    <ul >
                        <a href="" style="font-size: 16px">【系统更新提示】平台安全加固了版本更新&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: darkgray">2024-08-09 08:30:00</span></a>
                        <a href="" style="font-size: 16px">【口令更改提示】弱口到期会修改及时修改&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: darkgray">2024-08-10 08:30:00</span></a>
                        <a href="" style="font-size: 16px">【邮件钓鱼提示】近期邮件钓鱼频繁防钓鱼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: darkgray">2024-08-11 08:30:00</span></a>
                    </ul>
                </div>
            </div>
        </div>

        <div id="foot">
            <div style="border-bottom: 2px solid black">
                <h2 style="margin-left: 10px;align-items: center;">代办事项</h2>
            </div>
            <div id="foot-content" style="align-items: center;text-align: center;font-size: 16px">
                <table style="width: 90%;margin-top: 40px;">
                    <thead>
                        <th>代办类型</th>
                        <th>代办名称</th>
                        <th>所属部门</th>
                        <th>发起人</th>
                        <th>送达时间</th>
                        <th>操作</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td>合同</td>
                        <td>浦东新区张江道路改善</td>
                        <td>道路设施</td>
                        <td>张三</td>
                        <td></td>
                        <td><button value="进入">进入</button></td>
                    </tr>
                    <tr>
                        <td>合同</td>
                        <td>张东路施工材料</td>
                        <td>三项目部</td>
                        <td>李四</td>
                        <td></td>
                        <td><button value="进入">进入</button></td>
                    </tr>
                    <tr>
                        <td>合同</td>
                        <td>中科路道路施工</td>
                        <td>四项目部</td>
                        <td>王五</td>
                        <td></td>
                        <td><button value="进入">进入</button></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>

</html>