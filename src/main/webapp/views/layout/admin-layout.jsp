<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Vista Admin</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            'color-gold': '#ccbd89',
            'color-black': '#1a1a1a',
            'color-white': '#ffffff',
            'color-light': '#f5f5f5',
            'color-cream': '#f0ece2',
            'color-success': '#4caf50',
            'color-danger': '#f44336',
            'color-info': '#2196f3',
            'color-warning': '#ff9800'
          },
          fontFamily: {
            'playfair': ['Playfair Display', 'serif'],
            'poppins': ['Poppins', 'sans-serif']
          },
          transitionProperty: {
            'width': 'width'
          }
        }
      }
    }
  </script>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Playfair+Display:wght@400;500;600;700&display=swap');
    body { 
      font-family: 'Poppins', sans-serif;
      overflow-x: hidden;
    }
    .sidebar-transition {
      transition: width 0.3s ease-in-out, min-width 0.3s ease-in-out, transform 0.3s ease-in-out;
    }
    .content-transition {
      transition: margin-left 0.3s ease-in-out;
    }
    @media (max-width: 768px) {
      .sidebar-collapsed {
        transform: translateX(-100%);
      }
    }
  </style>
</head>
<body class="flex bg-color-light text-color-black">

<!-- Sidebar -->
<aside id="sidebar" class="sidebar-transition w-64 bg-color-white shadow-lg min-h-screen fixed z-20 overflow-y-auto">
  <jsp:include page="../component/sidebar.jsp" />
</aside>

<!-- Main Content -->
<main id="mainContent" class="content-transition flex-1 ml-64 flex flex-col min-h-screen">
  <!-- Header -->
  <header class="px-6 py-4 bg-color-white shadow-sm sticky top-0 z-10">
    <jsp:include page="../component/header-admin.jsp" />
  </header>

  <!-- Dynamic Page Content -->
  <div class="p-6 md:p-8 flex-1">
    <jsp:include page="${param.contentPage}" />
  </div>
</main>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('mainContent');
    const toggleButton = document.getElementById('toggleSidebar');
    const mobileBreakpoint = 768;
    
    function toggleSidebar() {
      if (sidebar.classList.contains('w-64')) {
        sidebar.classList.remove('w-64');
        sidebar.classList.add('w-20');
        mainContent.classList.remove('ml-64');
        mainContent.classList.add('ml-20');
        document.querySelectorAll('.sidebar-text').forEach(el => el.classList.add('hidden'));
        document.querySelectorAll('.sidebar-logo-full').forEach(el => el.classList.add('hidden'));
        document.querySelectorAll('.sidebar-logo-icon').forEach(el => el.classList.remove('hidden'));
      } else {
        sidebar.classList.remove('w-20');
        sidebar.classList.add('w-64');
        mainContent.classList.remove('ml-20');
        mainContent.classList.add('ml-64');
        document.querySelectorAll('.sidebar-text').forEach(el => el.classList.remove('hidden'));
        document.querySelectorAll('.sidebar-logo-full').forEach(el => el.classList.remove('hidden'));
        document.querySelectorAll('.sidebar-logo-icon').forEach(el => el.classList.add('hidden'));
      }
    }
    
    function handleResize() {
      if (window.innerWidth < mobileBreakpoint) {
        sidebar.classList.add('sidebar-collapsed');
        mainContent.classList.remove('ml-64', 'ml-20');
        mainContent.classList.add('ml-0');
      } else {
        sidebar.classList.remove('sidebar-collapsed');
        if (sidebar.classList.contains('w-20')) {
          mainContent.classList.remove('ml-0', 'ml-64');
          mainContent.classList.add('ml-20');
        } else {
          mainContent.classList.remove('ml-0', 'ml-20');
          mainContent.classList.add('ml-64');
        }
      }
    }

    toggleButton.addEventListener('click', function(e) {
      e.stopPropagation();
      if (window.innerWidth < mobileBreakpoint) {
        sidebar.classList.toggle('sidebar-collapsed');
      } else {
        toggleSidebar();
      }
    });
    
    document.addEventListener('click', function(e) {
      if (window.innerWidth < mobileBreakpoint && !sidebar.contains(e.target) && !toggleButton.contains(e.target)) {
        sidebar.classList.add('sidebar-collapsed');
      }
    });
    
    window.addEventListener('resize', handleResize);
    handleResize(); 
  });
</script>

</body>
</html>
