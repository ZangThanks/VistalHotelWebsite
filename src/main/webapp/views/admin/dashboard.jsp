<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | Vista Hotel</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/logo.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/global.css">
    <style>
    </style>
    </head>
<body class="min-h-screen bg-gray-100">
<div class="max-w-6xl mx-auto px-6 py-8">
    <div class="mt-8 p-6 bg-white rounded-xl shadow">
        <p>Xin chào, ${sessionScope.currentUser.fullName}!</p>
    </div>
    </div>
</body>
</html>



