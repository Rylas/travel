<%--
  Created by IntelliJ IDEA.
  User: tripm
  Date: 6/10/2024
  Time: 8:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Tour</title>
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
    <script>
        function calculateTotal() {
            var pricePerPerson = parseFloat(document.getElementById("price").value);
            var numberOfPeople = parseInt(document.getElementById("numberOfPeople").value);
            if (isNaN(numberOfPeople)) {
                numberOfPeople = 0;
            }
            var totalAmount = parseInt(pricePerPerson * numberOfPeople);
            var formattedPrice = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(totalAmount);
            document.getElementById("totalAmount").innerText = "Total Amount: " + formattedPrice + " VND"
            document.getElementById("totalAmount").value = totalAmount;
        }
    </script>
</head>
<body>
<div class="container">
    <h2 class="text-center">Book Tour</h2>
    <form action="/bookTour" method="post">
        <input type="hidden" name="tourId" value="${tour.tourId}">
        <input type="hidden" id="price" value="${tour.price}">
        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" class="form-control" id="phone" name="phone" required>
        </div>
        <div class="form-group">
            <label for="numberOfPeople">Number of People</label>
            <input type="number" class="form-control" id="numberOfPeople" name="numberOfPeople" oninput="calculateTotal()" required>
        </div>
        <div class="form-group">
            <label for="message">Message</label>
            <textarea class="form-control" id="message" name="message" rows="3"></textarea>
        </div>
        <div class="form-group">
            <label for="voucher">Voucher</label>
            <input type="text" class="form-control" id="voucher" name="voucher">
        </div>
        <div class="form-group">
            <label for="paymentMethod">Payment Method</label>
            <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                <option value="Cash">Cash</option>
                <option value="Credit Card">Credit Card</option>
            </select>
        </div>
        <div class="form-group">
            <h4 id="totalAmount">Total Amount: 0 VND</h4>
            <input name="totalAmount" type="hidden" value="0" id="totalAmount">
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-submit">Book Now</button>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
