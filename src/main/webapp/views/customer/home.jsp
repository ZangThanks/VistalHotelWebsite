<%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 9/24/2025
  Time: 3:20 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home - Vista Luxury Hotel</title>
    <link href="assets/css/tailwind.output.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        luxury: {
                            gold: '#CCBDA3',
                            'gold-dark': '#B8A586'
                        }
                    },
                    fontFamily: {
                        'serif': ['Playfair Display', 'serif'],
                        'sans': ['Inter', 'sans-serif']
                    }
                }
            }
        }
    </script>
</head>

<body class="bg-white antialiased font-sans">
<%@include file="/views/component/header.jsp" %>

<!-- Hero Video Section -->
<section class="relative w-full h-screen overflow-hidden">
    <video src="https://res.cloudinary.com/dyccrebqj/video/upload/v1758708870/0924_te7gqq.mp4"
           autoplay muted loop playsinline
           class="absolute top-0 left-0 w-full h-full object-cover">
    </video>

<%--    <!-- Elegant Overlay -->--%>
<%--    <div class="absolute inset-0 bg-gradient-to-b from-black/40 via-transparent to-black/60"></div>--%>

    <!-- Hero Content -->
<%--    <div class="absolute inset-0 flex flex-col items-center justify-center text-white px-6 animate-fade-in">--%>
<%--        <h1 class="text-5xl md:text-7xl lg:text-8xl font-serif font-light mb-6 tracking-wide drop-shadow-[2px_4px_12px_rgba(0,0,0,0.4)]">--%>
<%--            Vista Luxury--%>
<%--        </h1>--%>
<%--        <p class="text-lg md:text-xl lg:text-2xl font-light tracking-widest mb-12 drop-shadow-[2px_4px_12px_rgba(0,0,0,0.4)]">--%>
<%--            WHERE DREAMS MEET REALITY--%>
<%--        </p>--%>
<%--        <a href="#discover" class="group relative inline-flex items-center gap-3 text-white border-2 border-white px-10 py-4 hover:bg-white hover:text-black transition-all duration-500 tracking-widest text-sm overflow-hidden">--%>
<%--            <span class="relative z-10">DISCOVER MORE</span>--%>
<%--            <svg class="w-5 h-5 group-hover:translate-x-2 transition-transform duration-300 relative z-10" fill="none" stroke="currentColor" viewBox="0 0 24 24">--%>
<%--                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"></path>--%>
<%--            </svg>--%>
<%--        </a>--%>
<%--    </div>--%>

<%--    <!-- Scroll Indicator -->--%>
<%--    <div class="absolute bottom-10 left-1/2 transform -translate-x-1/2 animate-bounce">--%>
<%--        <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">--%>
<%--            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>--%>
<%--        </svg>--%>
<%--    </div>--%>
</section>

<!-- Tagline Section -->
<section id="discover" class="py-24 bg-gradient-to-b from-white to-gray-50">
    <div class="max-w-5xl mx-auto text-center px-6">
        <h2 class="text-3xl md:text-4xl lg:text-4xl font-serif text-gray-800 mb-6 leading-relaxed">
            The Art of Luxury, The Science of Service
        </h2>
        <div class="h-0.5 w-32 mx-auto mb-8 bg-gradient-to-r from-transparent via-luxury-gold to-transparent"></div>
        <p class="text-gray-600 text-lg md:text-xl font-light leading-relaxed max-w-3xl mx-auto">
            Experience unparalleled hospitality where every detail is crafted to perfection,
            and every moment becomes an everlasting memory.
        </p>
    </div>
</section>

<!-- Three Features Grid -->
<section class=" px-6 bg-gray-50">
    <div class="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-8">

        <!-- Landscape Card -->
        <div class="group relative overflow-hidden rounded-lg shadow-2xl cursor-pointer h-[550px] transition-transform duration-700 hover:scale-105">
            <img src="https://res.cloudinary.com/dk8gvar3y/image/upload/v1759815555/snapedit_1759815339900_appzzr.jpg"
                 alt="Luxury Yacht Landscape"
                 class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110">

            <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/30 to-transparent opacity-90 group-hover:opacity-100 transition-opacity duration-500"></div>

            <div class="absolute bottom-0 left-0 right-0 p-8 text-white transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500">
                <h3 class="text-4xl font-serif font-semibold mb-4 tracking-wide">Landscape</h3>
                <div class="h-0.5 w-20 mb-4 bg-gradient-to-r from-luxury-gold to-transparent"></div>
                <p class="text-base font-light leading-relaxed opacity-0 group-hover:opacity-100 transition-opacity duration-700 delay-100">
                    Where all limits fade, leaving only the beauty of creation and the generosity of the human spirit
                </p>
            </div>
        </div>

        <!-- Architecture Card -->
        <div class="group relative overflow-hidden rounded-lg shadow-2xl cursor-pointer h-[550px] transition-transform duration-700 hover:scale-105">
            <img src="https://res.cloudinary.com/dk8gvar3y/image/upload/v1759815555/snapedit_1759815323646_jjezbb.jpg"
                 alt="Grand Architecture"
                 class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110">

            <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/30 to-transparent opacity-90 group-hover:opacity-100 transition-opacity duration-500"></div>

            <div class="absolute bottom-0 left-0 right-0 p-8 text-white transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500">
                <h3 class="text-4xl font-serif font-semibold mb-4 tracking-wide">Architecture</h3>
                <div class="h-0.5 w-20 mb-4 bg-gradient-to-r from-luxury-gold to-transparent"></div>
                <p class="text-base font-light leading-relaxed opacity-0 group-hover:opacity-100 transition-opacity duration-700 delay-100">
                    A Manifesto of Pride and Creativity Reaching for the Endless Blue Ocean Horizon
                </p>
            </div>
        </div>

        <!-- Amenity Card -->
        <div class="group relative overflow-hidden rounded-lg shadow-2xl cursor-pointer h-[550px] transition-transform duration-700 hover:scale-105">
            <img src="https://res.cloudinary.com/dk8gvar3y/image/upload/v1759815555/snapedit_1759815210477_hyr5me.jpg"
                 alt="Underwater Dining"
                 class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110">

            <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/30 to-transparent opacity-90 group-hover:opacity-100 transition-opacity duration-500"></div>

            <div class="absolute bottom-0 left-0 right-0 p-8 text-white transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500">
                <h3 class="text-4xl font-serif font-semibold mb-4 tracking-wide">Amenity</h3>
                <div class="h-0.5 w-20 mb-4 bg-gradient-to-r from-luxury-gold to-transparent"></div>
                <p class="text-base font-light leading-relaxed opacity-0 group-hover:opacity-100 transition-opacity duration-700 delay-100">
                    Embracing the ocean, losing yourself in the water, and living in the moment
                </p>
            </div>
        </div>

    </div>
