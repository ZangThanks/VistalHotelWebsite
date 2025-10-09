<%-- Created by IntelliJ IDEA. User: dungm Date: 10/7/2025 Time: 3:17 PM --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="vistaltag" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Vista Hotel - Services</title>
    <link href="${pageContext.request.contextPath}/assets/css/tailwind.output.css" rel="stylesheet">
</head>

<body class="font-sans">
            <!-- Hero Banner with fixed background -->
            <div class="relative h-[80vh] bg-cover bg-center bg-fixed"
                style="background-image: url('https://res.cloudinary.com/dk8gvar3y/image/upload/v1760002659/snapedit_1760002631640_fkoka9.jpg');">

            </div>

            <!-- Main Content Container with 80% width, centered, and overlapping banner -->
            <div
                class="w-[95%] mx-auto bg-gradient-to-b from-[#F8EBD6] to-white -mt-20 relative z-10 rounded-t-3xl shadow-xl">
                <!-- Statistics Section -->
                <div class="py-16">
                    <div class="max-w-6xl mx-auto px-2">
                        <div class="grid grid-cols-1 md:grid-cols-3 divide-x divide-gray-300">
                            <!-- Service Count -->
                            <div class="text-center px-8">
                                <h3 class="text-5xl font-bold text-blue-500 mb-3">50+</h3>
                                <p class="text-xl font-bold text-gray-900 mb-3">Services</p>
                                <p class="text-gray-700 text-sm leading-relaxed">A dedication to unique flavors and
                                    heartfelt service, celebrating your palate</p>
                            </div>

                            <!-- Dish Count -->
                            <div class="text-center px-8">
                                <h3 class="text-5xl font-bold text-blue-500 mb-3">120+</h3>
                                <p class="text-xl font-bold text-gray-900 mb-3">Dish</p>
                                <p class="text-gray-700 text-sm leading-relaxed">A dedication to unique flavors and
                                    heartfelt service, celebrating your palate</p>
                            </div>

                            <!-- Stars Count -->
                            <div class="text-center px-8">
                                <h3 class="text-5xl font-bold text-blue-500 mb-3">5+</h3>
                                <p class="text-xl font-bold text-gray-900 mb-3">Stars</p>
                                <p class="text-gray-700 text-sm leading-relaxed">A dedication to unique flavors and
                                    heartfelt service, celebrating your palate</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Service List Section -->
                <div class="max-w-7xl mx-auto py-16 bg-transparent">

                    <!-- Laundry Services -->
                    <div class="mb-16">
                        <div class="flex gap-10">
                            <!-- Left: Text Content -->
                            <div class="w-64 flex-shrink-0">
                                <h3 class="text-2xl font-bold mb-4">Laundry</h3>
                                <p class="text-gray-700 text-sm leading-relaxed">
                                    We offer professional laundry services, including washing, drying, and folding, to
                                    make
                                    your life easier.
                                </p>
                            </div>

            <!-- Right: Service Cards -->
            <div class="flex-1">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-5">
                    <!-- Use JSTL to loop through laundry services and custom tag component -->
                    <c:forEach var="service" items="${laundryServices}">
                        <vistaltag:service-card service="${service}" />
                    </c:forEach>
                </div>
                <div class="text-right mt-6">
                    <a href="#" class="text-blue-600 hover:underline text-sm font-medium">Read more</a>
                </div>
            </div>
                        </div>
                    </div>

                    <!-- Food and Beverage Services -->
                    <div class="mb-16">
                        <div class="flex gap-8">
                            <!-- Left: Text Content -->
                            <div class="w-64 flex-shrink-0">
                                <h3 class="text-2xl font-bold mb-4">Food and Beverage</h3>
                                <p class="text-gray-700 text-sm leading-relaxed">
                                    To awaken every sense, to elevate with exquisite flavors. Crafted with passion and
                                    mastery, indulge in our sumptuous coffees, to satisfy every taste.
                                </p>
                            </div>

            <!-- Right: Service Cards -->
            <div class="flex-1">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-5">
                    <!-- Use JSTL to loop through food services and custom tag component -->
                    <c:forEach var="service" items="${foodServices}">
                        <vistaltag:service-card service="${service}" />
                    </c:forEach>
                </div>
            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
            <%@include file="/views/component/footer.jsp" %>
</body>

</html>