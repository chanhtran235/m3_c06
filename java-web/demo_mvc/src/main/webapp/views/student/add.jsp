<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 9/26/2025
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <title>Title</title>
    <c:import url="../layout/library.jsp"/>
</head>
<body>
<c:import url="../layout/navbar.jsp"/>
<h1>Thêm mới</h1>
<form action="/students?action=add" method="post">
    ID
    <input name="id"><br>
    Tên
    <input name="name"><br>
    Giới tính
    <input type="radio" name="gender" value="1">Nam
    <input type="radio" name="gender" value="0">Nữ<br>
    Điêểm
    <input name="score"><br>
    <button>Lưud</button>
</form>
</body>
</html>
