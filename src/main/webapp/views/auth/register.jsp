<%--
  Created by IntelliJ IDEA.
  User: TRAN LONG VU
  Date: 10/7/2025
  Time: 12:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký | Vista Hotel</title>
    <script src="https://cdn.tailwindcss.com"></script>
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

<%--Overlay--%>
<div class="absolute inset-0 bg-black/50"></div>

<%--Main Card--%>
<div class="relative z-10 bg-slate-500/25 backdrop-blur-[15px] rounded-3xl shadow-2xl w-full max-w-[570px] mx-4 max-h-[95vh] flex flex-col overflow-hidden">

    <div class="p-8 overflow-y-auto scroll-content">
        <!-- Header -->
        <div class="text-center mb-8">
            <div class="inline-flex items-center justify-center w-[100px] h-[100px] mb-2">
                <img src="${pageContext.request.contextPath}/assets/images/vista-logo-white.png" alt="Vista Logo">
            </div>
            <h1 class="text-2xl font-normal text-white mb-2">Đăng ký</h1>
            <p class="text-gray-400 text-sm">Khởi đầu hành trình của bạn</p>
        </div>

        <form action="${pageContext.request.contextPath}/register" method="post" id="registerForm">

            <!-- Full Name -->
            <div class="relative mb-6">
                <i class="fa-regular fa-user absolute left-0 top-[8px] text-white/50 text-sm"></i>
                <input type="text"
                       name="fullName"
                       id="fullName"
                       placeholder=" "
                       class="input-field w-full bg-transparent border-0 border-b border-white/20 pl-6 py-2 text-white text-sm outline-none focus:outline-none focus:border-gold focus:ring-0 transition-all duration-300">
                <label for="fullName"
                       class="floating-label absolute left-6 top-2 text-gray-400 text-sm transition-all duration-300 pointer-events-none">
                    Họ và tên
                </label>
                <span class="text-red-400 text-xs mt-1 block min-h-[18px]" id="fullNameError"></span>
            </div>

            <!-- Email -->
            <div class="relative mb-6">
                <i class="fa-regular fa-envelope absolute left-0 top-[8px] text-white/50 text-sm"></i>
                <input type="text"
                       name="email"
                       id="email"
                       placeholder=" "
                       class="input-field w-full bg-transparent border-0 border-b border-white/20 pl-6 py-2 text-white text-sm outline-none focus:outline-none focus:border-gold focus:ring-0 transition-all duration-300">
                <label for="email"
                       class="floating-label absolute left-6 top-2 text-gray-400 text-sm transition-all duration-300 pointer-events-none">
                    Email hoặc Số điện thoại
                </label>
                <span class="text-red-400 text-xs mt-1 block min-h-[18px]" id="emailError"></span>
            </div>

            <!-- Password -->
            <div class="relative mb-6">
                <i class="fa-solid fa-lock absolute left-0 top-[8px] text-white/50 text-sm"></i>
                <input type="password"
                       name="password"
                       id="password"
                       placeholder=" "
                       class="input-field w-full bg-transparent border-0 border-b border-white/20 pl-6 pr-8 py-2 text-white text-sm outline-none focus:outline-none focus:border-gold focus:ring-0 transition-all duration-300">
                <label for="password"
                       class="floating-label absolute left-6 top-2 text-gray-400 text-sm transition-all duration-300 pointer-events-none">
                    Mật khẩu
                </label>
                <i class="far fa-eye absolute right-0 top-2 text-white/50 hover:text-white/80 cursor-pointer transition-colors"
                   onclick="togglePassword('password', this)"></i>
                <span class="text-red-400 text-xs mt-1 block min-h-[18px]" id="passwordError"></span>
            </div>

            <!-- Confirm Password -->
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


            <!-- Submit Button -->
            <button type="submit"
                    class="w-full py-3 bg-gradient-to-r from-gold to-[#c5a05a] text-white font-medium rounded-xl text-base mt-2 hover:-translate-y-0.5 hover:shadow-lg hover:shadow-gold/30 transition-all duration-300 active:translate-y-0">
                Đăng ký
            </button>

            <!-- Divider -->
            <div class="relative my-6">
                <div class="absolute inset-0 flex items-center">
                    <div class="w-full border-t border-gray-600"></div>
                </div>
                <div class="relative flex justify-center text-sm">
                    <span class="px-4 bg-transparent text-gray-400">Hoặc tiếp tục với</span>
                </div>
            </div>

            <!-- Social Login -->
            <div class="grid grid-cols-2 gap-3">
                <button type="button"
                        class="py-3 rounded-xl bg-white/5 border border-white/10 text-white text-sm font-medium flex items-center justify-center gap-2 hover:bg-white/10 transition-all duration-300">
                    <img src="${pageContext.request.contextPath}/assets/images/google.svg" class="w-5 h-5">
                    Google
                </button>

                <button type="button"
                        class="py-3 rounded-xl bg-white/5 border border-white/10 text-white text-sm font-medium flex items-center justify-center gap-2 hover:bg-white/10 transition-all duration-300">
                    <i class="fab fa-facebook-f text-[#1877f2] text-xl"></i>
                    Facebook
                </button>
            </div>

            <!-- Terms -->
            <p class="text-xs text-gray-400 text-center leading-relaxed mt-6">
                Khi đăng ký, bạn đồng ý với
                <a href="#" class="text-gold hover:underline">Điều khoản</a>
                và
                <a href="#" class="text-gold hover:underline">Chính sách</a>
                của chúng tôi
            </p>

            <!-- Error Message from Server -->
            <% if(request.getAttribute("error") != null) { %>
            <div class="bg-red-500/20 border border-red-500/30 text-red-200 px-4 py-3 rounded-xl text-center text-sm mt-4">
                ${error}
            </div>
            <% } %>

            <!-- Login Link -->
            <div class="text-center mt-6 pt-6 border-t border-gray-600">
                <p class="text-gray-400 text-sm">
                    Đã có tài khoản?
                    <a href="login" class="text-gold font-medium hover:underline">Đăng nhập</a>
                </p>
            </div>
        </form>
    </div>
</div>

</body>
</html>