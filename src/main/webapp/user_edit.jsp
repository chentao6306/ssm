<%--
  Created by IntelliJ IDEA.
  User: 27757
  Date: 2023/5/21
  Time: 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>用户信息编辑</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
    }

    .container {
      width: 300px;
      margin: 50px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .form-group input[type="text"],
    .form-group input[type="password"],
    .form-group select {
      width: 100%;
      padding: 5px;
      border-radius: 3px;
      border: 1px solid #ccc;
    }

    .form-group select {
      height: 30px;
    }

    .form-group .button {
      display: inline-block;
      background-color: #333;
      color: #fff;
      padding: 5px 10px;
      text-decoration: none;
      border-radius: 3px;
      cursor: pointer;
    }

    .form-group .button:hover {
      background-color: #666;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>用户信息编辑</h2>
  <form action="${pageContext.request.contextPath}/user/update" method="POST">

    <input type="hidden" name="id" value="${user.id}">

    <div class="form-group">
      <label for="account">账号:</label>
      <input type="text" id="account" name="account" placeholder="请输入账号" value="${user.account}" required>
    </div>
    <div class="form-group">
      <label for="password">密码:</label>
      <input type="text" id="password" name="password" placeholder="请输入密码" value="${user.password}" required>
    </div>
    <div class="form-group">
      <label for="role">角色:</label>
      <select id="role" name="role" required>
        <option>请选择角色</option>
        <option value="管理员">管理员</option>
        <option value="教师">教师</option>
        <option value="研究生">研究生</option>
      </select>
    </div>
    <div class="form-group">
      <input type="submit" value="保存" class="button">
      <a href="${pageContext.request.contextPath}/user/">返回</a>
    </div>
  </form>
</div>
</body>
</html>
