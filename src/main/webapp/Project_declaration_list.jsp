<%--
  Created by IntelliJ IDEA.
  User: 27757
  Date: 2023/5/19
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <%
    // 获取session
    Object research_projects = session.getAttribute("research_projects");

    // 如果session为空则重定向到后台请求中
    if (research_projects == null){
      response.sendRedirect("http://localhost/Scientific_research_project/declare_list");
    }
  %>
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
        <li><a href="Project_declaration.jsp">申报</a></li>
        <%--        <li><a href="#">审核</a></li>--%>
        <%--        <li><a href="#">合同签订</a></li>--%>
        <%--        <li><a href="#">经费管理</a></li>--%>
<%--        <li><a href="#">成果汇报</a></li>--%>
      </ul>
    </li>
    <li>
      <a href="#">科研项目成果</a>
      <ul class="submenu">
        <li><a href="${pageContext.request.contextPath}/Scientific_research_project/Patent_administration">专利管理</a></li>
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
  <form action="${pageContext.request.contextPath}/Scientific_research_project/declare_select" method="GET">
    <input type="text" name="project_name" placeholder="输入项目名称进行搜索">
    <input type="submit" value="搜索">
  </form>
</div>

<main>
  <!-- 用户管理功能 -->
  <section id="user-management">
    <h2>科研项目管理</h2>
    <span>${declare_img_download_msg}</span>
    <span>${edit_msg}</span>
    <span>${delete_msg}</span>
    <%
      session.removeAttribute("declare_img_download_msg");
      session.removeAttribute("edit_msg");
      session.removeAttribute("delete_msg");
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
        <th>开始时间</th>
        <th>结束时间</th>
        <th>申请书</th>
        <th>审批状态</th>
        <th>成果汇报</th>
        <th>操作</th>
      </tr>
      <c:forEach items="${research_projects}" var="research" varStatus="s">
        <tr>
          <td>${research.id}</td>
          <td>${research.project_number}</td>
          <td>${research.project_name}</td>
          <td>${research.project_leader}</td>
          <td>${research.category}</td>
          <td>${research.subject}</td>
          <td>${research.budget}</td>
          <td>${research.start_date}</td>
          <td>${research.end_date}</td>
          <td>
              <%--              <img src="data:image/jpeg;base64,${ImageUtils.convertImageToBase64(research.application_file)}" alt="img">--%>
            <a href="${pageContext.request.contextPath}/Scientific_research_project/declare_img_download?id=${research.id}">下载</a>
          </td>
          <td>${research.approval_status}</td>

          <td>${research.reporting_of_results}</td>
          <td>
            <a href="${pageContext.request.contextPath}/Scientific_research_project/declare_find_by_id?id=${research.id}" class="button">编辑</a>
            <a href="${pageContext.request.contextPath}/Scientific_research_project/declare_delete?id=${research.id}" class="button">删除</a>
<%--            <a class="button">成果汇报</a>--%>
          </td>
        </tr>
      </c:forEach>

    </table>
  </section>
</main>
</body>
</html>
