<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="productDAO" class="dao.ProductDAO" scope="request"/>
<jsp:useBean id="userDAO" class="dao.UserDAO" scope="request"/>

<c:set var="products" value="${productDAO.allProducts}" scope="request"/>
<c:set var="users" value="${userDAO.allUsers}" scope="request"/>

<c:set var="activeSection" value="${not empty param.section ? param.section : 'dashboard'}" scope="request"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Flora</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
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
                    <a href="index.jsp" id="logout-link">Logout</a>
                    <form id="logoutForm" action="${pageContext.request.contextPath}/" method="get" style="display:none;">
                        <!-- Hidden form for logout functionality -->
                    </form>
                </div>
            </div>
        </div>
    </header>

    <div class="admin-container">
        <aside class="admin-sidebar">
            <nav class="admin-nav">
                <ul>
                    <li><a href="#dashboard-section" class="active" onclick="showSection('dashboard-section')">Dashboard</a></li>
                    <li><a href="#products-section" onclick="showSection('products-section')">Products</a></li>
                    <li><a href="#users-section" onclick="showSection('users-section')">Users</a></li>
                    <li><a href="#orders-section" onclick="showSection('orders-section')">Orders</a></li>
                    <li><a href="#reports-section" onclick="showSection('reports-section')">Reports</a></li>
                </ul>
            </nav>
        </aside>
        
        <main class="admin-content">
            <!-- Dashboard Section -->
            <section id="dashboard-section" class="admin-section-container active-section">
                <div class="admin-page-header">
                    <h2>Admin Dashboard</h2>
                    <p>Welcome to your Admin Panel</p>
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
                        <h3>Active Users</h3>
                        <p class="stat-number">42</p>
                    </div>
                </div>
                
                <div class="admin-section">
                    <div class="section-header">
                        <h3>Recent Orders</h3>
                        <a href="#orders-section" class="btn-small" onclick="showSection('orders-section')">View All</a>
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
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="admin-section">
                    <div class="section-header">
                        <h3>Recent Products</h3>
                        <a href="#products-section" class="btn-small" onclick="showSection('products-section')">View All</a>
                    </div>
                    <div class="admin-table-container">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>Product ID</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Stock</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#P001</td>
                                    <td><img src="/placeholder.svg?height=40&width=40" alt="Red Rose Bouquet" class="product-thumbnail"></td>
                                    <td>Red Rose Bouquet</td>
                                    <td>$29.99</td>
                                    <td>15</td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="#" class="btn-small">Edit</a>
                                            <a href="#" class="btn-small">Delete</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#P002</td>
                                    <td><img src="/placeholder.svg?height=40&width=40" alt="Tulip Arrangement" class="product-thumbnail"></td>
                                    <td>Tulip Arrangement</td>
                                    <td>$24.99</td>
                                    <td>8</td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="#" class="btn-small">Edit</a>
                                            <a href="#" class="btn-small">Delete</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>#P003</td>
                                    <td><img src="/placeholder.svg?height=40&width=40" alt="Lily Bouquet" class="product-thumbnail"></td>
                                    <td>Lily Bouquet</td>
                                    <td>$34.99</td>
                                    <td>12</td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="#" class="btn-small">Edit</a>
                                            <a href="#" class="btn-small">Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <!-- Products Section -->
            <section id="products-section" class="admin-section-container">
                <div class="admin-page-header">
                    <h2>Products Management</h2>
                    <p>Manage your product inventory</p>
                </div>
                
                <div class="admin-section">
                    <div class="section-header">
                        <h3>All Products</h3>
                    </div>
                    <div class="admin-table-container">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>Product ID</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Stock</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
							    <c:forEach items="${products}" var="product">
							        <tr>
							            <td>#${product.productId}</td>
							            <td><img src="${pageContext.request.contextPath}/uploads/${product.image}" class="product-thumbnail"></td>
							            <td>${product.productName}</td>
							            <td>$ ${product.price}</td>
							            <td>${product.quantity}</td>
							            <td>
							                <div class="action-buttons">
							                    <button class="btn-small" onclick="editProduct(${product.productId}, '${product.productName}', ${product.price}, ${product.quantity}, '${product.productDescription}')">Edit</button>
							                    <form action="${pageContext.request.contextPath}/RemoveProductController" method="post" style="display:inline;">
												    <input type="hidden" name="productID" value="${product.productId}">
												    <button type="submit" class="btn-small" 
												            onclick="return confirm('Are you sure you want to delete this product?')">
												        Delete
												    </button>
												</form>
							                </div>
							            </td>
							        </tr>
							    </c:forEach>
							</tbody>
                        </table>
                    </div>
                </div>

                <!-- Add the permanent Add New Product form section -->
                <div class="admin-section">
                    <div class="section-header">
                        <h3>Add New Product</h3>
                    </div>
                    <form class="admin-form" id="productForm"  action="${pageContext.request.contextPath}/AddProductController" method="post" enctype="multipart/form-data">
                        <div class="alert alert-success" style="display: none;">Product added successfully!</div>
                        <div class="alert alert-danger" style="display: none;">Error adding product. Please try again.</div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="product-name">Product Name</label>
                                <input type="text" id="product-name" name="productName" required>
                            </div>
                            <div class="form-group">
                                <label for="product-price">Price ($)</label>
                                <input type="number" id="product-price" name="price" step="0.01" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="product-stock">Stock Quantity</label>
                                <input type="number" id="product-stock" name="quantity" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="product-description">Description</label>
                            <textarea id="product-description" name="productDescription" rows="4"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="product-image">Product Image</label>
                            <input type="file" id="product-image" name="image" accept="image/*" required>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn">Add Product</button>
                            <button type="reset" class="btn-outline">Reset</button>
                        </div>
                    </form>
                </div>
                    
                <!-- Edit Product Form - Similar to User Edit Form -->
                <div id="edit-product-form" class="admin-form-container" style="display: none;">
                    <div class="section-header">
                        <h3>Edit Product</h3>
                    </div>
                    <div class="alert alert-success" style="display: none;">Product updated successfully!</div>
                    <div class="alert alert-danger" style="display: none;">Error updating product. Please try again.</div>
                    
                    <form class="admin-form" id="editProductForm" form action="${pageContext.request.contextPath}/EditProductController" method="post" enctype="multipart/form-data">
                        <input type="hidden" id="edit-product-id" name="productId">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="edit-product-name">Product Name</label>
                                <input type="text" id="edit-product-name" name="productName" required>
                            </div>
                            <div class="form-group">
                                <label for="edit-product-price">Price ($)</label>
                                <input type="number" id="edit-product-price" name="price" step="0.01" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="edit-product-stock">Stock Quantity</label>
                                <input type="number" id="edit-product-stock" name="quantity" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-product-description">Description</label>
                            <textarea id="edit-product-description" name="productDescription" rows="4"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="edit-product-image">Product Image</label>
                            <input type="file" id="edit-product-image" name="image" accept="image/*">
                            <p class="form-note">Leave empty to keep current image</p>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn">Update Product</button>
                            <button type="button" class="btn-outline" onclick="toggleForm('edit-product-form')">Cancel</button>
                        </div>
                    </form>
                </div>
            </section>

            <!-- Users Section -->
            <section id="users-section" class="admin-section-container">
                <div class="admin-page-header">
                    <h2>Users Management</h2>
                    <p>Manage system users and customers</p>
                </div>
                
                <div class="admin-section">
                    <div class="section-header">
                        <h3>All Users</h3>
                        <button class="btn-small" onclick="toggleForm('add-user-form')">Add New User</button>
                    </div>
                    
                    <!-- Add User Form -->
                    <div id="add-user-form" class="admin-form-container" style="display: none;">
                        <div class="section-header">
                            <h3>Add New User</h3>
                        </div>
                        <div class="alert alert-success" style="display: none;">User added successfully!</div>
                        <div class="alert alert-danger" style="display: none;">Error adding user. Please try again.</div>
                        
                        <form class="admin-form" id="userForm" action="${pageContext.request.contextPath}/AddUserController" method="post">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="user-fullname">Full Name</label>
                                    <input type="text" id="user-fullname" name="fullname" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="user-email">Email</label>
                                    <input type="email" id="user-email" name="email" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="user-password">Password</label>
                                    <input type="password" id="user-password" name="password" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="user-role">Role</label>
                                        <select id="user-role" name="role">
                                            <option value="customer">Customer</option>
                                            <option value="admin">Admin</option>
                                        </select>
                                </div>  
                            </div>
                            <div class="form-actions">
                                <button type="submit" class="btn">Add User</button>
                                <button type="reset" class="btn-outline">Reset</button>
                                <button type="button" class="btn-outline" onclick="toggleForm('add-user-form')">Cancel</button>
                            </div>
                        </form>
                    </div>
                    
                    <!-- Edit User Form -->
                    <div id="edit-user-form" class="admin-form-container" style="display: none;">
                        <div class="section-header">
                            <h3>Edit User</h3>
                        </div>
                        <div class="alert alert-success" style="display: none;">User updated successfully!</div>
                        <div class="alert alert-danger" style="display: none;">Error updating user. Please try again.</div>
                        
                        <form class="admin-form" action="${pageContext.request.contextPath}/EditUserController" method="post" id="editUserForm">
                            <input type="hidden" id="edit-user-id" name="userId">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="edit-user-fullname">Full Name</label>
                                    <input type="text" id="edit-user-fullname" name="fullname" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="edit-user-email">Email</label>
                                    <input type="email" id="edit-user-email" name="email" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="edit-user-password">Password</label>
                                    <input type="password" id="edit-user-password" name="password" placeholder="Leave blank to keep current password">
                                </div>
                            </div>
                            <div class="form-row">
	                            <div class="form-group">
	                                    <label for="edit-user-role">Role</label>
	                                    <select id="edit-user-role" name="role">
	                                        <option value="customer">Customer</option>
	                                        <option value="admin">Admin</option>
	                                    </select>
	                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="submit" class="btn">Update User</button>
                                <button type="button" class="btn-outline" onclick="toggleForm('edit-user-form')">Cancel</button>
                            </div>
                        </form>
                    </div>
                    
                    <div class="admin-table-container">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>User ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
							    <c:forEach items="${users}" var="user">
							        <tr>
							            <td>#${user.userId}</td>
							            <td>${user.fullName}</td>
							            <td>${user.email}</td>
							            <td>${user.role}</td>
							            <td>
							                <div class="action-buttons">
							                    <button class="btn-small" onclick="editUser(${user.userId}, '${user.fullName}', '${user.email}', '${user.role.toLowerCase()}')">Edit</button>
							                    <form action="${pageContext.request.contextPath}/DeleteUserController" method="post" style="display:inline;">
												    <input type="hidden" name="userID" value="${user.userId}">
												    <button type="submit" class="btn-small" onclick="return confirm('Delete this user?')">Delete</button>
												</form>
							                </div>
							            </td>
							        </tr>
							    </c:forEach>
							</tbody>
                        </table>
                    </div>
                </div>
            </section>

            <!-- Orders Section -->
            <section id="orders-section" class="admin-section-container">
                <div class="admin-page-header">
                    <h2>Orders Management</h2>
                    <p>View and manage customer orders</p>
                </div>
                
                <div class="admin-section">
                    <div class="section-header">
                        <h3>All Orders</h3>
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
                                            <button class="btn-small">View</button>
                                            <button class="btn-small">Edit</button>
                                            <button class="btn-small">Delete</button>
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
                                            <button class="btn-small">View</button>
                                            <button class="btn-small">Edit</button>
                                            <button class="btn-small">Delete</button>
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
                                            <button class="btn-small">View</button>
                                            <button class="btn-small">Edit</button>
                                            <button class="btn-small">Delete</button>
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
                                            <button class="btn-small">View</button>
                                            <button class="btn-small">Edit</button>
                                            <button class="btn-small">Delete</button>
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
                                            <button class="btn-small">View</button>
                                            <button class="btn-small">Edit</button>
                                            <button class="btn-small">Delete</button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <!-- Reports Section -->
            <section id="reports-section" class="admin-section-container">
                <div class="admin-page-header">
                    <h2>Reports</h2>
                    <p>View sales and inventory reports</p>
                </div>
                
                <div class="admin-section">
                    <div class="section-header">
                        <h3>Sales Summary</h3>
                    </div>
                    <div class="admin-stats">
                        <div class="admin-stat-card">
                            <h3>Today's Sales</h3>
                            <p class="stat-number">$245.98</p>
                        </div>
                        <div class="admin-stat-card">
                            <h3>Weekly Sales</h3>
                            <p class="stat-number">$1,245.50</p>
                        </div>
                        <div class="admin-stat-card">
                            <h3>Monthly Sales</h3>
                            <p class="stat-number">$4,285.75</p>
                        </div>
                        <div class="admin-stat-card">
                            <h3>Annual Sales</h3>
                            <p class="stat-number">$52,648.30</p>
                        </div>
                    </div>
                </div>
                
                <div class="admin-section">
                    <div class="section-header">
                        <h3>Top Selling Products</h3>
                    </div>
                    <div class="admin-table-container">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>Rank</th>
                                    <th>Product</th>
                                    <th>Category</th>
                                    <th>Units Sold</th>
                                    <th>Revenue</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Red Rose Bouquet</td>
                                    <td>Roses</td>
                                    <td>45</td>
                                    <td>$1,349.55</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Mixed Bouquet</td>
                                    <td>Bouquets</td>
                                    <td>32</td>
                                    <td>$1,279.68</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Tulip Arrangement</td>
                                    <td>Tulips</td>
                                    <td>28</td>
                                    <td>$699.72</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>Lily Bouquet</td>
                                    <td>Lilies</td>
                                    <td>18</td>
                                    <td>$629.82</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>Sunflower Bunch</td>
                                    <td>Sunflowers</td>
                                    <td>15</td>
                                    <td>$299.85</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <footer class="admin-footer">
        <div class="container">
            <p>&copy; 2025 Flora Admin Panel. All rights reserved.</p>
        </div>
    </footer>

    <script>
        // Function to show selected section and hide others
        function showSection(sectionId) {
            // Hide all sections
            const sections = document.querySelectorAll('.admin-section-container');
            sections.forEach(section => {
                section.style.display = 'none';
            });
            
            // Show selected section
            document.getElementById(sectionId).style.display = 'block';
            
            // Update active nav link
            const navLinks = document.querySelectorAll('.admin-nav a');
            navLinks.forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('href') === '#' + sectionId) {
                    link.classList.add('active');
                }
            });
        }
        
        // Function to toggle form visibility
        function toggleForm(formId) {
            const form = document.getElementById(formId);
            if (form.style.display === 'none' || form.style.display === '') {
                form.style.display = 'block';
                
                // Hide other forms
                if (formId === 'edit-product-form') {
                    document.getElementById('add-user-form').style.display = 'none';
                    document.getElementById('edit-user-form').style.display = 'none';
                } else if (formId === 'add-user-form') {
                    document.getElementById('edit-product-form').style.display = 'none';
                    document.getElementById('edit-user-form').style.display = 'none';
                } else if (formId === 'edit-user-form') {
                    document.getElementById('edit-product-form').style.display = 'none';
                    document.getElementById('add-user-form').style.display = 'none';
                }
                
                // Scroll to the form
                form.scrollIntoView({ behavior: 'smooth' });
            } else {
                form.style.display = 'none';
            }
        }
        
        // Function to edit product
        function editProduct(id, name, price, stock, description) {
            // Fill the edit form with product data
            document.getElementById('edit-product-id').value = id;
            document.getElementById('edit-product-name').value = name;
            document.getElementById('edit-product-price').value = price;
            document.getElementById('edit-product-stock').value = stock;
            document.getElementById('edit-product-description').value = description;
            
            // Show the edit form
            toggleForm('edit-product-form');
        }
        
        // Function to delete product
        function deleteProduct(id) {
            if (confirm('Are you sure you want to delete product #' + id + '?')) {
                // In a real application, this would send a request to delete the product
                alert('Product #' + id + ' has been deleted.');
            }
        }
        
        // Function to edit user
        function editUser(userId, fullname, email, role) {
            // Fill the edit form with user data
            document.getElementById('edit-user-id').value = userId;
            document.getElementById('edit-user-fullname').value = fullname;
            document.getElementById('edit-user-email').value = email;
            document.getElementById('edit-user-role').value = role;
            
            // Show the edit form
            toggleForm('edit-user-form');
        }
        
        // Function to delete user
        function deleteUser(id) {
            if (confirm('Are you sure you want to delete user #' + id + '?')) {
                // In a real application, this would send a request to delete the user
                alert('User #' + id + ' has been deleted.');
            }
        }
        
        // Initialize the page
        document.addEventListener('DOMContentLoaded', function() {
            // Show dashboard by default
            showSection('dashboard-section');
            
            // Set up logout link
            document.getElementById('logout-link').addEventListener('click', function(e) {
                e.preventDefault();
                if (confirm('Are you sure you want to logout?')) {
                    document.getElementById('logoutForm').submit();
                }
            });
            
           
        });
    </script>	
</body>
</html>
