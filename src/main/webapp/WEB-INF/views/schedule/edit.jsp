<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Schedule</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
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
<%@ include file="../material/navbar.jsp" %>
<div class="container">
  <h2 class="text-center">Edit Schedule</h2>
  <form action="/admin/tour/schedule/update" method="post">
    <input type="hidden" name="scheduleID" value="${schedule.scheduleID}">
    <div class="form-group">
      <label for="timeStart">Time Start</label>
      <input type="time" class="form-control" id="timeStart" name="timeStart" value="${schedule.timeStart}" required>
    </div>
    <div class="form-group">
      <label for="timeEnd">Time End</label>
      <input type="time" class="form-control" id="timeEnd" name="timeEnd" value="${schedule.timeEnd}" required>
    </div>
    <div class="form-group">
      <label for="date">Date</label>
      <input type="date" class="form-control" id="date" name="date" value="${schedule.date}" required>
    </div>
    <div class="form-group">
      <label for="title">Title</label>
      <input type="text" class="form-control" id="title" name="title" value="${schedule.title}" required>
    </div>
    <div class="form-group">
      <label for="description">Description</label>
      <textarea class="form-control" id="description" name="description" required>${schedule.description}</textarea>
    </div>
    <div class="form-group">
      <label for="locationID">Location</label>
      <select class="form-control" id="locationID" name="locationID" required>
        <c:forEach var="location" items="${locations}">
          <option value="${location.locationID}" <c:if test="${schedule.location.locationID == location.locationID}">selected</c:if>>${location.nameLocation}</option>
        </c:forEach>
      </select>
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-submit">Update Schedule</button>
    </div>
  </form>
</div>
<%@ include file="../material/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
