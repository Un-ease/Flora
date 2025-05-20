<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%
	List<Product> featuredProducts = (List<Product>) request.getAttribute("featuredProducts");
	if (featuredProducts == null) {
	    System.out.println("Featured products attribute is null in JSP");
	    response.sendRedirect(request.getContextPath() + "/index");
	    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flora | Beautiful Flowers Delivered</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
    <%@ include file="/includes/header.jsp" %>
    <%-- Set the active page parameter --%>
    <c:set var="activePage" value="home" scope="request"/>

    <main>
        <section class="hero">
            <div class="container-one">
                <div class="hero-content">
                	<h1><b>Flora</b></h1>
                    <h2>Beautiful Blooms for Every Occasion</h2>
                    <p>Handcrafted floral arrangements delivered with care</p>
                    <a href="${pageContext.request.contextPath}/products.jsp" class="btn btn-primary">Shop Now</a>
                </div>
                <img src="${pageContext.request.contextPath}/items/Bouquet.png" alt="Flower Bouquet">
            </div>
        </section>


        <section class="featured-products">
            <div class="container">
                <h2 class="section-title">Bestsellers</h2>
                <!-- Error/Success Messages -->
      
                    
                    <c:choose>
					    <c:when test="${empty featuredProducts}">
					        <div class="no-products">
					            <p>No featured products found. Please check back later.</p>
					        </div>
					    </c:when>
					    <c:otherwise>
					        <div class="products-grid">
					            <c:forEach var="product" items="${featuredProducts}" end="3">
					                <div class="product-card">
					                    <a href="${pageContext.request.contextPath}/product-details?id=${product.productId}">
					                        <div class="product-image" style="background-image: url('${pageContext.request.contextPath}/uploads/${product.image}')">
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

                <div class="view-all">
                    <a href="products.jsp" class="btn btn-outline">View All Products</a>
                </div>
            </div>
        </section>

        <section class="testimonials">
            <div class="container">
                <h2 class="section-title">What Our Customers Say</h2>
                <div class="testimonials-grid">
                    <div class="testimonial-card">
                        <p>"The flowers were absolutely stunning and lasted for weeks. Will definitely order again!"</p>
                        <p class="testimonial-author">— Sarah M.</p>
                    </div>
                    <div class="testimonial-card">
                        <p>"Flora's arrangements are always beautiful and unique. Their service is exceptional."</p>
                        <p class="testimonial-author">— Michael T.</p>
                    </div>
                    <div class="testimonial-card">
                        <p>"The birthday bouquet I ordered for my mom was perfect. She loved every flower!"</p>
                        <p class="testimonial-author">— Jessica K.</p>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <%@ include file="/includes/footer.jsp" %>
</body>
</html>