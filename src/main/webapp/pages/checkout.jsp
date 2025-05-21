<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout | Flora</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
    <%@ include file="/includes/header.jsp" %>

    <main class="checkout-page">
        <div class="container">
            <div class="checkout-title">
                <h1>Checkout</h1>
                <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">
                    ${errorMessage}
                </div>
            </c:if>
            </div>
            
            <div class="checkout-layout">
                <div class="checkout-main">
                <form method="post" action="${pageContext.request.contextPath}/checkout" class="checkout-main">
                    <section class="checkout-section">
                        <h2>Shipping Information</h2>
                        <div class="checkout-form">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="fullname">Full Name</label>
                                    <input type="text" name="fullName" id="full-name" value="${user.fullName}"required>
                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input type="email" name="email" id="email" value="${user.email}" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" name="address" id="address" value="${user.address}"required>
                            </div>
                           
                            
                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="tel" name="phone" id="phone" value="${user.phoneNumber}" required>
                            </div>
                      </div>
                    </section>
                    
                    <section class="checkout-section">
                         <h2>Payment Method</h2>
                           
		                    <div class="payment-methods">
		                        <label class="payment-method">
		                            <input type="radio" name="paymentMethod" value="Credit Card" checked>
		                            <span>Credit Card</span>
		                        </label>
		                        <label class="payment-method">
		                            <input type="radio" name="paymentMethod" value="Esewa">
		                            <span>Esewa</span>
		                        </label>
		                        <label class="payment-method">
		                            <input type="radio" name="paymentMethod" value="Bank Transfer">
		                            <span>Bank Transfer</span>
		                        </label>
		                    </div>
                    </section>
                    <div class="form-actions">
                        <button type="submit" class="place-order-btn">
                            <span>Place Order</span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                        </button>
                    </div>
                </form>

                </div>
                
                <div class="checkout-sidebar">
                    <div class="order-summary">
                        <h2>Order Summary</h2>
                        
                        <div class="order-items">
                            <c:forEach var="item" items="${cartItems}">
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
                                        <p class="item-price">$${item.product.price}</p>
                                        <div class="item-quantity">Qty: ${item.quantity}</div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <div class="order-totals">
                            <div class="total-row">
                                <span>Subtotal</span>
                                <span>$${subtotal}</span>
                            </div>
                            <div class="total-row">
                                <span>Shipping</span>
                                <span>${subtotal > 50 ? 'FREE' : '$12.99'}</span>
                            </div>
                            <div class="total-row grand-total">
                                <span>Total</span>
                                <span>$${total}</span>
                            </div>
                        </div>

                       
                        
                        <div class="secure-checkout">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                            <span>Secure Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

        <%@ include file="/includes/footer.jsp" %>
</body>
</html>