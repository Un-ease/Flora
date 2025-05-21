<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation | Flora</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/confirmation.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
    <%@ include file="/includes/header.jsp" %>
    <%-- Set the active page parameter --%>
    <c:set var="activePage" value="home" scope="request"/>

    <main>
        <section class="confirmation-section">
            <div class="container">
                <div class="confirmation-container">
                    <div class="confirmation-header">
                        <div class="confirmation-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                        </div>
                        <h1>Thank You for Your Order!</h1>
                        <p>Your order has been received and is being processed.</p>
                    </div>
                    
                    <div class="order-details">
                        <div class="order-info">
                            <div class="info-item">
                                <span class="info-label">Order Number</span>
                                <span class="info-value">#FL${order.orderId}</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Date</span>
                                <span class="info-value"><fmt:formatDate value="${order.orderDate}" pattern="MMMM d, yyyy"/></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Total</span>
                                <span class="info-value"><fmt:formatNumber value="${order.totalAmount}" type="currency"/></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Payment Method</span>
                                <span class="info-value">${order.paymentMethod}</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="order-summary">
                        <h2>Order Summary</h2>
                        <div class="order-items">
                            <c:forEach var="item" items="${orderItems}">
                                <div class="order-item">
                                    <div class="item-image">
                                        <c:choose>
                                            <c:when test="${empty item.product.image}">
                                                <div class="no-image">No Image</div>
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${pageContext.request.contextPath}/uploads/${item.product.image}" alt="${item.product.productName}">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="item-details">
                                        <h3>${item.product.productName}</h3>
                                        <p class="item-price"><fmt:formatNumber value="${item.price}" type="currency"/> x ${item.quantity}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <div class="order-totals">
                            <div class="total-row">
                                <span>Subtotal</span>
                                <span><fmt:formatNumber value="${subtotal}" type="currency"/></span>
                            </div>
                            <div class="total-row">
                                <span>Shipping</span>
                                <span>
                                    <c:choose>
                                        <c:when test="${subtotal > 50}">FREE</c:when>
                                        <c:otherwise><fmt:formatNumber value="12.99" type="currency"/></c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                            <div class="total-row final-total">
                                <span>Total</span>
                                <span><fmt:formatNumber value="${order.totalAmount}" type="currency"/></span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="shipping-info">
                        <h2>Shipping Information</h2>
                        <div class="info-columns">
                            <div class="info-column">
                                <h3>Shipping Address</h3>
                                <p>${order.shippingAddress}</p>
                            </div>
                            <div class="info-column">
                                <h3>Shipping Method</h3>
                                <p>Standard Delivery (2-3 business days)</p>
                                <h3>Estimated Delivery</h3>
                                <p>
                                    <fmt:parseDate value="${order.orderDate}" type="date" pattern="yyyy-MM-dd" var="parsedDate"/>
                                    <fmt:formatDate value="${parsedDate}" pattern="MMMM d, yyyy"/>
                                    - 
                                    Upto 4 Days
                                </p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="confirmation-actions">
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-outline">Continue Shopping</a>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <%@ include file="/includes/footer.jsp" %>
</body>
</html>