<%--
  Created by IntelliJ IDEA.
  User: TRAN LONG VU
  Date: 10/8/2025
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu | Vista Hotel</title>
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

    <% if (request.getAttribute("resetTimer") != null && (Boolean) request.getAttribute("resetTimer")) { %>
    <script>
        // Reset timer when page loads with resetTimer flag
        window.addEventListener('DOMContentLoaded', function() {
            if (typeof startTimer === 'function') {
                startTimer();
            }
        });
    </script>
    <% } %>

</head>

<body class="min-h-screen bg-cover bg-center bg-no-repeat flex items-center justify-center relative"
      style="background-image: url('${pageContext.request.contextPath}/assets/images/resort-bg.png');">

<div class="absolute inset-0 bg-black/50"></div>

<div class="relative z-10 bg-slate-500/25 backdrop-blur-[15px] rounded-3xl shadow-2xl w-full max-w-[570px] mx-4 max-h-[95vh] flex flex-col overflow-hidden">
    <div class="p-8 overflow-y-auto scroll-content">

        <% String step = (String) request.getAttribute("step");
            if (step == null) step = "send"; %>

        <% if ("send".equals(step)) { %>
        <div class="text-center mb-8">
            <img src="${pageContext.request.contextPath}/assets/images/vista-logo-white.png" class="mx-auto w-[100px] mb-2">
            <h1 class="text-2xl font-normal text-white mb-2">Quên mật khẩu</h1>
            <p class="text-gray-400 text-sm">Nhập email hoặc số điện thoại bạn đã dùng để đăng ký tài khoản</p>
        </div>

        <form method="post" action="forgot-password" id="forgotForm">
            <input type="hidden" name="action" value="send">

            <!-- Email / Phone Input -->
            <div class="relative mb-6">
                <i class="fa-regular fa-envelope absolute left-0 top-[8px] text-white/50 text-sm"></i>
                <input type="text"
                       name="emailOrPhone"
                       id="forgotEmail"
                       placeholder=" "
                       value="${param.emailOrPhone != null ? param.emailOrPhone : ''}"
                       class="input-field w-full bg-transparent border-0 border-b border-white/20 pl-6 py-2 text-white text-sm outline-none focus:outline-none focus:border-gold focus:ring-0 transition-all duration-300">
                <label for="forgotEmail"
                       class="floating-label absolute left-6 top-2 text-gray-400 text-sm transition-all duration-300 pointer-events-none">
                    Email hoặc Số điện thoại
                </label>
                <span class="text-red-400 text-xs mt-1 block min-h-[18px]" id="forgotEmailError"></span>
            </div>

            <!-- reCAPTCHA -->
            <div class="mb-6">
                <div class="bg-white/10 border border-white/20 rounded-lg p-4 flex items-center justify-between">
                    <div class="flex items-center gap-3">
                        <input type="checkbox" id="recaptcha"
                               class="w-4 h-4 text-gold bg-transparent border-white/30 rounded focus:ring-gold focus:ring-2">
                        <label for="recaptcha" class="text-white text-sm">Tôi không phải người máy</label>
                    </div>
                    <div class="flex items-center gap-2 text-xs text-gray-400">
                        <img src="${pageContext.request.contextPath}/assets/images/captcha.png" class="w-10 h-10 rounded-full">
                        <span>reCAPTCHA</span>
                    </div>
                </div>
            </div>

            <button type="submit"
                    class="w-full py-3 bg-gradient-to-r from-gold to-[#c5a05a] text-white font-medium rounded-xl text-base mt-2 hover:-translate-y-0.5 hover:shadow-lg hover:shadow-gold/30 transition-all duration-300 active:translate-y-0">
                Gửi mã xác nhận
            </button>

            <div class="text-center mt-4">
                <a href="login" class="text-gold hover:underline text-sm"><i class="fas fa-arrow-left mr-2"></i>Quay lại đăng nhập</a>
            </div>
        </form>
        <% } %>

        <% if ("verify".equals(step)) { %>
        <!-- Step 2: Verify Code -->
        <div class="text-center mb-8">
            <img src="${pageContext.request.contextPath}/assets/images/vista-logo-white.png" class="mx-auto w-[100px] mb-2">
            <h1 class="text-2xl font-normal text-white mb-2">Xác nhận mã</h1>
            <p class="text-gray-400 text-sm">Nhập mã xác nhận được gửi đến <b><%= session.getAttribute("verifyEmail") %></b></p>
        </div>

        <form method="post" action="forgot-password" id="verifyForm">
            <input type="hidden" name="action" value="verify">

            <div class="relative mb-6">
                <i class="fa-solid fa-lock absolute left-0 top-[8px] text-white/50 text-sm"></i>
                <input type="text" name="confirmationCode" id="confirmationCode" placeholder=" "
                       maxlength="6"
                       class="input-field w-full bg-transparent border-0 border-b border-white/20 pl-6 py-2 text-white text-sm outline-none focus:outline-none focus:border-gold focus:ring-0 transition-all duration-300">
                <label for="confirmationCode"
                       class="floating-label absolute left-6 top-2 text-gray-400 text-sm transition-all duration-300 pointer-events-none">
                    Nhập mã xác nhận (6 chữ số)
                </label>
                <span class="text-red-400 text-xs mt-1 block min-h-[18px]" id="confirmationCodeError"></span>
            </div>

            <div class="text-right mb-4">
                <span id="timer" class="text-gold text-sm">Thời gian còn lại: 2:00s</span>
            </div>

            <button type="submit"
                    class="w-full py-3 bg-gradient-to-r from-gold to-[#c5a05a] text-white font-medium rounded-xl text-base hover:-translate-y-0.5 hover:shadow-lg hover:shadow-gold/30 transition-all duration-300 active:translate-y-0">
                Xác nhận mã
            </button>

            <div class="flex items-center justify-between mt-4">
                <a href="forgot-password"
                   class="text-gray-400 hover:text-white transition-colors text-sm">
                    <i class="fas fa-arrow-left mr-2"></i>Quay lại
                </a>
                <a href="forgot-password?action=resend"
                   class="text-gold hover:underline text-sm">
                    <i class="fas fa-redo mr-2"></i>Gửi lại mã
                </a>
            </div>
        </form>
        <% } %>

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

    </div>
</div>

</body>
</html>



