<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- At the top of products.jsp --%>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>

<%-- Debug code --%>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    if (products != null) {
    	
        for (Product p : products) {
            System.out.println("JSP sees: " + p.getProductName() + " - " + p.getImage());
        }
    } else {
        System.out.println("Products attribute is null in JSP");
        response.sendRedirect(request.getContextPath()+"/products");
        
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop | Flora</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/products.css">
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
            <nav>
                <ul class="nav-links">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/ProductServlet" class="active">Shop</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
            <div class="header-actions">
                <a href="user-dashboard.jsp" class="header-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                </a>
                <a href="cart.jsp" class="header-icon cart-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="8" cy="21" r="1"></circle><circle cx="19" cy="21" r="1"></circle><path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"></path></svg>
                    <span class="cart-count">0</span>
                </a>
                <button class="mobile-menu-toggle">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
                </button>
            </div>
        </div>
    </header>

    <main>
        <section class="page-header">
            <div class="container">
                <h1>Shop Our Collection</h1>
                <div class="breadcrumbs">
                    <a href="index.jsp">Home</a> / <span>Shop</span>
                </div>
            </div>
        </section>

        <section class="products-section">
            <div class="container">
                <div class="search-container">
                    <form class="search-form">
                        <input type="text" placeholder="Search for flowers, arrangements, gifts..." class="search-input">
                        <button type="submit" class="search-button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                        </button>
                    </form>
                </div>
                
                <div class="products-content">
                    <div class="products-header">
                        <div class="products-count">
                            <p>Showing 12 of 36 products</p>
                        </div>
                    </div>
                    
                    <!-- Error/Success Messages -->
                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success">${successMessage}</div>
                    </c:if>
                    
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">${errorMessage}</div>
                    </c:if>
                    
                     <c:choose>
					    <c:when test="${empty products}">
					        <div class="no-products">
					            <p>No products found. Please check back later.</p>
					            <p>Debug: products attribute is empty or null</p>
					        </div>
					    </c:when>
					    <c:otherwise>
					        <div class="products-grid">
					            <c:forEach var="product" items="${products}">
					                <div class="product-card">
					                    <a href="${pageContext.request.contextPath}/product-details?id=${product.productId}">
					                        <div class="product-image" 
					                             style="background-image: url('${pageContext.request.contextPath}/uploads/${product.image}')">
					                             <c:if test="${empty product.image}">
					                                 <div class="no-image">No Image</div>
					                             </c:if>
					                        </div>
					                        <div class="product-info">
					                            <h3>${product.productName}</h3>
					                            <p class="product-price">$${product.price}</p>
					                        </div>
					                    </a>
					                </div>
					            </c:forEach>
					        </div>
					    </c:otherwise>
					</c:choose>

			                    
                       
                    
                    <div class="pagination">
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#" class="next">
                            Next
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-column">
                    <h3>Flora</h3>
                    <p>Beautiful blooms for every occasion, delivered with care and love.</p>
                </div>
                <div class="footer-column">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="products.jsp">Shop</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h4>Customer Service</h4>
                    <ul>
                        <li><a href="#">Delivery Information</a></li>
                        <li><a href="#">Returns Policy</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Terms & Conditions</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h4>Newsletter</h4>
                    <p>Subscribe for updates and special offers</p>
                    <form class="newsletter-form">
                        <input type="email" placeholder="Your email address" required>
                        <button type="submit" class="btn btn-primary">Subscribe</button>
                    </form>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 Flora. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
</html>