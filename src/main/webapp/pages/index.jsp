<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flora | Beautiful Flowers Delivered</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/index.css">
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
                    <li><a href="index.jsp" class="active">Home</a></li>
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
        <section class="hero">
            <div class="container-one">
                <div class="hero-content">
                	<h1><b>Flora</b></h1>
                    <h2>Beautiful Blooms for Every Occasion</h2>
                    <p>Handcrafted floral arrangements delivered with care</p>
                    <a href="products.jsp" class="btn btn-primary">Shop Now</a>
                </div>
                <img src="../items/Bouquet.png" >
            </div>
        </section>


        <section class="featured-products">
            <div class="container">
                <h2 class="section-title">Bestsellers</h2>
                <div class="products-grid">
                    <div class="product-card">
                        <a href="product-details.jsp">
                            <div class="product-image" style="background-image: url('../items/Spring-Delight.jpg')"></div>
                            <div class="product-info">
                                <h3>Spring Delight</h3>
                                <p class="product-price">$49.99</p>
                            </div>
                        </a>
                        <button class="btn btn-secondary add-to-cart">Add to Cart</button>
                    </div>
                    <div class="product-card">
                        <a href="product-details.jsp">
                            <div class="product-image" style="background-image: url('../items/pastel.jpg')"></div>
                            <div class="product-info">
                                <h3>Pastel Dreams</h3>
                                <p class="product-price">$59.99</p>
                            </div>
                        </a>
                        <button class="btn btn-secondary add-to-cart">Add to Cart</button>
                    </div>
                    <div class="product-card">
                        <a href="product-details.jsp">
                            <div class="product-image" style="background-image: url('../items/elegant-r.jpg')"></div>
                            <div class="product-info">
                                <h3>Elegant Roses</h3>
                                <p class="product-price">$69.99</p>
                            </div>
                        </a>
                        <button class="btn btn-secondary add-to-cart">Add to Cart</button>
                    </div>
                    <div class="product-card">
                        <a href="product-details.jsp">
                            <div class="product-image" style="background-image: url('../items/lavender haze.jpg')"></div>
                            <div class="product-info">
                                <h3>Lavender Haze</h3>
                                <p class="product-price">$89.99</p>
                            </div>
                        </a>
                        <button class="btn btn-secondary add-to-cart">Add to Cart</button>
                    </div>
                </div>
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