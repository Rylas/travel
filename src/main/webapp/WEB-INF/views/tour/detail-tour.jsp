<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tour Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .tour-banner {
            width: 100%;
            height: 400px;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .tour-image {
            width: 100%;
            height: 300px;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .tour-details {
            margin-bottom: 30px;
        }
        .tour-details h2 {
            margin-bottom: 20px;
            font-size: 2.5rem;
            font-weight: bold;
        }
        .tour-details p {
            font-size: 1.1rem;
        }
        .details-list {
            font-size: 1rem;
        }
        .details-list li {
            margin-bottom: 10px;
        }
        .btn-book {
            background-color: #007bff;
            color: white;
            border-radius: 30px;
            font-size: 16px;
            padding: 10px 20px;
            transition: all 0.3s;
        }
        .btn-book:hover {
            background-color: #0056b3;
            color: white;
        }
        .card-body h5 {
            font-size: 1.2rem;
            font-weight: bold;
        }
        .card-body p {
            font-size: 1rem;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="tour-details">
        <img src="/uploads/tour/${tour.banner}" alt="Tour Banner" class="tour-banner img-fluid rounded">
        <h2>${tour.name}</h2>
        <p class="text-muted">By ${tour.enterprise.name}</p>
        <p>${tour.description}</p>
        <img src="/uploads/tour/${tour.image}" alt="Tour Image" class="tour-image img-fluid rounded">
        <div class="row">
            <div class="col-md-6">
                <h4>Details</h4>
                <ul class="list-unstyled details-list">
                    <li><strong>Price:</strong> ${tour.price}</li>
                    <li><strong>Start Date:</strong> ${tour.startDate}</li>
                    <li><strong>End Date:</strong> ${tour.endDate}</li>
                    <li><strong>Transport:</strong> ${tour.transport}</li>
                    <li><strong>Number of Customers:</strong> ${tour.numberCustomer}</li>
                    <li><strong>Created At:</strong> ${tour.createdAt}</li>
                    <li><strong>Number of Viewers: </strong> ${tour.numberView} </li>
                </ul>
            </div>
            <div class="col-md-6">
                <h4>Locations</h4>
                <ul class="list-group">
                    <c:forEach var="location" items="${tour.locations}">
                        <li class="list-group-item">
                            <a href="/details/location/${location.locationId}">${location.name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="tour-schedule mt-4">
            <h4>Schedule</h4>
            <p>${tour.schedule}</p>
        </div>
        <div class="tour-reviews mt-4">
            <h4>Reviews</h4>
            <c:forEach var="review" items="${tour.reviews}">
                <div class="card mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Review by ${review.user.lastName} ${review.user.firstName}</h5>
                        <p class="card-text">${review.comment}</p>
                        <p class="card-text"><small class="text-muted">${review.createdAt}</small></p>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="text-center mt-4">
            <a href="/bookTour/${tour.tourId}" class="btn btn-book">Book Tour</a>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
