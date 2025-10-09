<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 06/10/2025
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%-- filepath: sidebar.jsp --%>
<link href="assets/css/global.css" rel="stylesheet">
<aside class="sidebar">
    <div class="sidebar-header">
        <h2>VISTA</h2>
        <p>Hotel Management</p>
    </div>
    <nav class="sidebar-nav">
        <ul>
            <li class="${param.active == 'dashboard' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            </li>
            <li class="${param.active == 'rooms' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/rooms"><i class="fas fa-bed"></i> Room Management</a>
            </li>
            <li class="${param.active == 'reservations' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/reservations"><i class="fas fa-calendar-alt"></i> Reservations</a>
            </li>
            <li class="${param.active == 'guests' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/guests"><i class="fas fa-users"></i> Guests</a>
            </li>
            <li class="${param.active == 'services' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/services"><i class="fas fa-concierge-bell"></i> Services</a>
            </li>
            <li class="${param.active == 'reports' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/reports"><i class="fas fa-chart-line"></i> Reports</a>
            </li>
            <li class="${param.active == 'settings' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/settings"><i class="fas fa-cog"></i> Settings</a>
            </li>
        </ul>
    </nav>
    <div class="sidebar-footer">
        <p>&copy; <%= java.time.Year.now() %> Vista Hotel</p>
    </div>
</aside>
