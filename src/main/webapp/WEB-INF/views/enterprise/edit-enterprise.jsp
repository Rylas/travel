<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Enterprise</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<%@ include file="../material/navbar.jsp" %>
<div class="container">
    <h1 class="mb-4">Edit Enterprise</h1>
    <form action="/admin/enterprise/edit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="enterpriseID" value="${enterprise.enterpriseID}">
        <div class="form-group">
            <label for="nameEnterprise">Enterprise name:</label>
            <input type="text" class="form-control" id="nameEnterprise" name="nameEnterprise" value="${enterprise.nameEnterprise}" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3" required>${enterprise.description}</textarea>
        </div>
        <div class="form-group">
            <label for="image-file">Logo</label>
            <input type="text" name="logo" value="${enterprise.logo}" hidden="true">
            <input type="file" class="form-control-file" id="image-file" name="image-file">
            <img src="/uploads/enterprise/${enterprise.logo}" alt="${enterprise.nameEnterprise}" class="img-thumbnail mt-2" width="150">
        </div>
        <div class="form-group">
            <label for="banner-file">Banner</label>
            <input type="text" name="banner" value="${enterprise.banner}" hidden="true">
            <input type="file" class="form-control-file" id="banner-file" name="banner-file">
            <img src="/uploads/enterprise/${enterprise.banner}" alt="${enterprise.nameEnterprise}" class="img-thumbnail mt-2" width="150">
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" class="form-control" id="address" name="address" value="${enterprise.address}" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="text" class="form-control" id="phone" name="phone" value="${enterprise.phone}" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="${enterprise.email}" required>
        </div>
        <div class="form-group">
            <label for="website">Website</label>
            <input type="text" class="form-control" id="website" name="website" value="${enterprise.website}" required>
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option value="true" ${enterprise.status ? 'selected' : ''}>Active</option>
                <option value="false" ${!enterprise.status ? 'selected' : ''}>Inactive</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Update Enterprise</button>
    </form>
</div>
<%@ include file="../material/footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
