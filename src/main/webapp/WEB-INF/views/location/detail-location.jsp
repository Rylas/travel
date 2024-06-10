<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Location Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .location-banner {
            width: 100%;
            height: 400px;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .location-image {
            width: 100%;
            height: 300px;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .location-details {
            margin-bottom: 30px;
        }
        .location-details h2 {
            margin-bottom: 20px;
            font-size: 2.5rem;
            font-weight: bold;
        }
        .location-details p {
            font-size: 1.1rem;
        }
        .details-list {
            font-size: 1rem;
        }
        .details-list li {
            margin-bottom: 10px;
        }
        .table thead th {
            background-color: #343a40;
            color: #fff;
        }
        .table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="location-details">
        <img src="/uploads/location/${location.banner}" alt="Location Banner" class="location-banner img-fluid rounded">
        <h2>${location.name}</h2>
        <p>${location.description}</p>
        <img src="/uploads/location/${location.image}" alt="Location Image" class="location-image img-fluid rounded">
        <div class="row">
            <div class="col-md-6">
                <h4>Details</h4>
                <ul class="list-unstyled details-list">
                    <li><strong>Address:</strong> ${location.address}</li>
                    <li><strong>Phone:</strong> ${location.phone}</li>
                    <li><strong>Status:</strong> ${location.status ? "Active" : "Inactive"}</li>
                    <li><strong>Number of Customers:</strong> ${location.numberCustomer}</li>
                    <li><strong>Created At:</strong> ${location.createdAt}</li>
                    <li><strong>Updated At:</strong> ${location.updatedAt}</li>
                </ul>
            </div>
        </div>
        <div class="tours mt-4">
            <h4>Tours</h4>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Tour Name</th>
                    <th>Description</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Price</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="tour" items="${location.tours}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td><a href="/details/tour/${tour.tourId}">${tour.name}</a></td>
                        <td>${tour.description}</td>
                        <td>${tour.startDate}</td>
                        <td>${tour.endDate}</td>
                        <td class="price">${tour.price}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        $(".price").each(function() {
            var price = $(this).text();
            var formattedPrice = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
            $(this).text(formattedPrice);
        });
    });
</script>
</body>
</html>
