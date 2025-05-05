<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<%
    // Check if user is logged in
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Account | Flora</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
    <%@ include file="/includes/header.jsp" %>
    <%-- Set the active page parameter --%>
    <c:set var="activePage" value="account" scope="request"/>

    <main>
        <section class="page-header">
            <div class="container">
                <h1>My Account</h1>
                <div class="breadcrumbs">
                    <a href="index.jsp">Home</a> / <span>My Account</span>
                </div>
            </div>
        </section>

        <section class="dashboard-section">
            <div class="container">
                <div class="dashboard-layout">
                    <aside class="dashboard-sidebar">
                        <div class="user-info">
						    <div class="user-avatar">
						        <img src="${pageContext.request.contextPath}/images/user-avatar.png" alt="User Avatar">
						    </div>
						    <div class="user-details">
						        <h3>${sessionScope.user.fullName}</h3>
						        <p>${sessionScope.user.email}</p>
						    </div>
						</div>
                        
                        <nav class="dashboard-nav">
                            <ul>
                                <li><a href="#" class="active" data-tab="dashboard">Dashboard</a></li>
                                <li><a href="#" data-tab="orders">My Orders</a></li>
                                <li><a href="#" data-tab="addresses">Addresses</a></li>
                                <li><a href="#" data-tab="wishlist">Wishlist</a></li>
                                <li><a href="#" data-tab="account">Account Details</a></li>
                                <li>
    <a href="#" onclick="document.getElementById('logoutForm').submit(); return false;">Logout</a>
    <form id="logoutForm" action="${pageContext.request.contextPath}/LogOutController" method="get" style="display:none;">
        <input type="hidden" name="csrfToken" value="${csrfToken}">
    </form>
</li>
                            </ul>
                        </nav>
                    </aside>
                    
                    <div class="dashboard-content">
                        <!-- Dashboard Tab -->
                        <div class="dashboard-tab active" id="dashboard-tab">
                            <div class="welcome-message">
							    <h2>Welcome back, ${sessionScope.user.fullName}!</h2>
							    <p>From your account dashboard you can view your recent orders, manage your shipping and billing addresses, and edit your password and account details.</p>
							</div>
                            
                            <div class="dashboard-cards">
                                <div class="dashboard-card">
                                    <div class="card-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z"></path><path d="M3 6h18"></path><path d="M16 10a4 4 0 0 1-8 0"></path></svg>
                                    </div>
                                    <div class="card-content">
                                        <h3>Orders</h3>
                                        <p>You have 3 orders</p>
                                    </div>
                                </div>
                                
                                <div class="dashboard-card">
                                    <div class="card-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                    </div>
                                    <div class="card-content">
                                        <h3>Account</h3>
                                        <p>Manage your details</p>
                                    </div>
                                </div>
                                
                                <div class="dashboard-card">
                                    <div class="card-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                                    </div>
                                    <div class="card-content">
                                        <h3>Addresses</h3>
                                        <p>2 saved addresses</p>
                                    </div>
                                </div>
                                
                                <div class="dashboard-card">
                                    <div class="card-icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
                                    </div>
                                    <div class="card-content">
                                        <h3>Wishlist</h3>
                                        <p>5 saved items</p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="recent-orders">
                                <h3>Recent Orders</h3>
                                <div class="table-responsive">
                                    <table class="orders-table">
                                        <thead>
                                            <tr>
                                                <th>Order</th>
                                                <th>Date</th>
                                                <th>Status</th>
                                                <th>Total</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>#FL12345</td>
                                                <td>April 6, 2025</td>
                                                <td><span class="status-badge delivered">Delivered</span></td>
                                                <td>$188.96</td>
                                                <td><a href="#" class="btn-view">View</a></td>
                                            </tr>
                                            <tr>
                                                <td>#FL12344</td>
                                                <td>March 22, 2025</td>
                                                <td><span class="status-badge delivered">Delivered</span></td>
                                                <td>$75.50</td>
                                                <td><a href="#" class="btn-view">View</a></td>
                                            </tr>
                                            <tr>
                                                <td>#FL12343</td>
                                                <td>February 15, 2025</td>
                                                <td><span class="status-badge delivered">Delivered</span></td>
                                                <td>$129.99</td>
                                                <td><a href="#" class="btn-view">View</a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Orders Tab (Hidden by default) -->
                        <div class="dashboard-tab" id="orders-tab">
                            <h2>My Orders</h2>
                            <div class="table-responsive">
                                <table class="orders-table">
                                    <thead>
                                        <tr>
                                            <th>Order</th>
                                            <th>Date</th>
                                            <th>Status</th>
                                            <th>Total</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>#FL12345</td>
                                            <td>April 6, 2025</td>
                                            <td><span class="status-badge delivered">Delivered</span></td>
                                            <td>$188.96</td>
                                            <td><a href="#" class="btn-view">View</a></td>
                                        </tr>
                                        <tr>
                                            <td>#FL12344</td>
                                            <td>March 22, 2025</td>
                                            <td><span class="status-badge delivered">Delivered</span></td>
                                            <td>$75.50</td>
                                            <td><a href="#" class="btn-view">View</a></td>
                                        </tr>
                                        <tr>
                                            <td>#FL12343</td>
                                            <td>February 15, 2025</td>
                                            <td><span class="status-badge delivered">Delivered</span></td>
                                            <td>$129.99</td>
                                            <td><a href="#" class="btn-view">View</a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <!-- Other tabs would be here but are hidden by default -->
                    </div>
                </div>
            </div>
        </section>
    </main>

    <%@ include file="/includes/footer.jsp" %>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Tab switching functionality
            const tabLinks = document.querySelectorAll('.dashboard-nav a');
            const tabContents = document.querySelectorAll('.dashboard-tab');
            
            tabLinks.forEach(link => {
                link.addEventListener('click', function(e) {
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
                });
            });
        });
    </script>
</body>
</html>
