<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Incident Reporting - Vista Hotel</title>
        <link href="../../assets/css/output.css" rel="stylesheet">
        <link href="../../assets/css/global.css" rel="stylesheet">
        <link href="../../assets/css/incidentReporting.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>

    <body>
        <div class="main-container">
            <!-- Sidebar -->
            <jsp:include page="../layout/sidebar.jsp">
                <jsp:param name="active" value="incidents" />
            </jsp:include>

            <!-- Main Content -->
            <div class="content-wrapper">
                <!-- Admin Section -->
                <div class="admin-section">
                    <i class="fas fa-bell bell-icon"></i>
                    <div class="admin-avatar">A</div>
                    <span class="admin-text">Admin</span>
                </div>

                <!-- Header Section -->
                <div class="incident-header">
                    <h1 class="incident-title">Incident Reporting</h1>

                    <div class="controls-section">
                        <!-- Search Box -->
                        <div class="search-box">
                            <i class="fas fa-search search-icon"></i>
                            <input type="text" class="search-input" placeholder="Search here...">
                        </div>

                        <!-- Action Buttons -->
                        <button class="btn btn-primary">
                        <i class="fas fa-plus"></i>
                        Add New Incident
                    </button>
                        <button class="btn btn-secondary">
                        <i class="fas fa-chart-line"></i>
                        View analytics
                    </button>
                        <button class="btn btn-secondary">
                        <i class="fas fa-download"></i>
                        Download PDF
                    </button>

                        <!-- Filter Dropdown -->
                        <div class="dropdown">
                            <button class="btn btn-icon dropdown-toggle" id="filterDropdown">
                                <i class="fas fa-sliders-h"></i>
                            </button>
                            <div class="dropdown-menu" id="filterMenu">
                                <div class="dropdown-header">Filter Options</div>
                                <a href="#" class="dropdown-item">
                                    <i class="fas fa-filter"></i> Show All
                                </a>
                                <a href="#" class="dropdown-item">
                                    <i class="fas fa-check-circle"></i> Show Resolved Only
                                </a>
                                <a href="#" class="dropdown-item">
                                    <i class="fas fa-exclamation-circle"></i> Show Open Only
                                </a>
                                <a href="#" class="dropdown-item">
                                    <i class="fas fa-clock"></i> Show In Progress
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item">
                                    <i class="fas fa-redo"></i> Reset Filters
                                </a>
                            </div>
                        </div>

                        <!-- Sort Dropdown -->
                        <div class="dropdown">
                            <button class="btn btn-beige dropdown-toggle" id="sortDropdown">
                                Newest
                                <i class="fas fa-chevron-down"></i>
                            </button>
                            <div class="dropdown-menu" id="sortMenu">
                                <div class="dropdown-header">Sort By</div>
                                <a href="#" class="dropdown-item active">
                                    <i class="fas fa-arrow-down"></i> Newest First
                                </a>
                                <a href="#" class="dropdown-item">
                                    <i class="fas fa-arrow-up"></i> Oldest First
                                </a>
                                <a href="#" class="dropdown-item">
                                    <i class="fas fa-sort-alpha-down"></i> Incident ID (A-Z)
                                </a>
                                <a href="#" class="dropdown-item">
                                    <i class="fas fa-sort-alpha-up"></i> Incident ID (Z-A)
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Filters Section -->
                <div class="filters-section">
                    <div class="filters-grid">
                        <div class="filter-group">
                            <label class="filter-label">Category</label>
                            <select class="filter-select">
                            <option>All</option>
                            <option>Security</option>
                            <option>Maintenance</option>
                            <option>Service</option>
                        </select>
                        </div>
                        <div class="filter-group">
                            <label class="filter-label">Status</label>
                            <select class="filter-select">
                            <option>All</option>
                            <option>Open</option>
                            <option>Resolved</option>
                            <option>In Progress</option>
                        </select>
                        </div>
                        <div class="filter-group">
                            <label class="filter-label">Severity</label>
                            <select class="filter-select">
                            <option>All</option>
                            <option>Low</option>
                            <option>Medium</option>
                            <option>High</option>
                        </select>
                        </div>
                        <div class="filter-group">
                            <label class="filter-label">Date from</label>
                            <div class="date-input-wrapper">
                                <input type="text" class="filter-input" placeholder="Select date">
                                <i class="fas fa-calendar-alt date-icon"></i>
                            </div>
                        </div>
                        <div class="filter-group">
                            <label class="filter-label">Date to</label>
                            <div class="date-input-wrapper">
                                <input type="text" class="filter-input" placeholder="Select date">
                                <i class="fas fa-calendar-alt date-icon"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Table Section -->
                <div class="table-section">
                    <table class="incident-table">
                        <thead>
                            <tr>
                                <th>
                                    Incident ID
                                    <i class="fas fa-sort sort-icon"></i>
                                </th>
                                <th>
                                    Date & Time
                                    <i class="fas fa-sort sort-icon"></i>
                                </th>
                                <th>Location</th>
                                <th>Category</th>
                                <th>Severity</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><span class="incident-id">INC-2317</span></td>
                                <td>Thu Mar 05 2020<br>22:46</td>
                                <td>Room 305</td>
                                <td>Security</td>
                                <td><span class="severity-badge severity-low">low</span></td>
                                <td><span class="status-badge status-resolved">Resolved</span></td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="action-btn">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="action-btn">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                        <button class="action-btn action-more">
                                            <i class="fas fa-ellipsis-h"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="incident-id">INC-2318</span></td>
                                <td>Sat Feb 29 2020<br>00:15</td>
                                <td>Room 1205</td>
                                <td>Security</td>
                                <td><span class="severity-badge severity-low">low</span></td>
                                <td><span class="status-badge status-resolved">Resolved</span></td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="action-btn">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="action-btn">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                        <button class="action-btn action-more">
                                            <i class="fas fa-ellipsis-h"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="incident-id">INC-2318</span></td>
                                <td>Thu Jan 23 2020<br>17:47</td>
                                <td>Room 1205</td>
                                <td>Maintenance</td>
                                <td><span class="severity-badge severity-medium">medium</span></td>
                                <td><span class="status-badge status-open">Open</span></td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="action-btn">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="action-btn">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                        <button class="action-btn action-more">
                                            <i class="fas fa-ellipsis-h"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="incident-id">INC-2319</span></td>
                                <td>2025-09-21 20:19</td>
                                <td>Room 305</td>
                                <td>Security</td>
                                <td><span class="severity-badge severity-low">low</span></td>
                                <td><span class="status-badge status-resolved">Resolved</span></td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="action-btn">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="action-btn">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                        <button class="action-btn action-more">
                                            <i class="fas fa-ellipsis-h"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>



                        </tbody>

                    </table>

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

        <!-- Add Incident Modal -->
        <div id="addIncidentModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title">Add New Incident</h2>
                    <button class="modal-close" onclick="closeModal()">
                        <i class="fas fa-times"></i>
                    </button>
                </div>

                <form class="incident-form">
                    <div class="form-grid">
                        <div class="form-group">
                            <label class="form-label">Incident ID</label>
                            <input type="text" class="form-input" placeholder="Auto-generated" readonly>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Date & Time</label>
                            <input type="datetime-local" class="form-input">
                        </div>

                        <div class="form-group">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-input" placeholder="e.g., Room 305">
                        </div>

                        <div class="form-group">
                            <label class="form-label">Category</label>
                            <select class="form-input">
                                <option value="">Select category</option>
                                <option value="security">Security</option>
                                <option value="maintenance">Maintenance</option>
                                <option value="service">Service</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Severity</label>
                            <select class="form-input">
                                <option value="">Select severity</option>
                                <option value="low">Low</option>
                                <option value="medium">Medium</option>
                                <option value="high">High</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Status</label>
                            <select class="form-input">
                                <option value="">Select status</option>
                                <option value="open">Open</option>
                                <option value="in-progress">In Progress</option>
                                <option value="resolved">Resolved</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group-full">
                        <label class="form-label">Description</label>
                        <textarea class="form-textarea" rows="4" placeholder="Describe the incident..."></textarea>
                    </div>

                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="closeModal()">Cancel</button>
                        <button type="submit" class="btn btn-primary">Save Incident</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            // Open modal when clicking Add New Incident button
            document.querySelector('.btn-primary').addEventListener('click', function() {
                document.getElementById('addIncidentModal').style.display = 'flex';
            });

            // Close modal function
            function closeModal() {
                document.getElementById('addIncidentModal').style.display = 'none';
            }

            // Close modal when clicking outside
            window.addEventListener('click', function(event) {
                const modal = document.getElementById('addIncidentModal');
                if (event.target === modal) {
                    closeModal();
                }
            });

            // Dropdown functionality
            const filterDropdownBtn = document.getElementById('filterDropdown');
            const filterMenu = document.getElementById('filterMenu');
            const sortDropdownBtn = document.getElementById('sortDropdown');
            const sortMenu = document.getElementById('sortMenu');

            // Toggle filter dropdown
            filterDropdownBtn.addEventListener('click', function(e) {
                e.stopPropagation();
                filterMenu.classList.toggle('show');
                sortMenu.classList.remove('show');
            });

            // Toggle sort dropdown
            sortDropdownBtn.addEventListener('click', function(e) {
                e.stopPropagation();
                sortMenu.classList.toggle('show');
                filterMenu.classList.remove('show');
            });

            // Handle dropdown item clicks
            document.querySelectorAll('.dropdown-item').forEach(item => {
                item.addEventListener('click', function(e) {
                    e.preventDefault();

                    // Remove active class from siblings
                    const parent = this.closest('.dropdown-menu');
                    parent.querySelectorAll('.dropdown-item').forEach(i => i.classList.remove('active'));

                    // Add active class to clicked item
                    this.classList.add('active');

                    // Update button text if it's sort dropdown
                    if (parent.id === 'sortMenu') {
                        const btnText = this.textContent.trim();
                        sortDropdownBtn.innerHTML = btnText + ' <i class="fas fa-chevron-down"></i>';
                    }

                    // Close dropdown
                    parent.classList.remove('show');
                });
            });

            // Close dropdowns when clicking outside
            document.addEventListener('click', function(e) {
                if (!e.target.closest('.dropdown')) {
                    filterMenu.classList.remove('show');
                    sortMenu.classList.remove('show');
                }
            });
        </script>
    </body>

    </html>