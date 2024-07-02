<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Users</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            margin-top: 50px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Manage Users</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Active</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.userID}</td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>${user.role.roleName}</td>
                <td><c:choose>
                    <c:when test="${user.isActive}">Yes</c:when>
                    <c:otherwise>No</c:otherwise>
                </c:choose></td>
                <td>
                    <a href="/admin/user/edit?id=${user.userID}" class="btn btn-warning btn-sm">Edit</a>
                    <c:if test="${user.ban.reason == null}">
                        <a href="/admin/user/ban?id=${user.userID}" class="btn btn-danger btn-sm">Ban</a>
                    </c:if>
                    <c:if test="${user.ban.reason != null}">
                        <a href="/admin/user/unban?id=${user.userID}" class="btn btn-success btn-sm">Unban</a>
                    </c:if>
                    <a href="/admin/user/delete?id=${user.userID}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
