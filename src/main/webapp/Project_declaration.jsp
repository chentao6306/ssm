<%--
  Created by IntelliJ IDEA.
  User: 27757
  Date: 2023/5/19
  Time: 1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>科研项目申报</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }

    .container {
      max-width: 500px;
      margin: 0 auto;
      padding: 20px;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .form-group input[type="text"],
    .form-group select {
      width: 100%;
      padding: 5px;
    }

    .form-group input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      border: none;
      cursor: pointer;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>科研项目申报</h2>
  <form action="${pageContext.request.contextPath}/Scientific_research_project/declare" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="project_number">项目编号:</label>
      <input type="text" id="project_number" name="project_number" required>
    </div>
    <div class="form-group">
      <label for="project_name">项目名称:</label>
      <input type="text" id="project_name" name="project_name" required>
    </div>
    <div class="form-group">
      <label for="project_leader">项目负责人:</label>
      <input type="text" id="project_leader" name="project_leader" required>
    </div>
    <div class="form-group">
      <label for="category">申请类别:</label>
      <select id="category" name="category">
        <option value="文科">文科</option>
        <option value="理科">理科</option>
        <option value="艺术科">艺术科</option>
      </select>
    </div>
    <div class="form-group">
      <label for="subject">学科分类:</label>
      <input type="text" id="subject" name="subject" required>
    </div>
    <div class="form-group">
      <label for="budget">预算经费:</label>
      <input type="text" id="budget" name="budget" required>
    </div>
    <div class="form-group">
      <label for="start_date">开始时间:</label>
      <input type="date" id="start_date" name="start_date" required>
    </div>
    <div class="form-group">
      <label for="end_date">结束时间:</label>
      <input type="date" id="end_date" name="end_date" required>
    </div>
    <div class="form-group">
      <label for="application_file">上传申请书:</label>
      <input type="file" id="application_file" name="application_file" required>
    </div>

    <div class="form-group">
      <input type="hidden" name="approval_status" value="待审批">
    </div>

    <div class="form-group">
      <input type="text" name="reporting_of_results" value="成果汇报">
    </div>

    <div class="form-group">
      <span>${declare}</span>
      <input type="submit" value="提交申请">
      <a href="${pageContext.request.contextPath}/Scientific_research_project/declare_list">返回</a>
    </div>
    <%
      session.removeAttribute("declare");
    %>
  </form>
</div>
</body>
</html>