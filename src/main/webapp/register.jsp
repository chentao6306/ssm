<%--
  Created by IntelliJ IDEA.
  User: 27757
  Date: 2023/5/18
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>注册页面</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 400px;
            padding: 60px;
            background-color: #ffffff;
            border: 1px solid #e6e6e6;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group input[type="password"],
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group select {
            height: 36px;
        }

        .form-group .role-label {
            display: inline-block;
            margin-right: 10px;
        }

        .form-group .role-option {
            margin-right: 5px;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>注册</h2>
    <form action="${pageContext.request.contextPath}/user/register" method="POST">
        <div class="form-group">
            <label for="account">账号:</label>
            <input type="text" id="account" name="account" required>
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <a href="login.jsp">登录</a>
            <%--@declare id="role"--%>
            <label for="role">角色:</label>
            <input type="radio" id="role-teacher" name="role" value="教师" class="role-option" required>
            <span class="role-label">教师</span>
            <input type="radio" id="role-graduate" name="role" value="研究生" class="role-option" required>
            <span class="role-label">研究生</span>
            <input type="radio" id="role-admin" name="role" value="管理员" class="role-option" required>
            <span class="role-label">管理员</span>
        </div>
        <div class="form-group">
            <button type="submit">注册</button>
        </div>
    </form>
</div>
</body>
</html>