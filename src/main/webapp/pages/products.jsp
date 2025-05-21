<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- At the top of products.jsp --%>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>

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

    <%@ include file="/includes/header.jsp" %>
    <%-- Set the active page parameter --%>
    <c:set var="activePage" value="shop" scope="request"/>

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
                    <form class="search-form" action="${pageContext.request.contextPath}/products" method="get">
					    <input type="text" name="query" placeholder="Search for flowers, arrangements, gifts..." 
					           class="search-input" value="${param.query}">
					    <button type="submit" class="search-button">
					        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
					    </button>
					</form>
                </div>
                
                <div class="products-content">
                    <div class="products-header">
                       
                    </div>
                    
                   
                     <c:choose>
					    <c:when test="${empty products}">
					        <div class="no-products">
					            <p>No products found. Please check back later.</p>
					            
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

			                    
                       
                    
                </div>
            </div>
        </section>
    </main>

    <%@ include file="/includes/footer.jsp" %>
</body>
</html>