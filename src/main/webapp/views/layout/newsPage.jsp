<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/24/2025
  Time: 4:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Vista - Tin tức & Sự kiện</title>
    <link href="assets/css/tailwind.output.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="assets/images/logow.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,600;1,400&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root{--glass:rgba(255,255,255,.08)}
        .font-serif{font-family:"Playfair Display",serif}
        .font-sans{font-family:Inter,ui-sans-serif,system-ui,-apple-system,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans","Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji"}
        /* thin separators like the design */
        .section-cap:before, .section-cap:after{
            content:""; display:inline-block; width:64px; height:1px; background:#ddd; margin:0 14px; transform:translateY(-4px);
        }
        /* subtle card shadow */
        .soft{box-shadow:0 6px 20px rgba(0,0,0,.08)}
        /* image ratios */
        .ratio-21x9{position:relative; padding-top:42.857%}
        .ratio-4x3{position:relative; padding-top:75%}
        .ratio-3x2{position:relative; padding-top:66.6667%}
        .ratio-21x9>img,.ratio-4x3>img,.ratio-3x2>img{position:absolute; inset:0; width:100%; height:100%; object-fit:cover}
        /* hover underline nav */
        .nav-link{position:relative}
        .nav-link:after{content:""; position:absolute; left:50%; bottom:-6px; width:0; height:1px; background:#fff; transition:all .25s}
        .nav-link:hover:after{left:0; width:100%}
    </style>
</head>
<body class="bg-white text-slate-800 font-sans">

<!-- Hero + Navbar -->
<header class="relative">
    <div class="relative h-[56vh] md:h-[70vh] overflow-hidden">
        <!-- Background image: giữ <img> để cover -->
        <img src="https://images.unsplash.com/photo-1554995207-c18c203602cb?q=80&w=2000&auto=format&fit=crop"
             alt="Lobby"
             class="absolute inset-0 w-full h-full object-cover">
        <!-- Overlay tối mờ linear để giống mẫu -->
        <div class="absolute inset-0 bg-gradient-to-b from-black/60 via-black/45 to-transparent"></div>

        <!-- Top thin separator line -->
        <div class="absolute left-0 right-0 top-0 h-px bg-white/20"></div>

        <!-- Top nav -->
        <nav class="absolute inset-x-0 top-0">
            <div class="mx-auto max-w-6xl px-4">
                <div class="flex items-center justify-between py-4">
                    <!-- left: search icon -->
                    <div class="flex items-center gap-3">
                        <button aria-label="Search" class="text-white/90 hover:text-white">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="m21 21-4.35-4.35M10.5 18a7.5 7.5 0 1 1 0-15 7.5 7.5 0 0 1 0 15z"/>
                            </svg>
                        </button>
                    </div>

                    <!-- center: logo -->
                    <div class="flex-1 flex justify-center pointer-events-none">
                        <a href="#" class="text-white text-3xl md:text-4xl tracking-[0.35em] font-serif">VISTA</a>
                    </div>

                    <!-- right: language/login/reserve -->
                    <div class="flex items-center gap-4">
                        <div class="hidden md:flex items-center gap-4 text-white/90 text-sm">
                            <a href="#" class="hover:text-white">EN</a>
                            <a href="#" class="hover:text-white flex items-center gap-2">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M5.121 17.804A9 9 0 1018.878 6.196 9 9 0 005.12 17.804z"/>
                                </svg>
                                Login
                            </a>
                        </div>

                        <a href="#"
                           class="hidden md:inline-block bg-white text-slate-800 text-sm px-4 py-2 rounded-full shadow-sm hover:shadow-md">
                            Reserve
                        </a>

                        <!-- mobile menu button -->
                        <button class="md:hidden text-white/90 hover:text-white" aria-label="Menu">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" viewBox="0 0 24 24" fill="currentColor"><path d="M4 6h16M4 12h16M4 18h16"/></svg>
                        </button>
                    </div>
                </div>

                <!-- main horizontal nav under logo (thin links, centered) -->
                <div class="hidden md:flex justify-center border-t border-white/10 py-3">
                    <div class="flex gap-8 text-white/80 text-sm">
                        <a class="nav-link" href="#">Overview</a>
                        <a class="nav-link" href="#">About Us</a>
                        <a class="nav-link" href="#">Accommodation</a>
                        <a class="nav-link" href="#">Services</a>
                        <a class="nav-link" href="#">Events</a>
                        <a class="nav-link" href="#">Exclusive offers</a>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Hero center title -->
        <div class="absolute inset-0 flex items-end md:items-center justify-center pb-8 md:pb-0">
            <div class="text-center">
                <h1 class="text-white font-serif text-2xl md:text-4xl tracking-widest drop-shadow-[0_2px_6px_rgba(0,0,0,0.6)]">TIN TỨC - SỰ KIỆN</h1>
                <p class="mt-2 text-xs text-white/60 hidden md:block">Vista</p>
            </div>
        </div>
    </div>
</header>

<!-- Featured -->
<main>
    <section class="mx-auto max-w-3xl px-4 -mt-8 md:-mt-10">
        <div class="flex justify-center">
            <span class="section-cap text-[11px] tracking-[.35em] text-slate-500 uppercase">Nổi bật</span>
        </div>

        <article class="mt-6 md:mt-8 overflow-hidden rounded-lg soft bg-white">
            <div class="ratio-21x9">
                <img src="https://images.unsplash.com/photo-1470225620780-dba8ba36b745?q=80&w=2000&auto=format&fit=crop" alt="Concert">
            </div>
            <div class="p-5 md:p-6">
                <p class="text-[11px] uppercase tracking-widest text-slate-400">Sự kiện</p>
                <h2 class="mt-1 font-serif text-xl md:text-2xl text-slate-800">Concert Anh Trai Say Hi đã trở lại 30/09</h2>
                <p class="mt-2 text-sm leading-relaxed text-slate-600 line-clamp-2">Đêm nhạc bùng nổ với dàn khách mời đình đám, hệ thống âm thanh ánh sáng cao cấp và không gian sang trọng của Vista.</p>
                <div class="mt-4">
                    <a href="#" class="text-[12px] uppercase tracking-widest text-slate-700 hover:text-black inline-flex items-center gap-2">
                        Chi tiết
                        <span class="inline-block h-px w-6 bg-slate-400"></span>
                    </a>
                </div>
            </div>
        </article>
    </section>

    <!-- Others list -->
    <section class="mx-auto max-w-5xl px-4 mt-12 md:mt-16">
        <div class="flex justify-center">
            <span class="section-cap text-[11px] tracking-[.35em] text-slate-500 uppercase">Khác</span>
        </div>

        <!-- Item 1 -->
        <article class="mt-6 grid md:grid-cols-2 gap-6 md:gap-10 items-center">
            <div class="order-1 md:order-none ratio-4x3 rounded-lg overflow-hidden soft">
                <img src="https://images.unsplash.com/photo-1514516884750-6e2e1d4d9c5b?q=80&w=1600&auto=format&fit=crop" alt="Ẩm thực">
            </div>
            <div>
                <h3 class="font-serif text-lg md:text-xl">Lễ hội ẩm thực đã trở lại 15/10</h3>
                <p class="mt-2 text-sm leading-7 text-slate-600">Hội chợ ẩm thực địa phương với hơn 30 gian hàng, lớp học nấu ăn và trình diễn nhạc acoustic. Ưu đãi đặc biệt cho khách lưu trú dịp cuối tuần.</p>
                <a href="#" class="mt-3 inline-block text-[12px] uppercase tracking-widest text-slate-700 hover:text-black">Chi tiết</a>
            </div>
        </article>

        <!-- Item 2 -->
        <article class="mt-10 grid md:grid-cols-2 gap-6 md:gap-10 items-center">
            <div class="md:order-2 ratio-3x2 rounded-lg overflow-hidden soft">
                <img src="https://images.unsplash.com/photo-1505691938895-1758d7feb511?q=80&w=1600&auto=format&fit=crop" alt="Phòng khách sạn">
            </div>
            <div class="md:order-1">
                <h3 class="font-serif text-lg md:text-xl">Khách sạn Vista quốc tế</h3>
                <p class="mt-2 text-sm leading-7 text-slate-600">Phòng theo phong cách Địa Trung Hải, ban công rộng mở ngập tràn ánh sáng. Hồ bơi nước mặn và spa trị liệu đem lại trải nghiệm cân bằng cho cơ thể và tâm trí.</p>
                <a href="#" class="mt-3 inline-block text-[12px] uppercase tracking-widest text-slate-700 hover:text-black">Chi tiết</a>
            </div>
        </article>

        <div class="mt-10 flex justify-center">
            <button class="text-[12px] uppercase tracking-[.35em] px-5 py-2 rounded-full border border-slate-300 hover:border-slate-900 hover:text-slate-900 text-slate-600 bg-white">Xem thêm</button>
        </div>
    </section>

    <!-- Bottom Feature -->
    <section class="mx-auto max-w-5xl px-4 mt-14 md:mt-20">
        <div class="grid md:grid-cols-2 gap-8 items-center">
            <div class="order-2 md:order-none">
                <h3 class="font-serif text-lg md:text-xl">Nơi quay nhạc</h3>
                <p class="mt-2 text-sm leading-7 text-slate-600">Không gian café ấm cúng với ánh sáng tự nhiên, cực kỳ phù hợp để quay vlog, podcast hay buổi mini acoustic. Mở cửa hằng ngày 07:00 - 22:00.</p>
                <a href="#" class="mt-3 inline-block text-[12px] uppercase tracking-widest text-slate-700 hover:text-black">Đọc tiếp</a>
            </div>
            <div class="order-1 md:order-none rounded-lg overflow-hidden soft ratio-3x2">
                <img src="https://images.unsplash.com/photo-1524758631624-e2822e304c36?q=80&w=1600&auto=format&fit=crop" alt="Coffee space">
            </div>
        </div>
    </section>
</main>

<!-- Footer -->
<footer class="mt-16 md:mt-24 border-t">
    <div class="mx-auto max-w-6xl px-4 py-10">
        <div class="grid grid-cols-2 md:grid-cols-6 gap-6 text-center md:text-left">
            <div>
                <p class="text-xs text-slate-500">Email</p>
                <p class="text-sm">contact@vista.example</p>
            </div>
            <div>
                <p class="text-xs text-slate-500">Điện thoại</p>
                <p class="text-sm">(+84) 888 999 000</p>
            </div>
            <div>
                <p class="text-xs text-slate-500">Địa chỉ</p>
                <p class="text-sm">123 Seaside Rd, Đà Nẵng</p>
            </div>
            <div>
                <p class="text-xs text-slate-500">Check-in</p>
                <p class="text-sm">14:00</p>
            </div>
            <div>
                <p class="text-xs text-slate-500">Check-out</p>
                <p class="text-sm">12:00</p>
            </div>
            <div>
                <p class="text-xs text-slate-500">Theo dõi</p>
                <p class="text-sm">Facebook • Instagram</p>
            </div>
        </div>
        <p class="mt-8 text-center text-xs text-slate-500">© 2025 Vista Hotel. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
