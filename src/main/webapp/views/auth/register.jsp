<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tạo tài khoản | Vista Hotel</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/logo.png">
</head>
<body class="bg-cover bg-center bg-no-repeat min-h-screen flex items-center justify-center"
      style="background-image: url('${pageContext.request.contextPath}/assets/images/resort-bg.png');">

<div class="absolute inset-0 bg-black/60"></div>

<div class="relative z-10 bg-white/10 backdrop-blur-md rounded-2xl shadow-2xl w-[380px] p-8 text-white">
    <div class="flex flex-col items-center mb-6">
        <img src="${pageContext.request.contextPath}/assets/images/vista-logo-white.png" alt="Vista Logo" class="w-16 mb-2">
        <h2 class="text-2xl font-semibold">Tạo tài khoản</h2>
    </div>

    <form action="${pageContext.request.contextPath}/register" method="post" class="space-y-4">

        <div>
            <label class="block text-sm mb-1 font-medium">Họ và tên</label>
            <input type="text" name="fullName" placeholder="Nhập họ và tên"
                   class="w-full p-3 rounded-lg bg-white/20 placeholder-gray-300 text-white focus:outline-none focus:ring-2 focus:ring-[#c5aa6a]" required>
        </div>

        <div>
            <label class="block text-sm mb-1 font-medium">Email hoặc Số điện thoại</label>
            <input type="email" name="email" placeholder="Nhập email hoặc số điện thoại"
                   class="w-full p-3 rounded-lg bg-white/20 placeholder-gray-300 text-white focus:outline-none focus:ring-2 focus:ring-[#c5aa6a]" required>
        </div>

        <div>
            <label class="block text-sm mb-1 font-medium">Mật khẩu</label>
            <input type="password" name="password" placeholder="Nhập mật khẩu"
                   class="w-full p-3 rounded-lg bg-white/20 placeholder-gray-300 text-white focus:outline-none focus:ring-2 focus:ring-[#c5aa6a]" required>
        </div>

        <div>
            <label class="block text-sm mb-1 font-medium">Xác nhận mật khẩu</label>
            <input type="password" name="confirmPassword" placeholder="Xác nhận mật khẩu"
                   class="w-full p-3 rounded-lg bg-white/20 placeholder-gray-300 text-white focus:outline-none focus:ring-2 focus:ring-[#c5aa6a]" required>
        </div>

        <button type="submit"
                class="w-full py-3 bg-gradient-to-r from-[#c5aa6a] to-[#d8b86f] text-white font-semibold rounded-lg hover:scale-[1.02] transition">
            Đăng ký
        </button>

        <div class="flex items-center gap-3 my-4">
            <hr class="flex-1 border-gray-500">
            <span class="text-gray-300 text-sm">Hoặc</span>
            <hr class="flex-1 border-gray-500">
        </div>

        <div class="flex flex-col gap-2">
            <button type="button"
                    class="w-full bg-white text-gray-700 font-medium py-2 rounded-lg flex items-center justify-center gap-2 hover:bg-gray-100 transition">
                <img src="https://www.svgrepo.com/show/355037/google.svg" class="w-5 h-5"> Đăng nhập với Google
            </button>

            <button type="button"
                    class="w-full bg-[#1877f2] text-white font-medium py-2 rounded-lg flex items-center justify-center gap-2 hover:bg-[#166fe5] transition">
                <i class="fa-brands fa-facebook-f"></i> Đăng nhập với Facebook
            </button>
        </div>

        <p class="text-xs text-gray-300 mt-4 text-center leading-relaxed">
            Khi đăng ký, tôi đồng ý với các
            <a href="#" class="text-[#c5aa6a] hover:underline">Điều khoản sử dụng</a>
            và
            <a href="#" class="text-[#c5aa6a] hover:underline">Chính sách bảo mật</a> của Vista.
        </p>

        <p class="text-sm mt-3 text-center">
            Đã có tài khoản?
            <a href="${pageContext.request.contextPath}/views/auth/login.jsp" class="text-[#c5aa6a] font-medium hover:underline">Đăng nhập ngay</a>
        </p>

        <p class="text-red-400 text-center text-sm mt-2">${error}</p>
    </form>
</div>

</body>
</html>
