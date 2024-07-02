<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Schedules</title>
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
    <h2 class="text-center">Manage Schedules</h2>
<%--    Display Information about tour in model --%>



    <div class="row">
        <div class="col-md-12">
            <a href="/admin/tour/schedule/add?tourID=${tour.tourID}" class="btn btn-primary">Add New Schedule</a>
        </div>
    </div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>Time Start</th>
            <th>Time End</th>
            <th>Date</th>
            <th>Title</th>
            <th>Description</th>
            <th>Tour</th>
            <th>Location</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="schedule" items="${schedules}">
            <tr>
                <td>${schedule.scheduleID}</td>
                <td>${schedule.timeStart}</td>
                <td>${schedule.timeEnd}</td>
                <td>${schedule.date}</td>
                <td>${schedule.title}</td>
                <td>${schedule.description}</td>
                <td>${schedule.tour.nameTour}</td>
                <td>${schedule.location.nameLocation}</td>
                <td>
                    <a href="/admin/tour/schedule/edit?id=${schedule.scheduleID}" class="btn btn-warning btn-sm">Edit</a>
                    <a href="/admin/tour/schedule/delete?id=${schedule.scheduleID}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this schedule?');">Delete</a>
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
