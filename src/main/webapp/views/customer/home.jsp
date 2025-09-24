<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 9/24/2025
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home JSP with Tailwind</title>
    <!-- Tailwind qua CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex flex-col items-center">

<!-- Header Section -->
<div class="flex justify-center items-center w-full h-screen relative">
    <!-- Left Image -->
    <div class="w-1/4 h-5/6 opacity-100 transition-all">
        <img src="https://res.cloudinary.com/dnbc9k0yn/image/upload/v1748876683/Betterimage.ai_1745318839409_peiven.jpg"
             alt="Left Bag"
             class="object-cover w-full h-full"/>
    </div>

    <!-- Video -->
    <div class="w-1/2 h-5/6 relative flex justify-center items-center">
        <video src="https://res.cloudinary.com/dnbc9k0yn/video/upload/v1748876712/0415_vamwju.mp4"
               autoplay muted loop playsinline
               class="object-cover w-full h-full"></video>

        <!-- Overlay text -->
        <div class="absolute flex flex-col items-center justify-center text-white">
            <h1 class="text-4xl md:text-5xl lg:text-6xl font-serif mb-4">
                Mother's Day Gifts
            </h1>
            <a href="productPage.jsp"
               class="mt-4 inline-block text-center border-b border-white hover:border-opacity-70 transition-all duration-300 text-sm md:text-base tracking-wider">
                Discover
            </a>
        </div>
    </div>

    <!-- Right Image -->
    <div class="w-1/4 h-5/6 opacity-100 transition-all">
        <img src="https://res.cloudinary.com/dnbc9k0yn/image/upload/v1748876684/Betterimage.ai_1745318813398_kcm7fl.jpg"
             alt="Right Bag"
             class="object-cover w-full h-full"/>
    </div>
</div>

<!-- Text Section -->
<div class="mt-10 text-center">
    <h2 class="text-xl w-1/2 mx-auto text-gray-600 tracking-wide font-medium font-serif">
        Tỏa sáng khác biệt, định đoạt phong cách
    </h2>
</div>

<!-- Men / Women Fashion -->
<div class="flex flex-row items-center mt-20 gap-6">
    <!-- Men -->
    <div class="relative group overflow-hidden w-[28vw] h-[86vh]">
        <img src="https://res.cloudinary.com/dnbc9k0yn/image/upload/v1748876329/DIOR-2023-SS-MENS-COLLECTION_26_erorfs.jpg"
             alt="Men fashion"
             class="object-cover w-full h-full"/>
        <div class="absolute inset-0 bg-gradient-to-t from-black/70 via-black/30 to-transparent"></div>
        <a href="productPage.jsp?sex=Nam"
           class="absolute inset-0 flex flex-col items-center justify-end pb-16 text-white font-serif">
            <span class="text-5xl font-bold drop-shadow-lg">Men Fashion</span>
            <div class="mt-4 px-6 py-2 text-2xl tracking-widest relative group-hover:text-gray-200 transition">
                Explore
                <span class="absolute bottom-0 left-1/2 transform -translate-x-1/2 w-0 h-[1px] bg-white transition-all duration-500 group-hover:w-full"></span>
            </div>
        </a>
    </div>

    <!-- Women -->
    <div class="relative group overflow-hidden w-[28vw] h-[86vh]">
        <img src="https://res.cloudinary.com/dnbc9k0yn/image/upload/v1748876514/_ONA0428_fc2gek.jpg"
             alt="Women fashion"
             class="object-cover w-full h-full"/>
        <div class="absolute inset-0 bg-gradient-to-t from-black/70 via-black/30 to-transparent"></div>
        <a href="productPage.jsp?sex=Nữ"
           class="absolute inset-0 flex flex-col items-center justify-end pb-16 text-white font-serif">
            <span class="text-5xl font-bold drop-shadow-lg">Women Fashion</span>
            <div class="mt-4 px-6 py-2 text-2xl tracking-widest relative group-hover:text-gray-200 transition">
                Explore
                <span class="absolute bottom-0 left-1/2 transform -translate-x-1/2 w-0 h-[1px] bg-white transition-all duration-500 group-hover:w-full"></span>
            </div>
        </a>
    </div>
</div>

<!-- Collection Section -->
<div class="mt-20 text-center">
    <h2 class="text-4xl font-serif tracking-widest font-medium text-gray-800">
        Bộ Sưu Tập Xuân Hè 2025
    </h2>
    <p class="text-gray-600">Biểu tượng phong cách đương đại</p>
</div>

<div class="w-full flex justify-center mt-10">
    <img src="https://res.cloudinary.com/dnbc9k0yn/image/upload/v1748876563/Betterimage.ai_1744782971571_zkeemo.jpg" alt=""/>
</div>

</body>
</html>
