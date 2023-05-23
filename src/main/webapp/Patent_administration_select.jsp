<%--
  Created by IntelliJ IDEA.
  User: 27757
  Date: 2023/5/23
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>高校科研管理系统</title>
  <style>
    /* CSS样式 */
    /* 新的风格 */
    * {
      box-sizing: border-box;
    }

    body {
      font-family: 'Arial', sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
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

    nav {
      background-color: #555;
      color: #fff;
      padding: 10px;
      text-align: center;
    }

    nav ul {
      list-style-type: none;
      padding: 0;
      margin: 0;
    }

    nav ul li {
      display: inline-block;
      margin-right: 10px;
    }

    nav ul li a {
      text-decoration: none;
      color: #fff;
      padding: 10px;
    }

    nav ul li a:hover {
      background-color: #444;
    }

    main {
      background-color: #fff;
      margin: 20px;
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

    .search-container {
      text-align: center;
      margin-bottom: 20px;
    }

    .search-container input[type="text"] {
      padding: 10px;
      width: 300px;
      border-radius: 5px;
      border: none;
    }

    .search-container input[type="submit"] {
      padding: 10px 20px;
      background-color: #333;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .search-container input[type="submit"]:hover {
      background-color: #666;
    }

    .button {
      display: inline-block;
      background-color: #333;
      color: #fff;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 5px;
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
      border-radius: 5px;
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
        <li><a href="${pageContext.request.contextPath}/Project_declaration.jsp">申报</a></li>
      </ul>
    </li>
    <li>
      <a href="#">科研项目成果</a>
      <ul class="submenu">
        <li><a href="${pageContext.request.contextPath}/Scientific_research_project/Patent_administration">专利管理</a></li>
      </ul>
    </li>
    <li><a href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
    <li><a href="${pageContext.request.contextPath}/register.jsp">注册</a></li>
  </ul>
</nav>

<!-- 修改部分 -->
<!-- 搜索框和搜索按钮 -->
<div class="search-container">
  <form action="${pageContext.request.contextPath}/Scientific_research_project/Patent_administration_select" method="GET">
    <input type="text" name="project_name" placeholder="输入项目名称进行搜索">
    <input type="submit" value="搜索">
    <a href="${pageContext.request.contextPath}/Scientific_research_project/Patent_administration" type="submit" >返回主页</a>
  </form>
</div>

<main>
  <!-- 用户管理功能 -->
  <section id="user-management">
    <h2>专利管理</h2>
    <span>${Patent_administration_edit_msg}</span>

    <%
      session.removeAttribute("Patent_administration_edit_msg");
    %>
    <!-- 用户管理相关内容 -->
    <table>
      <tr>
        <th>id</th>
        <th>项目编号</th>
        <th>项目名称</th>
        <th>项目负责人</th>
        <th>申请类别</th>
        <th>学科分类</th>
        <th>预算经费</th>
        <th>成果汇报</th>
        <th>专利号</th>
        <th>操作</th>
      </tr>
      <c:forEach items="${by_project_name_project_}" var="research_" varStatus="s">
        <tr>
          <td>${research_.id}</td>
          <td>${research_.project_number}</td>
          <td>${research_.project_name}</td>
          <td>${research_.project_leader}</td>
          <td>${research_.category}</td>
          <td>${research_.subject}</td>
          <td>${research_.budget}</td>
          <td>${research_.reporting_of_results}</td>
          <td>${research_.patent_number}</td>
          <td>
            <a href="${pageContext.request.contextPath}/Scientific_research_project/Patent_management_find_by_id?id=${research_.id}" class="button">编辑</a>
              <%--            <a href="${pageContext.request.contextPath}/Scientific_research_project/declare_delete?id=${research.id}" class="button">删除</a>--%>
          </td>
        </tr>
      </c:forEach>

    </table>
  </section>
</main>
</body>
</html>
