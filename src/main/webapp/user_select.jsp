<%--
  Created by IntelliJ IDEA.
  User: 27757
  Date: 2023/5/21
  Time: 2:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>高校科研管理系统</title>
    <style>
        /* CSS样式 */
        /* 新增样式 */
        /* 新增样式 */
        .search-container {
            text-align: center;
            margin: 20px 0;
        }

        .search-container input[type="text"] {
            padding: 5px;
            width: 300px;
            border-radius: 3px;
            border: 1px solid #ccc;
            margin-top: 20px;
        }

        .search-container input[type="submit"] {
            padding: 5px 10px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 20px;
        }

        .search-container input[type="submit"]:hover {
            background-color: #666;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        h1 {
            margin: 0;
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            background-color: #333;
            text-align: center;
        }

        nav li {
            display: inline-block;
            margin-right: 10px;
        }

        nav a {
            text-decoration: none;
            display: block;
            padding: 10px;
            color: #fff;
        }

        nav a:hover {
            background-color: #666;
        }

        main {
            margin: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
        }

        section {
            margin-bottom: 20px;
        }

        h2 {
            margin: 0 0 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f0f0f0;
        }

        .button {
            display: inline-block;
            background-color: #333;
            color: #fff;
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 3px;
        }

        .button:hover {
            background-color: #666;
        }

        /* 子菜单样式 */
        .submenu {
            display: none;
            position: absolute;
            background-color: #f0f0f0;
            z-index: 1;
            border-radius: 3px;
            padding: 10px;
        }

        .submenu a {
            display: block;
            padding: 5px 10px;
            color: #333;
            text-decoration: none;
        }

        li:hover .submenu {
            display: block;
        }
    </style>

</head>
<body>

<header>
    <h1>高校科研管理系统</h1>
</header>

<nav>
    <ul>
        <li><a href="${pageContext.request.contextPath}/user/">用户管理</a></li>
        <li>
            <a href="${pageContext.request.contextPath}/Scientific_research_project/declare_list">科研项目</a>
            <ul class="submenu">
                <li><a href="Project_declaration.jsp">申报</a></li>
                <%--                <li><a href="#">审核</a></li>--%>
                <%--                <li><a href="#">合同签订</a></li>--%>
                <%--                <li><a href="#">经费管理</a></li>--%>
                <li><a href="#">成果汇报</a></li>
            </ul>
        </li>
        <li>
            <a href="#">科研项目成果</a>
            <ul class="submenu">
                <li><a href="#">专利管理</a></li>
                <li><a href="#">论文管理</a></li>
                <li><a href="#">著作权管理</a></li>
                <li><a href="#">奖项管理</a></li>
            </ul>
        </li>
    </ul>
</nav>

<!-- 修改部分 -->
<!-- 搜索框和搜索按钮 -->
<div class="search-container">
    <form action="${pageContext.request.contextPath}/user/select_user" method="get">
        <input type="text" name="account" placeholder="输入账号进行搜索">
        <input type="submit" value="搜索">
    </form>
</div>

<main>
    <!-- 用户管理功能 -->
    <section id="user-management">
        <h2>用户管理</h2>
        <!-- 用户管理相关内容 -->
        <table>
            <tr>
                <th>id</th>
                <th>账号</th>
                <th>密码</th>
                <th>角色</th>
                <th>操作</th>
            </tr>

            <tr>
                <td>${user_by_account.id}</td>
                <td>${user_by_account.account}</td>
                <td>${user_by_account.password}</td>
                <td>${user_by_account.role}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/user/select?id=${user_by_account.id}" class="button">编辑</a>
                    <a class="button" href="${pageContext.request.contextPath}/user/delete?id=${user_by_account.id}">删除</a>
                </td>
            </tr>


            <!-- 更多用户行 -->
        </table>
    </section>


</main>
</body>
</html>
