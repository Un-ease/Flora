<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Flora</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body class="admin-body">
    <header class="admin-header">
        <div class="container">
            <div class="logo">
                <a href="index.jsp">
                    <h1>Flora</h1>
                </a>
            </div>
            <div class="admin-header-right">
                <div class="admin-user">
                    <span>Admin User</span>
    <a href="#" onclick="document.getElementById('logoutForm').submit(); return false;">Logout</a>
    <form id="logoutForm" action="${pageContext.request.contextPath}/LogOutController" method="get" style="display:none;">
        <input type="hidden" name="csrfToken" value="${csrfToken}">
    </form>
                </div>
            </div>
        </div>
    </header>

    <div class="admin-container">
        <aside class="admin-sidebar">
            <nav class="admin-nav">
                <ul>
                    <li><a href="#" class="active">Dashboard</a></li>
                    <li><a href="#">Products</a></li>
                    <li><a href="#">Orders</a></li>
                    <li><a href="#">Customers</a></li>
                    <li><a href="#">Reports</a></li>
                    <li><a href="#">Settings</a></li>
                </ul>
            </nav>
        </aside>
        
        <main class="admin-content">
            <div class="admin-page-header">
                <h2>Admin Dashboard</h2>
                <p>Welcome to your admin panel</p>
            </div>
            
            <div class="admin-stats">
                <div class="admin-stat-card">
                    <h3>Total Products</h3>
                    <p class="stat-number">24</p>
                </div>
                <div class="admin-stat-card">
                    <h3>Total Orders</h3>
                    <p class="stat-number">156</p>
                </div>
                <div class="admin-stat-card">
                    <h3>Total Customers</h3>
                    <p class="stat-number">89</p>
                </div>
                <div class="admin-stat-card">
                    <h3>Revenue</h3>
                    <p class="stat-number">$4,285</p>
                </div>
            </div>
            
            <div class="admin-section">
                <div class="section-header">
                    <h3>Recent Orders</h3>
                    <a href="#" class="btn-small">View All</a>
                </div>
                <div class="admin-table-container">
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Total</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#1005</td>
                                <td>John Smith</td>
                                <td>April 18, 2025</td>
                                <td><span class="status pending">Pending</span></td>
                                <td>$65.99</td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="#" class="btn-small">View</a>
                                        <a href="#" class="btn-small">Edit</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>#1004</td>
                                <td>Sarah Johnson</td>
                                <td>April 17, 2025</td>
                                <td><span class="status shipped">Shipped</span></td>
                                <td>$29.99</td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="#" class="btn-small">View</a>
                                        <a href="#" class="btn-small">Edit</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>#1003</td>
                                <td>Michael Brown</td>
                                <td>April 16, 2025</td>
                                <td><span class="status completed">Completed</span></td>
                                <td>$45.98</td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="#" class="btn-small">View</a>
                                        <a href="#" class="btn-small">Edit</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>#1002</td>
                                <td>Jane Doe</td>
                                <td>April 15, 2025</td>
                                <td><span class="status pending">Pending</span></td>
                                <td>$45.98</td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="#" class="btn-small">View</a>
                                        <a href="#" class="btn-small">Edit</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>#1001</td>
                                <td>Jane Doe</td>
                                <td>March 28, 2025</td>
                                <td><span class="status completed">Completed</span></td>
                                <td>$29.99</td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="#" class="btn-small">View</a>
                                        <a href="#" class="btn-small">Edit</a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="admin-section">
                <div class="section-header">
                    <h3>Add New Product</h3>
                </div>
                <form class="admin-form">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="product-name">Product Name</label>
                            <input type="text" id="product-name" required>
                        </div>
                        <div class="form-group">
                            <label for="product-price">Price ($)</label>
                            <input type="number" id="product-price" step="0.01" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="product-category">Category</label>
                            <select id="product-category">
                                <option>Roses</option>
                                <option>Tulips</option>
                                <option>Lilies</option>
                                <option>Bouquets</option>
                                <option>Plants</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="product-stock">Stock Quantity</label>
                            <input type="number" id="product-stock" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="product-description">Description</label>
                        <textarea id="product-description" rows="4"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="product-image">Product Image</label>
                        <input type="file" id="product-image">
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn">Add Product</button>
                        <button type="reset" class="btn-outline">Reset</button>
                    </div>
                </form>
            </div>
        </main>
    </div>

    <footer class="admin-footer">
        <div class="container">
            <p>&copy; 2025 Bloom & Blossom Admin Panel. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
