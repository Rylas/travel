<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Schedule</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>

    <style>
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-submit {
            background-color: #007bff;
            color: white;
            border-radius: 30px;
            font-size: 16px;
            padding: 10px 20px;
            transition: all 0.3s;
        }
        .btn-submit:hover {
            background-color: #0056b3;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Add New Schedule</h2>
    <form action="/admin/tour/schedule/add" method="post">
        <input type="text" hidden value="${tourID}" name="tourID">
        <div class="form-group">
            <label for="timeStart">Time Start</label>
            <input type="time" class="form-control" id="timeStart" name="timeStart" required>
        </div>
        <div class="form-group">
            <label for="timeEnd">Time End</label>
            <input type="time" class="form-control" id="timeEnd" name="timeEnd" required>
        </div>
        <div class="form-group">
            <label for="date">Date</label>
            <input type="date" class="form-control" id="date" name="date" required>
        </div>
        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>
        <div class="form-group">
            <label for="editor">Description</label>
            <textarea class="form-control" id="editor" name="description" required></textarea>
        </div>
        <div class="form-group">
            <label for="locationID">Location</label>
            <select class="form-control" id="locationID" name="locationID" required>
                <c:forEach var="location" items="${locations}">
                    <option value="${location.locationID}">${location.nameLocation}</option>
                </c:forEach>
            </select>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-submit">Add Schedule</button>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    CKEDITOR.replace('editor', {
        filebrowserUploadUrl: '/uploadImage',
        filebrowserUploadMethod: 'form'
    });
</script>
</body>
</html>