</section>

<!-- Retreat Banner -->
<section class="relative w-full h-screen overflow-hidden mt-20">
    <img src="https://res.cloudinary.com/dk8gvar3y/image/upload/v1759816376/BetterImage_1759816379634_xg9wxx.jpg"
         alt="Retreat Experience"
         class="w-full h-full object-cover">

    <div class="absolute inset-0 bg-black/50 flex flex-col items-center justify-center text-white text-center px-6">
        <h2 class="text-4xl md:text-4xl lg:text-5xl font-serif font-light mb-6 tracking-wider drop-shadow-[2px_4px_12px_rgba(0,0,0,0.4)]">
            Retreat
        </h2>
        <div class="h-0.5 w-24 mb-8 bg-gradient-to-r from-transparent via-luxury-gold to-transparent"></div>
        <p class="text-lg md:text-lg font-light mb-12 max-w-lg leading-relaxed drop-shadow-[2px_4px_12px_rgba(0,0,0,0.4)]">
            Emotions are soothed, and the soul rests and rejuvenates
        </p>
        <jsp:include page="/views/component/service-button.jsp">
            <jsp:param name="text" value="EXPLORE SERVICES"/>
            <jsp:param name="href" value="productPage.jsp"/>
        </jsp:include>
    </div>
</section>

<!-- Vista Membership Section -->
<section class="bg-gradient-to-br from-gray-50 to-white py-24 px-6">
    <div class="max-w-7xl mx-auto">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">

            <!-- Left Content -->
            <div class="space-y-8">
                <div>
                    <p class="text-luxury-gold text-sm tracking-widest mb-4 uppercase font-medium">Exclusive Benefits</p>
                    <h2 class="text-4xl md:text-3xl lg:text-4xl font-serif text-gray-900 mb-6 leading-tight">
                        Vista Membership
                    </h2>
                    <div class="h-0.5 w-24 mb-8 bg-gradient-to-r from-luxury-gold to-transparent"></div>
                </div>

                <p class="text-gray-600 text-sm md:text-lg leading-relaxed max-w-lg">
                    Exclusive service designed just for you, at a special price.
                    Experience privileges beyond imagination.
                </p>

                <div class="space-y-4">
                    <div class="flex items-start gap-4">
                        <svg class="w-6 h-6 text-luxury-gold flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                        </svg>
                        <span class="text-gray-700 text-sm">Priority reservations and complimentary upgrades</span>
                    </div>
                    <div class="flex items-start gap-4">
                        <svg class="w-6 h-6 text-luxury-gold flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                        </svg>
                        <span class="text-gray-700 text-sm">Access to exclusive facilities and events</span>
                    </div>
                    <div class="flex items-start gap-4">
                        <svg class="w-6 h-6 text-luxury-gold flex-shrink-0 mt-1" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                        </svg>
                        <span class="text-gray-700 text-sm">Personalized concierge services 24/7</span>
                    </div>
                </div>

                <jsp:include page="/views/component/service-button.jsp">
                    <jsp:param name="text" value="JOIN NOW"/>
                </jsp:include>
            </div>

            <!-- Right Image -->
            <div class="relative group">
                <div class="absolute -inset-4 bg-gradient-to-r from-luxury-gold to-luxury-gold-dark rounded-lg opacity-20 group-hover:opacity-30 blur-xl transition-opacity duration-500"></div>
                <img src="https://res.cloudinary.com/dk8gvar3y/image/upload/v1759820893/BetterImage_1759820879438_apb0pb.jpg"
                     alt="Vista Membership Experience"
                     class="relative w-full h-[600px] object-cover rounded-lg shadow-2xl transition-all duration-500 group-hover:scale-105">
            </div>

        </div>
    </div>
</section>
<%@include file="/views/component/footer.jsp" %>
</body>
</html>