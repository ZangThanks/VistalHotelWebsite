<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="service" required="true" type="java.util.Map" %>

<%-- Service Card Component - Reusable tag for displaying service card --%>
<%-- Usage: <vistaltag:service-card service="${serviceMap}" /> --%>

<div class="service-card bg-white rounded-xl border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow duration-300 m-2">
    <!-- Hình ảnh dịch vụ -->
    <img src="${service.imageUrl}" alt="${service.serviceName}" class="w-full h-40 object-cover">
    
    <!-- Nội dung thẻ -->
    <div class="p-4">
        <!-- Tên dịch vụ -->
        <h4 class="text-base font-semibold mb-2">${service.serviceName}</h4>
        
        <!-- Đánh giá & Thời gian -->
        <div class="flex items-center gap-3 text-xs mb-2">
            <span class="flex items-center text-yellow-500">
                ⭐ ${service.rating}
            </span>
            <span class="flex items-center text-gray-500">
                🕐 ${service.duration}
            </span>
        </div>
        
        <!-- Giá tiền -->
        <div class="text-red-500 font-semibold mb-2 flex items-center gap-1 text-sm">
            💰 ${service.price} vnđ
        </div>
        
        <!-- Mô tả -->
        <p class="text-gray-600 text-xs mb-3 line-clamp-2">${service.description}</p>
        
        <!-- Nút hành động -->
        <div class="mt-4">
            <a href="#" class="block w-full px-8 py-3 rounded-md text-lg font-serif bg-white text-black border border-gray-300 hover:bg-[#CCBDA3] hover:text-black hover:border-transparent transition-all duration-300 text-center">
                BOOK SERVICE
            </a>
        </div>
    </div>
</div>
