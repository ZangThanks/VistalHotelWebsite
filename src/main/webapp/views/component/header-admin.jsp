<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 11/10/2025
  Time: 11:35 PM
  To change this template use File | Settings | File Templates.
--%>
<script src="https://cdn.tailwindcss.com"></script>
<header class="flex justify-between items-center mb-5 pb-4 border-b border-color-cream">
    <div class="flex items-center">
        <!-- Sidebar Toggle Button -->
        <button id="toggleSidebar" class="mr-4 text-gray-500 hover:text-color-gold focus:outline-none">
            <i class="fas fa-bars text-xl"></i>
        </button>
        
        <!-- Page Title - Can be dynamic based on current page -->
        <h1 class="text-lg font-medium md:text-xl hidden md:block">Hotel Management System</h1>
    </div>

    <div class="flex items-center gap-2 md:gap-5">
        <!-- Search -->
        <div class="relative hidden md:block">
            <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
            <input type="text" placeholder="Search..." 
                class="w-40 lg:w-64 py-2 pl-10 pr-4 rounded-lg bg-gray-50 border border-gray-200 focus:border-color-gold focus:outline-none">
        </div>
        
        <!-- Notifications -->
        <div class="relative cursor-pointer p-2 hover:bg-gray-100 rounded-full">
            <i class="fas fa-bell text-lg text-gray-600"></i>
            <span class="absolute top-0 right-0 bg-color-gold text-color-white text-[10px] w-[18px] h-[18px] flex items-center justify-center rounded-full">2</span>
        </div>
        
        <!-- Messages -->
        <div class="relative cursor-pointer p-2 hover:bg-gray-100 rounded-full hidden md:block">
            <i class="fas fa-envelope text-lg text-gray-600"></i>
            <span class="absolute top-0 right-0 bg-color-info text-white text-[10px] w-[18px] h-[18px] flex items-center justify-center rounded-full">3</span>
        </div>
        
        <!-- User Profile -->
        <div class="flex items-center gap-2 cursor-pointer border-l pl-3 md:pl-5 ml-2 md:ml-4">
            <img src="https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small_2x/default-avatar-icon-of-social-media-user-vector.jpg" 
                alt="Profile" 
                class="w-8 h-8 md:w-10 md:h-10 rounded-full object-cover border-2 border-color-gold">
            <div class="hidden md:block">
                <p class="text-sm font-medium">Admin User</p>
                <p class="text-xs text-gray-500">Administrator</p>
            </div>
            <i class="fas fa-chevron-down text-xs text-gray-500 ml-2"></i>
        </div>
    </div>
</header>
