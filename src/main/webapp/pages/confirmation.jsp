<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation | Flora</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/confirmation.css">
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
                    <li><a href="products.jsp">Shop</a></li>
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
                                <span class="info-value">#FL12345</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Date</span>
                                <span class="info-value">April 6, 2025</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Total</span>
                                <span class="info-value">$188.96</span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Payment Method</span>
                                <span class="info-value">Credit Card (****1234)</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="order-summary">
                        <h2>Order Summary</h2>
                        <div class="order-items">
                            <div class="order-item">
                                <div class="item-image">
                                    <img src="/placeholder.svg?height=80&width=80" alt="Spring Delight">
                                </div>
                                <div class="item-details">
                                    <h3>Spring Delight</h3>
                                    <p class="item-variant">Medium, Clear Glass Vase</p>
                                    <p class="item-price">$49.99 x 1</p>
                                </div>
                            </div>
                            
                            <div class="order-item">
                                <div class="item-image">
                                    <img src="/placeholder.svg?height=80&width=80" alt="Elegant Roses">
                                </div>
                                <div class="item-details">
                                    <h3>Elegant Roses</h3>
                                    <p class="item-variant">Medium, Ceramic White Vase</p>
                                    <p class="item-price">$69.99 x 1</p>
                                </div>
                            </div>
                            
                            <div class="order-item">
                                <div class="item-image">
                                    <img src="/placeholder.svg?height=80&width=80" alt="Lavender Love">
                                </div>
                                <div class="item-details">
                                    <h3>Lavender Love</h3>
                                    <p class="item-variant">Small, Clear Glass Vase</p>
                                    <p class="item-price">$55.99 x 1</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="order-totals">
                            <div class="total-row">
                                <span>Subtotal</span>
                                <span>$175.97</span>
                            </div>
                            <div class="total-row">
                                <span>Shipping</span>
                                <span>$12.99</span>
                            </div>
                            <div class="total-row final-total">
                                <span>Total</span>
                                <span>$188.96</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="shipping-info">
                        <h2>Shipping Information</h2>
                        <div class="info-columns">
                            <div class="info-column">
                                <h3>Shipping Address</h3>
                                <p>
                                    John Doe<br>
                                    123 Flower Street<br>
                                    Apt 4B<br>
                                    New York, NY 10001<br>
                                    United States
                                </p>
                            </div>
                            <div class="info-column">
                                <h3>Shipping Method</h3>
                                <p>Standard Delivery (2-3 business days)</p>
                                <h3>Estimated Delivery</h3>
                                <p>April 9-10, 2025</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="confirmation-actions">
                        <a href="products.jsp" class="btn btn-outline">Continue Shopping</a>
                        <a href="#" class="btn btn-primary">Track Order</a>
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