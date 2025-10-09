<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 9/24/2025
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <!-- Tailwind qua CDN -->
    <%--    <script src="https://cdn.tailwindcss.com"></script>--%>
    <link href="assets/css/output.css" rel="stylesheet">
</head>

<body class="bg-gray-100  items-center">
<%@include file="/views/component/header.jsp" %>
<!-- Header Section -->
<div class="flex justify-center items-center w-full h-screen relative">


    <!-- Video -->
    <div class="w-screen h-screen relative flex justify-center items-center">
        <video src="https://res.cloudinary.com/dyccrebqj/video/upload/v1758708870/0924_te7gqq.mp4"
               autoplay muted loop playsinline
               class="absolute top-0 left-0 w-full h-full object-cover"></video>

        <%--        <!-- Overlay text -->--%>
        <%--        <div class="absolute flex flex-col items-center justify-center text-white">--%>
        <%--            <h1 class="text-4xl md:text-5xl lg:text-6xl font-serif mb-4">--%>
        <%--                Mother's Day Gifts--%>
        <%--            </h1>--%>
        <%--            <a href="productPage.jsp"--%>
        <%--               class="mt-4 inline-block text-center border-b border-white hover:border-opacity-70 transition-all duration-300 text-sm md:text-base tracking-wider">--%>
        <%--                Discover--%>
        <%--            </a>--%>
        <%--        </div>--%>

    </div>

</div>

<!-- Text Section -->
<div class="mt-10 text-center">
    <h2 class="text-xl max-w-3xl mx-auto text-gray-600 tracking-wide font-medium font-serif">
        The Art of Luxury, The Science of Service
    </h2>
    <hr class="mt-3 mx-auto w-full md:w-1/2 border border-grey-500">
</div>


<!-- Hotel Introduction -->
<div class="flex flex-row items-center mt-20 gap-6 justify-center">

    <div class="relative group overflow-hidden w-[30vw] h-[80vh]">
        <img src="https://res.cloudinary.com/dk8gvar3y/image/upload/v1759815555/snapedit_1759815339900_appzzr.jpg"
             alt="Luxury Yacht Landscape with Burj Al Arab"
             class="object-cover w-full h-full"/>
        <div class="absolute inset-x-0 bottom-0 text-white p-4 pt-16 bg-gradient-to-t from-black/70 to-transparent">
            <h3 class="text-3xl font-serif font-bold drop-shadow-lg mb-2">Landscape</h3>
            <p class="text-base font-light font-sans leading-relaxed">
                Where all limits fade, leaving only the beauty of creation and the generosity of the human spirit
            </p>
        </div>
    </div>
    <div class="relative group overflow-hidden w-[30vw] h-[80vh]">
        <img src="https://res.cloudinary.com/dk8gvar3y/image/upload/v1759815555/snapedit_1759815323646_jjezbb.jpg"
             alt="Grand Interior Architecture"
             class="object-cover w-full h-full"/>

        <div class="absolute inset-x-0 bottom-0  text-white p-4 pt-16 bg-gradient-to-t from-black/70 to-transparent">
            <h3 class="text-3xl font-serif font-bold drop-shadow-lg mb-2">Architecture</h3>
            <p class="text-base font-light font-sans leading-relaxed">
                A Manifesto of Pride and Creativity Reaching for the Endless Blue Ocean Horizon
            </p>
        </div>
    </div>
    <div class="relative group overflow-hidden w-[30vw] h-[80vh]">
        <img src="https://res.cloudinary.com/dk8gvar3y/image/upload/v1759815555/snapedit_1759815210477_hyr5me.jpg"
             alt="Underwater Dining Amenity"
             class="object-cover w-full h-full"/>

        <div class="absolute inset-x-0 bottom-0 text-white p-4 pt-16 bg-gradient-to-t from-black/70 to-transparent">
            <h3 class="text-3xl font-serif font-bold drop-shadow-lg mb-2">Amenity</h3>
            <p class="text-base font-light font-sans leading-relaxed">
                Embracing the ocean, losing yourself in the water, and living in the moment
            </p>
        </div>
    </div>
</div>


<div class="relative w-full h-[80vh] flex items-center justify-center mt-10">
    <!-- Ảnh nền -->
    <img src="https://res.cloudinary.com/dk8gvar3y/image/upload/v1759816376/BetterImage_1759816379634_xg9wxx.jpg"
         alt="Retreat"
         class="w-full h-full object-cover">

    <!-- Overlay mờ + chữ căn giữa -->
    <div class="absolute inset-0 flex flex-col items-center justify-center bg-black/30 text-white text-center px-4">
        <h1 class="text-4xl md:text-5xl lg:text-6xl font-serif mb-4">
            Retreat
        </h1>
        <p class="text-lg md:text-xl mb-6 font-light">
            Emotions are soothed, and the soul rests and rejuvenates
        </p>
        <jsp:include page="/views/component/serviceButton.jsp">
            <jsp:param name="text" value="Services" />
            <jsp:param name="href" value="productPage.jsp" />
        </jsp:include>

    </div>
</div>
<%@include file="/views/component/footer.jsp" %>


</body>
</html>
