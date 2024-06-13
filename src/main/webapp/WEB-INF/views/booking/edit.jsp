<%--
  Created by IntelliJ IDEA.
  User: tripm
  Date: 6/10/2024
  Time: 8:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Booking</title>
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
            document.getElementById("totalAmountDisplay").innerText = "Total Amount: " + formattedPrice + " VND"
            document.getElementById("totalAmountDisplay").value = totalAmount;
        }
    </script>
</head>
<body>
<div class="container">
    <h2 class="text-center">Edit Booking</h2>
    <form action="/booking/edit" method="post">
        <input type="hidden" name="id" value="${booking.id}">
        <input type="hidden" id="price" value="${booking.tour.price}">
        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" class="form-control" id="name" name="name" value="${booking.name}" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="${booking.email}" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" class="form-control" id="phone" name="phone" value="${booking.phone}" required>
        </div>
        <div class="form-group">
            <label for="numberOfPeople">Number of People</label>
            <input type="number" class="form-control" id="numberOfPeople" name="numberOfPeople" value="${booking.numberOfPeople}" oninput="calculateTotal()" required>

        </div>
        <div class="form-group">
            <label for="message">Message</label>
            <textarea class="form-control" id="message" name="message" rows="3">${booking.message}</textarea>
        </div>
        <div class="form-group">
            <label for="voucher">Voucher</label>
            <input type="text" class="form-control" id="voucher" name="voucher" value="${booking.voucher}">
        </div>
        <div class="form-group">
            <label for="paymentMethod">Payment Method</label>
            <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                <option value="Cash" ${booking.paymentMethod == 'Cash' ? 'selected' : ''}>Cash</option>
                <option value="Credit Card" ${booking.paymentMethod == 'Credit Card' ? 'selected' : ''}>Credit Card</option>
            </select>
        </div>
        <div class="form-group">
            <h4 id="totalAmountDisplay">Total Amount: ${booking.totalAmount} VND</h4>
            <input name="totalAmount" type="hidden" value="${booking.totalAmount}" id="totalAmount">
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-submit">Update Booking</button>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
