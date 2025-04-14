<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Flora</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <div class="container header-container">
            <div class="logo">
                <a href="index.jsp">
                    <h1>Flora</h1>
                </a>
            </div>
            <div class="admin-header-title">
                <h2>Admin Dashboard</h2>
            </div>
            <div class="header-actions">
                <a href="index.jsp" class="header-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                    <span class="header-icon-text">View Site</span>
                </a>
                <div class="admin-user-menu">
                    <span>Admin</span>
                    <img src="/placeholder.svg?height=32&width=32" alt="Admin Avatar" class="admin-avatar">
                </div>
            </div>
        </div>
    </header>

    <div class="admin-layout">
        <aside class="admin-sidebar">
            <nav class="admin-nav">
                <ul>
                    <li>
                        <a href="#" class="active" data-tab="dashboard">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="7" height="9" x="3" y="3" rx="1"></rect><rect width="7" height="5" x="14" y="3" rx="1"></rect><rect width="7" height="9" x="14" y="12" rx="1"></rect><rect width="7" height="5" x="3" y="16" rx="1"></rect></svg>
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="#" data-tab="orders">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z"></path><path d="M3 6h18"></path><path d="M16 10a4 4 0 0 1-8 0"></path></svg>
                            Orders
                        </a>
                    </li>
                    <li>
                        <a href="#" data-tab="products">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m21 16-4 4-4-4"></path><path d="M17 20V4"></path><path d="M3 8l4-4 4 4"></path><path d="M7 4v16"></path></svg>
                            Products
                        </a>
                    </li>
                    <li>
                        <a href="#" data-tab="customers">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M22 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                            Customers
                        </a>
                    </li>
                    <li>
                        <a href="#" data-tab="categories">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></svg>
                            Categories
                        </a>
                    </li>
                    <li>
                        <a href="#" data-tab="reports">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 3v18h18"></path><path d="m19 9-5 5-4-4-3 3"></path></svg>
                            Reports
                        </a>
                    </li>
                    <li>
                        <a href="#" data-tab="settings">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                            Settings
                        </a>
                    </li>
                    <li class="logout-item">
                        <a href="login.jsp">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
                            Logout
                        </a>
                    </li>
                </ul>
            </nav>
        </aside>
        
        <main class="admin-main">
            <!-- Dashboard Tab -->
            <div class="admin-tab active" id="dashboard-tab">
                <div class="admin-header">
                    <h1>Dashboard</h1>
                    <div class="date-filter">
                        <label for="date-range">Date Range:</label>
                        <select id="date-range">
                            <option>Last 7 days</option>
                            <option>Last 30 days</option>
                            <option>This month</option>
                            <option>Last month</option>
                            <option>Custom range</option>
                        </select>
                    </div>
                </div>
                
                <div class="stat-cards">
                    <div class="stat-card">
                        <div class="stat-card-content">
                            <h3>Total Sales</h3>
                            <p class="stat-value">$12,456</p>
                            <p class="stat-change positive">+12.5% from last period</p>
                        </div>
                        <div class="stat-card-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><path d="M16 8h-6.5a2.5 2.5 0 0 0 0 5h3a2.5 2.5 0 0 1 0 5H6"></path><path d="M12 18v2"></path><path d="M12 4v2"></path></svg>
                        </div>
                    </div>
                    
                    <div class="stat-card">
                        <div class="stat-card-content">
                            <h3>Orders</h3>
                            <p class="stat-value">156</p>
                            <p class="stat-change positive">+8.2% from last period</p>
                        </div>
                        <div class="stat-card-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z"></path><path d="M3 6h18"></path><path d="M16 10a4 4 0 0 1-8 0"></path></svg>
                        </div>
                    </div>
                    
                    <div class="stat-card">
                        <div class="stat-card-content">
                            <h3>Customers</h3>
                            <p class="stat-value">1,245</p>
                            <p class="stat-change positive">+5.3% from last period</p>
                        </div>
                        <div class="stat-card-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M22 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                        </div>
                    </div>
                    
                    <div class="stat-card">
                        <div class="stat-card-content">
                            <h3>Avg. Order Value</h3>
                            <p class="stat-value">$79.85</p>
                            <p class="stat-change negative">-2.1% from last period</p>
                        </div>
                        <div class="stat-card-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2v20"></path><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
                        </div>
                    </div>
                </div>
                
                <div class="admin-row">
                    <div class="admin-col">
                        <div class="admin-card">
                            <div class="admin-card-header">
                                <h3>Recent Orders</h3>
                                <a href="#" class="view-all">View All</a>
                            </div>
                            <div class="table-responsive">
                                <table class="admin-table">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Customer</th>
                                            <th>Date</th>
                                            <th>Status</th>
                                            <th>Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>#FL12345</td>
                                            <td>John Doe</td>
                                            <td>April 6, 2025</td>
                                            <td><span class="status-badge delivered">Delivered</span></td>
                                            <td>$188.96</td>
                                        </tr>
                                        <tr>
                                            <td>#FL12346</td>
                                            <td>Jane Smith</td>
                                            <td>April 5, 2025</td>
                                            <td><span class="status-badge processing">Processing</span></td>
                                            <td>$124.50</td>
                                        </tr>
                                        <tr>
                                            <td>#FL12347</td>
                                            <td>Robert Johnson</td>
                                            <td>April 5, 2025</td>
                                            <td><span class="status-badge shipped">Shipped</span></td>
                                            <td>$89.99</td>
                                        </tr>
                                        <tr>
                                            <td>#FL12348</td>
                                            <td>Emily Davis</td>
                                            <td>April 4, 2025</td>
                                            <td><span class="status-badge delivered">Delivered</span></td>
                                            <td>$145.75</td>
                                        </tr>
                                        <tr>
                                            <td>#FL12349</td>
                                            <td>Michael Wilson</td>
                                            <td>April 4, 2025</td>
                                            <td><span class="status-badge processing">Processing</span></td>
                                            <td>$67.25</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <div class="admin-col">
                        <div class="admin-card">
                            <div class="admin-card-header">
                                <h3>Top Selling Products</h3>
                                <a href="#" class="view-all">View All</a>
                            </div>
                            <ul class="product-list">
                                <li class="product-item">
                                    <div class="product-image">
                                        <img src="/placeholder.svg?height=50&width=50" alt="Spring Delight">
                                    </div>
                                    <div class="product-details">
                                        <h4>Spring Delight</h4>
                                        <p>124 sold</p>
                                    </div>
                                    <div class="product-sales">$6,197.76</div>
                                </li>
                                <li class="product-item">
                                    <div class="product-image">
                                        <img src="/placeholder.svg?height=50&width=50" alt="Elegant Roses">
                                    </div>
                                    <div class="product-details">
                                        <h4>Elegant Roses</h4>
                                        <p>98 sold</p>
                                    </div>
                                    <div class="product-sales">$6,859.02</div>
                                </li>
                                <li class="product-item">
                                    <div class="product-image">
                                        <img src="/placeholder.svg?height=50&width=50" alt="Lavender Love">
                                    </div>
                                    <div class="product-details">
                                        <h4>Lavender Love</h4>
                                        <p>87 sold</p>
                                    </div>
                                    <div class="product-sales">$4,871.13</div>
                                </li>
                                <li class="product-item">
                                    <div class="product-image">
                                        <img src="/placeholder.svg?height=50&width=50" alt="Sunshine Bouquet">
                                    </div>
                                    <div class="product-details">
                                        <h4>Sunshine Bouquet</h4>
                                        <p>76 sold</p>
                                    </div>
                                    <div class="product-sales">$3,495.24</div>
                                </li>
                                <li class="product-item">
                                    <div class="product-image">
                                        <img src="/placeholder.svg?height=50&width=50" alt="Tropical Paradise">
                                    </div>
                                    <div class="product-details">
                                        <h4>Tropical Paradise</h4>
                                        <p>65 sold</p>
                                    </div>
                                    <div class="product-sales">$5,199.35</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Other tabs would be here but are hidden by default -->
        </main>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Tab switching functionality
            const tabLinks = document.querySelectorAll('.admin-nav a');
            const tabContents = document.querySelectorAll('.admin-tab');
            
            tabLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    if (this.getAttribute('href') !== 'login.jsp') {
                        e.preventDefault();
                        
                        // Remove active class from all links
                        tabLinks.forEach(l => l.classList.remove('active'));
                        
                        // Add active class to clicked link
                        this.classList.add('active');
                        
                        // Hide all tab contents
                        tabContents.forEach(tab => tab.classList.remove('active'));
                        
                        // Show the corresponding tab content
                        const tabId = this.getAttribute('data-tab') + '-tab';
                        document.getElementById(tabId).classList.add('active');
                    }
                });
            });
        });
    </script>
</body>
</html>