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
    <c:import url="../layout/library.jsp"/>
</head>
<body>
<c:import url="../layout/navbar.jsp"/>
<a href="/students?action=add"> Thêm mới </a>
<h1>Danh sách sinh viên</h1>
<table class="table table-dark table-striped">
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Tên</th>
        <th>Giới tính</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
    </tr>
    <c:forEach var="student" items="${studentList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>
                <c:if test="${student.gender}">Nam</c:if>
                <c:if test="${!student.gender}">Nữ</c:if>
            </td>
            <td><c:out value="${student.score}"></c:out></td>
            <td>
                <c:choose>
                    <c:when test="${student.score>=8}">Giỏi</c:when>
                    <c:when test="${student.score>=7}"> Khá </c:when>
                    <c:when test="${student.score>=5}"> Trung Bình </c:when>
                    <c:otherwise>Yêu sắc yếu</c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
