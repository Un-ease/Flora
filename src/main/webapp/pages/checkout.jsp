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
            </div>
            
            <div class="checkout-layout">
                <div class="checkout-main">
                    <section class="checkout-section">
                        <h2>Shipping Information</h2>
                        <form class="checkout-form">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="fullname">Full Name</label>
                                    <input type="text" id="full-name" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input type="email" id="email" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="address">Street Address</label>
                                <input type="text" id="address" required>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="city">City</label>
                                    <input type="text" id="city" required>
                                </div>
                                
                            </div>
                            
                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="tel" id="phone" required>
                            </div>
                        </form>
                    </section>
                    
                    <section class="checkout-section">
                         <h2>Payment Method</h2>
                        <form class="checkout-form">
                           
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

                        </form>
                    </section>
                    

                </div>
                
                <div class="checkout-sidebar">
                    <div class="order-summary">
                        <h2>Order Summary</h2>
                        
                        <div class="order-items">
                            <div class="order-item">
                                <div class="item-image">
                                    <img src="/placeholder.svg?height=80&width=80" alt="Spring Delight">
                                </div>
                                <div class="item-details">
                                    <h3>Spring Delight</h3>
                                    <p class="item-price">$49.99</p>
                                    <div class="item-quantity">Qty: 1</div>
                                </div>
                            </div>
                            
                            <div class="order-item">
                                <div class="item-image">
                                    <img src="/placeholder.svg?height=80&width=80" alt="Elegant Roses">
                                </div>
                                <div class="item-details">
                                    <h3>Elegant Roses</h3>
                                    <p class="item-price">$69.99</p>
                                    <div class="item-quantity">Qty: 1</div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="order-totals">
                            <div class="total-row">
                                <span>Subtotal</span>
                                <span>$119.98</span>
                            </div>
                            <div class="total-row">
                                <span>Shipping</span>
                                <span>$9.99</span>
                            </div>
                            <div class="total-row">
                                <span>Tax</span>
                                <span>$10.80</span>
                            </div>
                            <div class="total-row grand-total">
                                <span>Total</span>
                                <span>$140.77</span>
                            </div>
                        </div>
                        
                        <button class="place-order-btn">
                            <span>Place Order</span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                        </button>
                        
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