<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Loyalty Program - Vistal Hotel</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/global.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/output.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/loyaltyProgram.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        </head>

        <body>
            <div class="main-container">
                <!-- Sidebar -->
                <jsp:include page="../layout/sidebar.jsp">
                    <jsp:param name="active" value="loyalty" />
                </jsp:include>

                <!-- Main Content -->
                <div class="content-wrapper">
                    <!-- Header -->
                    <div class="loyalty-header">
                        <div class="header-top">
                            <h1 class="loyalty-title">Loyalty Program — Members</h1>
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

                        <!-- Stats Cards -->
                        <div class="stats-grid">
                            <div class="stat-card">
                                <div class="stat-content">
                                    <div class="stat-info">
                                        <span class="stat-label">Total<br>members</span>
                                        <h2 class="stat-value">6</h2>
                                        <span class="stat-change positive">+3% MoM</span>
                                    </div>
                                    <div class="stat-icon green">
                                        <i class="fas fa-users"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="stat-card">
                                <div class="stat-content">
                                    <div class="stat-info">
                                        <span class="stat-label">Active this month</span>
                                        <h2 class="stat-value">1</h2>
                                        <span class="stat-change positive">+5% MoM</span>
                                    </div>
                                    <div class="stat-icon green">
                                        <i class="fas fa-user-check"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="stat-card">
                                <div class="stat-content">
                                    <div class="stat-info">
                                        <span class="stat-label">Avg points</span>
                                        <h2 class="stat-value">8,000</h2>
                                    </div>
                                    <div class="stat-icon orange">
                                        <i class="fas fa-coins"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="stat-card">
                                <div class="stat-content">
                                    <div class="stat-info">
                                        <span class="stat-label">Redemptions</span>
                                        <h2 class="stat-value">1</h2>
                                        <span class="stat-change negative">-1% MoM</span>
                                    </div>
                                    <div class="stat-icon red">
                                        <i class="fas fa-chart-line"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Members Table Section -->
                    <div class="members-section">
                        <div class="table-controls">
                            <div class="search-box-table">
                                <i class="fas fa-search search-icon"></i>
                                <input type="text" class="search-input" placeholder="Search here...">
                            </div>

                            <button class="btn btn-add" onclick="openAddMemberModal()">
                        <i class="fas fa-plus"></i>
                        Add Member
                    </button>

                            <button class="btn btn-download">
                        <i class="fas fa-download"></i>
                        Download PDF
                    </button>

                            <div class="dropdown">
                                <button class="btn btn-beige dropdown-toggle">
                            Newest
                            <i class="fas fa-chevron-down"></i>
                        </button>
                                <div class="dropdown-menu">
                                    <a href="#" class="dropdown-item">Newest First</a>
                                    <a href="#" class="dropdown-item">Oldest First</a>
                                    <a href="#" class="dropdown-item">Highest Points</a>
                                    <a href="#" class="dropdown-item">Most Active</a>
                                </div>
                            </div>
                        </div>

                        <!-- Filters -->
                        <div class="filters-row">
                            <div class="filter-group">
                                <label>Tier</label>
                                <select class="filter-select">
                            <option value="">All</option>
                            <option value="gold">Gold</option>
                            <option value="silver">Silver</option>
                            <option value="bronze">Bronze</option>
                        </select>
                            </div>

                            <div class="filter-group">
                                <label>Status</label>
                                <select class="filter-select">
                            <option value="">All</option>
                            <option value="active">Active</option>
                            <option value="inactive">Inactive</option>
                        </select>
                            </div>

                            <div class="filter-group">
                                <label>Booking Status</label>
                                <select class="filter-select">
                            <option value="">All</option>
                            <option value="confirmed">Confirmed</option>
                            <option value="pending">Pending</option>
                            <option value="cancelled">Cancelled</option>
                        </select>
                            </div>

                            <div class="filter-group">
                                <label>Points Range</label>
                                <div class="range-inputs">
                                    <input type="number" placeholder="Min" class="range-input">
                                    <input type="number" placeholder="Max" class="range-input">
                                </div>
                            </div>

                            <div class="filter-group">
                                <label>Joined Date</label>
                                <div class="date-inputs">
                                    <input type="date" class="date-input">
                                    <input type="date" class="date-input">
                                </div>
                            </div>
                        </div>

                        <!-- Members Table -->
                        <div class="table-wrapper">
                            <table class="members-table">
                                <thead>
                                    <tr>
                                        <th>Member ID</th>
                                        <th>Name</th>
                                        <th>Tier</th>
                                        <th>Points</th>
                                        <th>Dates</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="member-id">101</td>
                                        <td>
                                            <div class="member-info">
                                                <strong>Emma Wilson</strong>
                                                <span class="member-email">emma@vista.com</span>
                                            </div>
                                        </td>
                                        <td><span class="tier-badge tier-gold">Gold</span></td>
                                        <td class="points">18,300</td>
                                        <td>
                                            <div class="dates-info">
                                                <span>Joined: 2022-05-12</span>
                                                <span>Last: 2025-09-21</span>
                                            </div>
                                        </td>
                                        <td><span class="status-badge status-active">Active</span></td>
                                        <td>
                                            <div class="action-buttons">
                                                <button class="action-btn" title="View">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                                <button class="action-btn" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                                <button class="action-btn delete-btn" title="Delete">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="member-id">102</td>
                                        <td>
                                            <div class="member-info">
                                                <strong>Emma Wilson</strong>
                                                <span class="member-email">emma@vista.com</span>
                                            </div>
                                        </td>
                                        <td><span class="tier-badge tier-gold">Gold</span></td>
                                        <td class="points">18,300</td>
                                        <td>
                                            <div class="dates-info">
                                                <span>Joined: 2022-05-12</span>
                                                <span>Last: 2025-09-21</span>
                                            </div>
                                        </td>
                                        <td><span class="status-badge status-inactive">inActive</span></td>
                                        <td>
                                            <div class="action-buttons">
                                                <button class="action-btn" title="View">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                                <button class="action-btn" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                                <button class="action-btn delete-btn" title="Delete">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="member-id">201</td>
                                        <td>
                                            <div class="member-info">
                                                <strong>Emma Wilson</strong>
                                                <span class="member-email">emma@vista.com</span>
                                            </div>
                                        </td>
                                        <td><span class="tier-badge tier-silver">Silver</span></td>
                                        <td class="points">8,450</td>
                                        <td>
                                            <div class="dates-info">
                                                <span>Joined: 2022-05-12</span>
                                                <span>Last: 2025-09-21</span>
                                            </div>
                                        </td>
                                        <td><span class="status-badge status-active">Active</span></td>
                                        <td>
                                            <div class="action-buttons">
                                                <button class="action-btn" title="View">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                                <button class="action-btn" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                                <button class="action-btn delete-btn" title="Delete">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="member-id">301</td>
                                        <td>
                                            <div class="member-info">
                                                <strong>Emma Wilson</strong>
                                                <span class="member-email">emma@vista.com</span>
                                            </div>
                                        </td>
                                        <td><span class="tier-badge tier-silver">Silver</span></td>
                                        <td class="points">8,450</td>
                                        <td>
                                            <div class="dates-info">
                                                <span>Joined: 2022-05-12</span>
                                                <span>Last: 2025-09-21</span>
                                            </div>
                                        </td>
                                        <td><span class="status-badge status-active">Active</span></td>
                                        <td>
                                            <div class="action-buttons">
                                                <button class="action-btn" title="View">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                                <button class="action-btn" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                                <button class="action-btn delete-btn" title="Delete">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
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

            <!-- Add Member Modal -->
            <div id="addMemberModal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2>Add New Member</h2>
                        <button class="close-modal" onclick="closeAddMemberModal()">
                    <i class="fas fa-times"></i>
                </button>
                    </div>
                    <form class="modal-form">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="memberName">Member Name</label>
                                <input type="text" id="memberName" placeholder="Enter full name" required>
                            </div>
                            <div class="form-group">
                                <label for="memberEmail">Email Address</label>
                                <input type="email" id="memberEmail" placeholder="email@example.com" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="memberTier">Tier</label>
                                <select id="memberTier" required>
                            <option value="">Select tier</option>
                            <option value="gold">Gold</option>
                            <option value="silver">Silver</option>
                            <option value="bronze">Bronze</option>
                        </select>
                            </div>
                            <div class="form-group">
                                <label for="memberPoints">Initial Points</label>
                                <input type="number" id="memberPoints" min="0" placeholder="0" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="memberPhone">Phone Number</label>
                                <input type="tel" id="memberPhone" placeholder="+1 234 567 8900">
                            </div>
                            <div class="form-group">
                                <label for="joinDate">Join Date</label>
                                <input type="date" id="joinDate" required>
                            </div>
                        </div>

                        <div class="form-group full-width">
                            <label for="memberNotes">Notes</label>
                            <textarea id="memberNotes" rows="3" placeholder="Additional notes about the member..."></textarea>
                        </div>

                        <div class="form-actions">
                            <button type="button" class="btn-cancel" onclick="closeAddMemberModal()">Cancel</button>
                            <button type="submit" class="btn-submit">Add Member</button>
                        </div>
                    </form>
                </div>
            </div>

            <script>
                // Open Add Member Modal
                function openAddMemberModal() {
                    document.getElementById('addMemberModal').style.display = 'flex';
                }

                // Close Add Member Modal
                function closeAddMemberModal() {
                    document.getElementById('addMemberModal').style.display = 'none';
                }

                // Close modal when clicking outside
                window.onclick = function(event) {
                    const modal = document.getElementById('addMemberModal');
                    if (event.target === modal) {
                        closeAddMemberModal();
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