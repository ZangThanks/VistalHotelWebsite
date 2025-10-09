<%--
  Created by IntelliJ IDEA.
  User: TRAN LONG VU
  Date: 10/8/2025
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu | Vista Hotel</title>
    <link href="assets/css/tailwind.output.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/logo.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/auth.css">
    <script src="${pageContext.request.contextPath}/assets/js/validation.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/auth.js"></script>

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        gold: '#d4af6a',
                    }
                }
            }
        };
    </script>
</head>

<body class="min-h-screen bg-cover bg-center bg-no-repeat flex items-center justify-center relative"
      style="background-image: url('${pageContext.request.contextPath}/assets/images/resort-bg.png');">

<!-- Overlay -->
<div class="absolute inset-0 bg-black/50"></div>

<!-- Card -->
<div class="relative z-10 bg-slate-500/25 backdrop-blur-[15px] rounded-3xl shadow-2xl w-full max-w-[570px] mx-4 flex flex-col overflow-hidden">
    <div class="p-8 overflow-y-auto scroll-content">

        <!-- Header -->
        <div class="text-center mb-8">
            <img src="${pageContext.request.contextPath}/assets/images/vista-logo-white.png" class="mx-auto w-[100px] mb-2">
            <h1 class="text-2xl font-normal text-white mb-2">Đặt lại mật khẩu</h1>
            <p class="text-gray-400 text-sm">Nhập mật khẩu mới cho tài khoản của bạn</p>
        </div>

        <form id="resetForm" action="reset-password" method="post">
            <!-- New password -->
            <div class="relative mb-6">
                <i class="fa-solid fa-lock absolute left-0 top-[8px] text-white/50 text-sm"></i>
                <input type="password"
                       name="newPassword"
                       id="newPassword"
                       placeholder=" "
                       class="input-field w-full bg-transparent border-0 border-b border-white/20 pl-6 pr-8 py-2 text-white text-sm outline-none focus:outline-none focus:border-gold focus:ring-0 transition-all duration-300">
                <label for="newPassword"
                       class="floating-label absolute left-6 top-2 text-gray-400 text-sm transition-all duration-300 pointer-events-none">
                    Mật khẩu mới
                </label>
                <i class="far fa-eye absolute right-0 top-2 text-white/50 hover:text-white/80 cursor-pointer transition-colors"
                   onclick="togglePassword('newPassword', this)"></i>
                <span class="text-red-400 text-xs mt-1 block min-h-[18px]" id="newPasswordError"></span>
            </div>

            <!-- Confirm password-->
            <div class="relative mb-6">
                <i class="fa-solid fa-shield-halved absolute left-0 top-[8px] text-white/50 text-sm"></i>
                <input type="password"
                       name="confirmPassword"
                       id="confirmPassword"
                       placeholder=" "
                       class="input-field w-full bg-transparent border-0 border-b border-white/20 pl-6 pr-8 py-2 text-white text-sm outline-none focus:outline-none focus:border-gold focus:ring-0 transition-all duration-300">
                <label for="confirmPassword"
                       class="floating-label absolute left-6 top-2 text-gray-400 text-sm transition-all duration-300 pointer-events-none">
                    Xác nhận mật khẩu
                </label>
                <i class="far fa-eye absolute right-0 top-2 text-white/50 hover:text-white/80 cursor-pointer transition-colors"
                   onclick="togglePassword('confirmPassword', this)"></i>
                <span class="text-red-400 text-xs mt-1 block min-h-[18px]" id="confirmPasswordError"></span>
            </div>

            <!-- Submit -->
            <button type="submit"
                    class="w-full py-3 bg-gradient-to-r from-gold to-[#c5a05a] text-white font-medium rounded-xl text-base mt-2 hover:-translate-y-0.5 hover:shadow-lg hover:shadow-gold/30 transition-all duration-300 active:translate-y-0">
                Cập nhật mật khẩu
            </button>

            <!-- Server messages -->
            <% if (request.getAttribute("error") != null) { %>
            <div class="bg-red-500/20 border border-red-500/30 text-red-200 px-4 py-3 rounded-xl text-center text-sm mt-4">
                ${error}
            </div>
            <% } %>

            <% if (request.getAttribute("success") != null) { %>
            <div class="bg-emerald-500/20 border border-emerald-500/30 text-emerald-200 px-4 py-3 rounded-xl text-center text-sm mt-4">
                ${success}
            </div>
            <% } %>

            <!-- Back -->
            <div class="text-center mt-4">
                <a href="login" class="text-gold hover:underline text-sm">
                    ← Quay lại đăng nhập
                </a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
