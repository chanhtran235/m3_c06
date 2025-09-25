<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 9/25/2025
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/sum" method="post">
    <h2>Tính tổng</h2>
    <input name="n1" value="${num1}">
    <input name="n2" value="${num2}">
    <button>Sum</button>
</form>
<h3>Kêt quả: ${sum}</h3>
</body>
</html>
