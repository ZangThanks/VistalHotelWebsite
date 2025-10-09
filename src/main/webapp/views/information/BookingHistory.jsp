<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Booking History - Vistal Hotel</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/global.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/output.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bookingHistory.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        </head>

        <body>
            <div class="main-container">
                <!-- Sidebar -->
                <jsp:include page="../layout/sidebar.jsp">
                    <jsp:param name="active" value="bookings" />
                </jsp:include>

                <!-- Main Content -->
                <div class="content-wrapper">
                    <!-- Header with User Info -->
                    <div class="booking-header">
                        <div class="header-top">
                            <h1 class="booking-title">Booking History</h1>
                            <div class="admin-section">
                                <button class="notification-btn">
                            <i class="fas fa-bell"></i>
                        </button>
                                <div class="admin-info">
                                    <img src="${pageContext.request.contextPath}/assets/images/avt.png" alt="Admin" class="admin-avatar">
                                    <span class="admin-name">TDK</span>
                                </div>
                            </div>
                        </div>

                        <!-- Controls Section -->
                        <div class="controls-section">
                            <div class="search-box">
                                <i class="fas fa-search search-icon"></i>
                                <input type="text" class="search-input" placeholder="Search here...">
                            </div>

                            <button class="btn btn-primary">
                        <i class="fas fa-chart-bar"></i>
                        View analytics
                    </button>

                            <button class="btn btn-secondary">
                        <i class="fas fa-download"></i>
                        Download PDF
                    </button>

                            <button class="btn btn-beige btn-icon">
                        <i class="fas fa-sliders-h"></i>
                    </button>

                            <div class="dropdown">
                                <button class="btn btn-beige dropdown-toggle">
                            Newest
                            <i class="fas fa-chevron-down"></i>
                        </button>
                                <div class="dropdown-menu">
                                    <a href="#" class="dropdown-item">Newest First</a>
                                    <a href="#" class="dropdown-item">Oldest First</a>
                                    <a href="#" class="dropdown-item">Highest Total</a>
                                    <a href="#" class="dropdown-item">Most Guests</a>
                                </div>
                            </div>

                            <button class="btn btn-add" onclick="openAddRoomModal()">
                        <i class="fas fa-plus"></i>
                        Add New Room
                    </button>
                        </div>
                    </div>

                    <!-- Booking List Section -->
                    <div class="booking-list-section">
                        <!-- Booking Item 1 -->
                        <div class="booking-item">
                            <div class="booking-id-section">
                                <i class="fas fa-check-circle status-icon"></i>
                                <div>
                                    <span class="booking-id">#123</span>
                                    <h3 class="room-name">Phòng 101 • Single Room</h3>
                                    <p class="booking-date">
                                        <i class="fas fa-calendar-alt"></i> Published on January 25, 2025 Guest: Lê C
                                    </p>
                                </div>
                            </div>

                            <div class="booking-stats">
                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-chart-line"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">$63.04</span>
                                        <span class="stat-label">Total</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-user-friends"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">1</span>
                                        <span class="stat-label">Guests</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">1</span>
                                        <span class="stat-label">Nights</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-comment-dots"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">1</span>
                                        <span class="stat-label">Note</span>
                                    </div>
                                </div>
                            </div>

                            <div class="booking-actions">
                                <button class="action-btn">
                            <i class="fas fa-eye"></i>
                        </button>
                                <button class="action-btn">
                            <i class="fas fa-edit"></i>
                        </button>
                                <button class="action-btn delete-btn">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                            </div>
                        </div>

                        <!-- Booking Item 2 -->
                        <div class="booking-item">
                            <div class="booking-id-section">
                                <i class="fas fa-check-circle status-icon"></i>
                                <div>
                                    <span class="booking-id">#1245</span>
                                    <h3 class="room-name">Phòng 202 • Double Room</h3>
                                    <p class="booking-date">
                                        <i class="fas fa-calendar-alt"></i> Published on January 25, 2025 Guest: Lê C
                                    </p>
                                </div>
                            </div>

                            <div class="booking-stats">
                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-chart-line"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">$63.04</span>
                                        <span class="stat-label">Total</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-user-friends"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">2</span>
                                        <span class="stat-label">Guests</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">3</span>
                                        <span class="stat-label">Nights</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-comment-dots"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">10</span>
                                        <span class="stat-label">Comments</span>
                                    </div>
                                </div>
                            </div>

                            <div class="booking-actions">
                                <button class="action-btn">
                            <i class="fas fa-eye"></i>
                        </button>
                                <button class="action-btn">
                            <i class="fas fa-edit"></i>
                        </button>
                                <button class="action-btn delete-btn">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                            </div>
                        </div>

                        <!-- Booking Item 3 -->
                        <div class="booking-item">
                            <div class="booking-id-section">
                                <i class="fas fa-check-circle status-icon"></i>
                                <div>
                                    <span class="booking-id">#1245</span>
                                    <h3 class="room-name">Phòng 305 • Suite</h3>
                                    <p class="booking-date">
                                        <i class="fas fa-calendar-alt"></i> Published on January 25, 2026 Guest: Lê C
                                    </p>
                                </div>
                            </div>

                            <div class="booking-stats">
                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-chart-line"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">$63.04</span>
                                        <span class="stat-label">Total</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-user-friends"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">4</span>
                                        <span class="stat-label">Guests</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">2</span>
                                        <span class="stat-label">Nights</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-comment-dots"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">3</span>
                                        <span class="stat-label">Comments</span>
                                    </div>
                                </div>
                            </div>

                            <div class="booking-actions">
                                <button class="action-btn">
                            <i class="fas fa-eye"></i>
                        </button>
                                <button class="action-btn">
                            <i class="fas fa-edit"></i>
                        </button>
                                <button class="action-btn delete-btn">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                            </div>
                        </div>

                        <!-- Booking Item 4 -->
                        <div class="booking-item">
                            <div class="booking-id-section">
                                <i class="fas fa-check-circle status-icon"></i>
                                <div>
                                    <span class="booking-id">#245</span>
                                    <h3 class="room-name">Phòng 305 • Suite</h3>
                                    <p class="booking-date">
                                        <i class="fas fa-calendar-alt"></i> Published on January 25, 2026 Guest: Lê C
                                    </p>
                                </div>
                            </div>

                            <div class="booking-stats">
                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-chart-line"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">$63.04</span>
                                        <span class="stat-label">Total</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-user-friends"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">3</span>
                                        <span class="stat-label">Guests</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">3</span>
                                        <span class="stat-label">Nights</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-comment-dots"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">0</span>
                                        <span class="stat-label">Comments</span>
                                    </div>
                                </div>
                            </div>

                            <div class="booking-actions">
                                <button class="action-btn">
                            <i class="fas fa-eye"></i>
                        </button>
                                <button class="action-btn">
                            <i class="fas fa-edit"></i>
                        </button>
                                <button class="action-btn delete-btn">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                            </div>
                        </div>

                        <!-- Booking Item 5 -->
                        <div class="booking-item">
                            <div class="booking-id-section">
                                <i class="fas fa-check-circle status-icon"></i>
                                <div>
                                    <span class="booking-id">#1234</span>
                                    <h3 class="room-name">Phòng 305 • Suite</h3>
                                    <p class="booking-date">
                                        <i class="fas fa-calendar-alt"></i> Published on January 25, 2026 Guest: Lê C
                                    </p>
                                </div>
                            </div>

                            <div class="booking-stats">
                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-chart-line"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">$63.04</span>
                                        <span class="stat-label">Total</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-user-friends"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">3</span>
                                        <span class="stat-label">Guests</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-calendar-alt"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">5</span>
                                        <span class="stat-label">Nights</span>
                                    </div>
                                </div>

                                <div class="stat-item">
                                    <div class="stat-icon">
                                        <i class="fas fa-comment-dots"></i>
                                    </div>
                                    <div>
                                        <span class="stat-value">2</span>
                                        <span class="stat-label">Comments</span>
                                    </div>
                                </div>
                            </div>

                            <div class="booking-actions">
                                <button class="action-btn">
                            <i class="fas fa-eye"></i>
                        </button>
                                <button class="action-btn">
                            <i class="fas fa-edit"></i>
                        </button>
                                <button class="action-btn delete-btn">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                            </div>
                        </div>

                        <!-- Pagination -->
                        <div class="pagination">
                            <button class="pagination-btn">
                        <i class="fas fa-chevron-left"></i>
                    </button>
                            <button class="pagination-btn active">1</button>
                            <button class="pagination-btn">2</button>
                            <button class="pagination-btn">3</button>
                            <button class="pagination-btn">
                        <i class="fas fa-chevron-right"></i>
                    </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Add New Room Modal -->
            <div id="addRoomModal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2>Add New Room Booking</h2>
                        <button class="close-modal" onclick="closeAddRoomModal()">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                    <form class="modal-form">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="roomNumber">Room Number</label>
                                <input type="text" id="roomNumber" placeholder="e.g., 305" required>
                            </div>
                            <div class="form-group">
                                <label for="roomType">Room Type</label>
                                <select id="roomType" required>
                                    <option value="">Select room type</option>
                                    <option value="single">Single Room</option>
                                    <option value="double">Double Room</option>
                                    <option value="suite">Suite</option>
                                    <option value="deluxe">Deluxe Room</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="guestName">Guest Name</label>
                                <input type="text" id="guestName" placeholder="Enter guest name" required>
                            </div>
                            <div class="form-group">
                                <label for="guestCount">Number of Guests</label>
                                <input type="number" id="guestCount" min="1" placeholder="1" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="checkInDate">Check-in Date</label>
                                <input type="date" id="checkInDate" required>
                            </div>
                            <div class="form-group">
                                <label for="checkOutDate">Check-out Date</label>
                                <input type="date" id="checkOutDate" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="nightsCount">Number of Nights</label>
                                <input type="number" id="nightsCount" min="1" placeholder="1" required>
                            </div>
                            <div class="form-group">
                                <label for="totalAmount">Total Amount ($)</label>
                                <input type="number" id="totalAmount" step="0.01" placeholder="63.04" required>
                            </div>
                        </div>

                        <div class="form-group full-width">
                            <label for="specialNotes">Special Notes</label>
                            <textarea id="specialNotes" rows="4" placeholder="Enter any special requests or notes..."></textarea>
                        </div>

                        <div class="form-actions">
                            <button type="button" class="btn-cancel" onclick="closeAddRoomModal()">Cancel</button>
                            <button type="submit" class="btn-submit">Add Booking</button>
                        </div>
                    </form>
                </div>
            </div>

            <script>
                // Open Add Room Modal
                function openAddRoomModal() {
                    document.getElementById('addRoomModal').style.display = 'flex';
                }

                // Close Add Room Modal
                function closeAddRoomModal() {
                    document.getElementById('addRoomModal').style.display = 'none';
                }

                // Close modal when clicking outside
                window.onclick = function(event) {
                    const modal = document.getElementById('addRoomModal');
                    if (event.target === modal) {
                        closeAddRoomModal();
                    }
                }

                // Dropdown toggle functionality
                document.querySelectorAll('.dropdown-toggle').forEach(button => {
                    button.addEventListener('click', function(e) {
                        e.stopPropagation();
                        const dropdown = this.closest('.dropdown');
                        const menu = dropdown.querySelector('.dropdown-menu');

                        // Close other dropdowns
                        document.querySelectorAll('.dropdown-menu').forEach(m => {
                            if (m !== menu) m.classList.remove('show');
                        });

                        menu.classList.toggle('show');
                    });
                });

                // Close dropdown when clicking outside
                document.addEventListener('click', function() {
                    document.querySelectorAll('.dropdown-menu').forEach(menu => {
                        menu.classList.remove('show');
                    });
                });

                // Dropdown item selection
                document.querySelectorAll('.dropdown-item').forEach(item => {
                    item.addEventListener('click', function(e) {
                        e.preventDefault();
                        const dropdown = this.closest('.dropdown');
                        const toggle = dropdown.querySelector('.dropdown-toggle');
                        const text = toggle.childNodes[0];
                        text.textContent = this.textContent + ' ';
                        dropdown.querySelector('.dropdown-menu').classList.remove('show');
                    });
                });
            </script>
        </body>

        </html>