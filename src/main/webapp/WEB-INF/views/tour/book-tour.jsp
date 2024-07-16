<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-section, .price-section {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .form-section .form-group label {
            font-weight: bold;
        }
        .price-section {
            background-color: #ffffff;
        }
        .price-section h5 {
            margin-bottom: 20px;
        }
        .price-section .price {
            color: red;
            font-weight: bold;
            font-size: 1.2rem;
        }
        .note {
            font-size: 0.9rem;
            color: #777;
        }
        .payment-method label {
            margin-right: 20px;
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
    </style>
</head>
<body>
<%@ include file="../material/navbar.jsp"%>

<form action="/bookTour" method="post" class="container mt-5" id="form-book">
    <input type="hidden" name="tourID" value="${tour.tourID}">
    <div class="row">
        <div class="col-md-8">
            <div class="form-section">
                <h4 class="text-primary">THÔNG TIN NGƯỜI ĐẶT</h4>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="name">Họ tên *</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Họ tên" value="${user.firstName} ${user.lastName}" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="phone">Số điện thoại *</label>
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="Số điện thoại" value="${user.phone}" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="address">Địa chỉ</label>
                        <input type="text" class="form-control" id="address" name="address" placeholder="Địa chỉ" value="${user.address}" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="email">Email *</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="${user.email}" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="departureDate">Ngày khởi hành *</label>
                        <input type="date" class="form-control" id="departureDate" name="departureDate" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="expectedDate">Ngày dự kiến (Không bắt buộc)</label>
                        <input type="date" class="form-control" id="expectedDate" name="expectedDate">
                    </div>
                </div>
                <div class="form-group">
                    <label for="note">Nội dung</label>
                    <textarea class="form-control" id="note" name="note" rows="3"></textarea>
                </div>
                <h4 class="text-primary">HÌNH THỨC THANH TOÁN</h4>
                <div class="payment-method">
                    <c:forEach var="payment" items="${payments}">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymentID" id="${payment.paymentMethod}" value="${payment.paymentID}" checked>
                            <label class="form-check-label" for="${payment.paymentMethod}">${payment.paymentMethod}</label>
                        </div>
                    </c:forEach>
                </div>
                <div class="form-group mt-4">
                    <label for="voucher">Mã voucher</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="voucher" name="voucher" placeholder="Nhập mã voucher">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" onclick="applyVoucher()">Áp dụng</button>
                        </div>
                    </div>
                    <small id="voucherMessage" class="form-text text-muted"></small>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="price-section">
                <h5 class="text-primary">GIÁ TOUR</h5>
                <div class="form-group">
                    <label for="totalAdults">Người lớn</label>
                    <input type="number" class="form-control" id="totalAdults" name="totalAdults" value="1" min="0" onchange="calculateTotal()">
                    <span class="note">x <fmt:formatNumber value="${tour.priceAdult}" type="number" groupingUsed="true" />đ = <span id="adultPrice">7.490.000đ</span></span>
                </div>
                <div class="form-group">
                    <label for="totalChildren6_10">Trẻ em (6-10 tuổi)</label>
                    <input type="number" class="form-control" id="totalChildren6_10" name="totalChildren6_10" value="0" min="0" onchange="calculateTotal()">
                    <span class="note">x <fmt:formatNumber value="${tour.priceChild6_10}" type="number" groupingUsed="true" />đ = <span id="child1Price">0</span></span>
                </div>
                <div class="form-group">
                    <label for="totalChildren2_5">Em bé (2-5 tuổi)</label>
                    <input type="number" class="form-control" id="totalChildren2_5" name="totalChildren2_5" value="0" min="0" onchange="calculateTotal()">
                    <span class="note">x <fmt:formatNumber value="${tour.priceChild2_5}" type="number" groupingUsed="true" />đ = <span id="child2Price">0</span></span>
                </div>
                <div class="form-group">
                    <label for="totalChildren2">Em bé (<2 tuổi)</label>
                    <input type="number" class="form-control" id="totalChildren2" name="totalChildren2" value="0" min="0" onchange="calculateTotal()">
                    <span class="note">x <fmt:formatNumber value="${tour.priceChild2}" type="number" groupingUsed="true" />đ = <span id="infantPrice">0</span></span>
                </div>
                <div class="form-group">
                    <h5 class="text-primary">Tổng tiền: <span class="price" id="totalPrice">0đ</span></h5>

                </div>
                <div class="form-group">
                    <h5 class="text-primary">Ghi chú:</h5>
                    <ul>
                        <li>Người lớn (Từ 11 tuổi trở lên)</li>
                        <li>Trẻ em (Từ 6 tuổi đến dưới 10 tuổi - Ngủ chung người lớn)</li>
                        <li>Em bé (Dưới 6 tuổi - Ngủ chung người lớn)</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="text-center">
        <button type="submit" class="btn btn-book mt-3">Đặt Tour</button>
    </div>
</form>
<%@ include file="../material/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
    let amount = 0;
    $('#form-book').submit(function(e) {
        // Prevent the form from submitting via the browser.
        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: '/payment/pay',
            data: {
                amount: amount,
        currency: 'VND',
                bankCode: null,
                language: 'vn',
            },
            success: function(response) {
                if (response.code == "00") {
                    $.ajax({
                        type: 'POST',
                        url: '/bookTour',
                        data: $('#form-book').serialize(),
                        success: function(response) {
                            alert('Đặt tour thành công. Đang chuyển hướng đến trang thanh toán...');
                        },
                        error: function(error) {
                            alert('Đặt tour thất bại. Vui lòng thử lại.');
                        }
                    });
                    window.location.href = response.data;

                }
            },
            error: function(error) {
                alert('Đặt tour thất bại. Vui lòng thử lại.');
            }
        });
    });
    const adultPrice = ${tour.priceAdult};
    const child1Price = ${tour.priceChild6_10};
    const child2Price = ${tour.priceChild2_5};
    const infantPrice = ${tour.priceChild2};
    let discount = 0;
    let discountType = false;
    let maxDiscount = 0;

    function formatCurrency(number) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(number);
    }

    function calculateTotal() {
        const adultCount = parseInt(document.getElementById('totalAdults').value) || 0;
        const child1Count = parseInt(document.getElementById('totalChildren6_10').value) || 0;
        const child2Count = parseInt(document.getElementById('totalChildren2_5').value) || 0;
        const infantCount = parseInt(document.getElementById('totalChildren2').value) || 0;

        const totalAdultPrice = adultCount * adultPrice;
        const totalChild1Price = child1Count * child1Price;
        const totalChild2Price = child2Count * child2Price;
        const totalInfantPrice = infantCount * infantPrice;

        let totalPrice = totalAdultPrice + totalChild1Price + totalChild2Price + totalInfantPrice;

        if (discountType) {  // If discount is a percentage
            discountAmount = totalPrice * (discount / 100);
            if (discountAmount > maxDiscount) {
                discountAmount = maxDiscount;
            }
        } else {  // If discount is a fixed amount
            discountAmount = discount;
        }
        totalPrice -= discountAmount;

        document.getElementById('adultPrice').innerText = formatCurrency(totalAdultPrice);
        document.getElementById('child1Price').innerText = formatCurrency(totalChild1Price);
        document.getElementById('child2Price').innerText = formatCurrency(totalChild2Price);
        document.getElementById('infantPrice').innerText = formatCurrency(totalInfantPrice);
        document.getElementById('totalPrice').innerText = formatCurrency(totalPrice);
        amount = totalPrice;
    }

    function applyVoucher() {
        const voucherCode = $('#voucher').val();

        $.ajax({
            url: '/checkVoucher',  // Đường dẫn đến API kiểm tra voucher trên server
            type: 'POST',
            data: { code: voucherCode },
            success: function(response) {
                if (response.valid) {
                    discount = response.discountAmount;
                    discountType = response.discountType;
                    maxDiscount = response.maxValue;
                    $('#voucherMessage').text('Voucher applied successfully!').css('color', 'green');
                } else {
                    discount = 0;
                    discountType = false;
                    maxDiscount = 0;
                    $('#voucherMessage').text('Invalid voucher code.').css('color', 'red');
                }
                calculateTotal();
            },
            error: function() {
                discount = 0;
                discountType = false;
                maxDiscount = 0;
                $('#voucherMessage').text('Error checking voucher. Please try again.').css('color', 'red');
                calculateTotal();
            }
        });
    }

    $(document).ready(function() {
        calculateTotal();
    });
</script>


</body>
</html>
