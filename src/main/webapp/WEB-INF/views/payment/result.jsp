<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kết quả thanh toán</title>
</head>
<body>
<h2>Kết quả thanh toán</h2>
<table border="1">
    <tr>
        <th>Thành phần</th>
        <th>Giá trị</th>
    </tr>
    <tr>
        <td>Amount</td>
        <td>${amount}</td>
    </tr>
    <tr>
        <td>Bank Code</td>
        <td>${bankCode}</td>
    </tr>
    <tr>
        <td>Card Type</td>
        <td>${cardType}</td>
    </tr>
    <tr>
        <td>Order Info</td>
        <td>${orderInfo}</td>
    </tr>
    <tr>
        <td>Pay Date</td>
        <td>${payDate}</td>
    </tr>
    <tr>
        <td>Response Code</td>
        <td>${responseCode}</td>
    </tr>
    <tr>
        <td>Tmn Code</td>
        <td>${tmnCode}</td>
    </tr>
    <tr>
        <td>Transaction No</td>
        <td>${transactionNo}</td>
    </tr>
    <tr>
        <td>Transaction Status</td>
        <td>${transactionStatus}</td>
    </tr>
    <tr>
        <td>Txn Ref</td>
        <td>${txnRef}</td>
    </tr>
    <tr>
        <td>Secure Hash</td>
        <td>${secureHash}</td>
    </tr>
</table>
</body>
</html>
