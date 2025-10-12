<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<link href="assets/css/global.css" rel="stylesheet">
<link href="assets/css/tailwind.output.css" rel="stylesheet">
<div class="flex flex-col h-full">
    <!-- Sidebar Logo/Header -->
    <div class="p-5 border-b border-gray-100">
        <div class="flex items-center justify-between">
            <div class="flex items-center">
                <!-- Full Logo -->
                <div class="sidebar-logo-full">
                    <h2 class="text-2xl font-bold font-playfair tracking-wider text-color-black">VISTA</h2>
                    <p class="text-xs tracking-[2px] text-gray-500">LUXURY HOTEL</p>
                </div>
                <!-- Icon Only (for collapsed state) -->
                <div class="sidebar-logo-icon hidden">
                    <h2 class="text-2xl font-bold font-playfair text-color-gold">V</h2>
                </div>
            </div>
        </div>
    </div>

    <!-- Navigation Menu -->
    <nav class="flex-1 py-5 overflow-y-auto">
        <ul class="px-3">
            <li class="mb-1 ${param.active == 'dashboard' ? 'bg-color-gold bg-opacity-10 text-color-gold' : ''}">
                <a href="${pageContext.request.contextPath}/dashboard" 
                   class="flex items-center px-3 py-3 rounded-md hover:bg-color-gold hover:bg-opacity-10 hover:text-color-gold transition-all">
                    <i class="fas fa-tachometer-alt w-5 text-center"></i>
                    <span class="ml-3 sidebar-text">Dashboard</span>
                </a>
            </li>
            <li class="mb-1 ${param.active == 'rooms' ? 'bg-color-gold bg-opacity-10 text-color-gold' : ''}">
                <a href="${pageContext.request.contextPath}/rooms" 
                   class="flex items-center px-3 py-3 rounded-md hover:bg-color-gold hover:bg-opacity-10 hover:text-color-gold transition-all">
                    <i class="fas fa-bed w-5 text-center"></i>
                    <span class="ml-3 sidebar-text">Room Management</span>
                </a>
            </li>
            <li class="mb-1 ${param.active == 'reservations' ? 'bg-color-gold bg-opacity-10 text-color-gold' : ''}">
                <a href="${pageContext.request.contextPath}/reservations" 
                   class="flex items-center px-3 py-3 rounded-md hover:bg-color-gold hover:bg-opacity-10 hover:text-color-gold transition-all">
                    <i class="fas fa-calendar-alt w-5 text-center"></i>
                    <span class="ml-3 sidebar-text">Reservations</span>
                </a>
            </li>
            <li class="mb-1 ${param.active == 'guests' ? 'bg-color-gold bg-opacity-10 text-color-gold' : ''}">
                <a href="${pageContext.request.contextPath}/guests" 
                   class="flex items-center px-3 py-3 rounded-md hover:bg-color-gold hover:bg-opacity-10 hover:text-color-gold transition-all">
                    <i class="fas fa-users w-5 text-center"></i>
                    <span class="ml-3 sidebar-text">Guests</span>
                </a>
            </li>
            <li class="mb-1 ${param.active == 'services' ? 'bg-color-gold bg-opacity-10 text-color-gold' : ''}">
                <a href="${pageContext.request.contextPath}/services" 
                   class="flex items-center px-3 py-3 rounded-md hover:bg-color-gold hover:bg-opacity-10 hover:text-color-gold transition-all">
                    <i class="fas fa-concierge-bell w-5 text-center"></i>
                    <span class="ml-3 sidebar-text">Services</span>
                </a>
            </li>
            <li class="mb-1 ${param.active == 'information' ? 'bg-color-gold bg-opacity-10 text-color-gold' : ''}">
                <a href="${pageContext.request.contextPath}/information" 
                   class="flex items-center px-3 py-3 rounded-md hover:bg-color-gold hover:bg-opacity-10 hover:text-color-gold transition-all">
                    <i class="fas fa-info-circle w-5 text-center"></i>
                    <span class="ml-3 sidebar-text">Information</span>
                </a>
            </li>
            <li class="mb-1 ${param.active == 'reports' ? 'bg-color-gold bg-opacity-10 text-color-gold' : ''}">
                <a href="${pageContext.request.contextPath}/reports" 
                   class="flex items-center px-3 py-3 rounded-md hover:bg-color-gold hover:bg-opacity-10 hover:text-color-gold transition-all">
                    <i class="fas fa-chart-line w-5 text-center"></i>
                    <span class="ml-3 sidebar-text">Reports</span>
                </a>
            </li>
            <li class="mb-1 ${param.active == 'settings' ? 'bg-color-gold bg-opacity-10 text-color-gold' : ''}">
                <a href="${pageContext.request.contextPath}/settings" 
                   class="flex items-center px-3 py-3 rounded-md hover:bg-color-gold hover:bg-opacity-10 hover:text-color-gold transition-all">
                    <i class="fas fa-cog w-5 text-center"></i>
                    <span class="ml-3 sidebar-text">Settings</span>
                </a>
            </li>
        </ul>
    </nav>

    <!-- Sidebar Footer -->
    <div class="p-4 border-t border-gray-100 mt-auto">
        <div class="flex items-center">
            <div class="w-8 h-8 rounded-full bg-color-gold text-white flex items-center justify-center">
                <i class="fas fa-user-alt"></i>
            </div>
            <div class="ml-3 sidebar-text">
                <p class="text-sm font-medium">Admin User</p>
                <a href="#" class="text-xs text-gray-500 hover:text-color-gold">View Profile</a>
            </div>
        </div>
        <div class="mt-4 text-xs text-gray-500 text-center sidebar-text">
            <p>&copy; <%= java.time.Year.now() %> Vista Hotel</p>
        </div>
    </div>
</div>
