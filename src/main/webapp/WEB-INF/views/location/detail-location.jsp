<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Location Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            cursor: pointer;
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
        .modal-dialog img {
            width: 100%;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="location-details">
        <img src="/uploads/location/${location.banner}" alt="Location Banner" class="location-banner img-fluid rounded">
        <h2>${location.nameLocation}</h2>
        <p>${location.description}</p>
        <div class="row">
            <div class="col-md-4">
                <img src="/uploads/location/${location.firstImage}" alt="Location Image 1" class="location-image img-fluid rounded" data-toggle="modal" data-target="#imageModal" data-src="/uploads/location/${location.firstImage}">
            </div>
            <div class="col-md-4">
                <img src="/uploads/location/${location.secondImage}" alt="Location Image 2" class="location-image img-fluid rounded" data-toggle="modal" data-target="#imageModal" data-src="/uploads/location/${location.secondImage}">
            </div>
            <div class="col-md-4">
                <img src="/uploads/location/${location.thirdImage}" alt="Location Image 3" class="location-image img-fluid rounded" data-toggle="modal" data-target="#imageModal" data-src="/uploads/location/${location.thirdImage}">
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-6">
                <h4>Details</h4>
                <ul class="list-unstyled details-list">
                    <li><strong>Created At:</strong> ${location.createdAt}</li>
                    <li><strong>Updated At:</strong> ${location.updatedAt}</li>
                    <li><strong>Views:</strong> ${location.numberViewed} </li>
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
                        <td><a href="/details/tour/${tour.tourID}">${tour.nameTour}</a></td>
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

<!-- Image Modal -->
<div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="imageModalLabel">Image Preview</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <img src="" id="imagePreview" class="img-fluid rounded">
            </div>
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

        $('.location-image').on('click', function() {
            var src = $(this).data('src');
            $('#imagePreview').attr('src', src);
        });
    });
</script>
</body>
</html>
