<%--
  Created by IntelliJ IDEA.
  User: 27757
  Date: 2023/5/22
  Time: 3:21
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
    <form action="${pageContext.request.contextPath}/Scientific_research_project/Patent_management_edit" method="post" enctype="multipart/form-data">

        <input type="hidden" name="id" value="${by_id_research_projects.id}">

        <div class="form-group">
            <label for="project_number">项目编号:</label>
            <input type="text" id="project_number" name="project_number" value="${by_id_research_projects.project_number}" required>
        </div>
        <div class="form-group">
            <label for="project_name">项目名称:</label>
            <input type="text" id="project_name" name="project_name" value="${by_id_research_projects.project_name}" required>
        </div>
        <div class="form-group">
            <label for="project_leader">项目负责人:</label>
            <input type="text" id="project_leader" name="project_leader" value="${by_id_research_projects.project_leader}" required>
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
            <input type="text" id="subject" name="subject" value="${by_id_research_projects.subject}" required>
        </div>
        <div class="form-group">
            <label for="budget">预算经费:</label>
            <input type="text" id="budget" name="budget" value="${by_id_research_projects.budget}" required>
        </div>

        <div class="form-group">
            <label for="reporting_of_results">成果汇报:</label>
            <input type="text" name="reporting_of_results" value="${by_id_research_projects.reporting_of_results}">
        </div>

        <div class="form-group">
            <label for="Patent_number">专利号:</label>
            <input type="text" name="Patent_number" value="${by_id_research_projects.patent_number}">
        </div>

        <div class="form-group">
            <input type="submit" value="提交申请">
            <a href="${pageContext.request.contextPath}/Scientific_research_project/Patent_administration"> 返回 </a>
        </div>
    </form>
</div>
</body>
</html>
