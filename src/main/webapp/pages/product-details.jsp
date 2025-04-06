<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spring Delight | Flora</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/product-details.css">
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
                    <li><a href="products.jsp" class="active">Shop</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
            <div class="header-actions">
                <a href="login.jsp" class="header-icon">
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
        <div class="container">
            <div class="breadcrumbs">
                <a href="index.jsp">Home</a> / <a href="products.jsp">Shop</a> / <span>Spring Delight</span>
            </div>
            
            <section class="product-details">
                <div class="product-gallery">
                    <div class="main-image">
                        <img src="../items/Spring-Delight.jpg" alt="Spring Delight Bouquet">
                    </div>
                    <div class="thumbnail-images">
                        <div class="thumbnail active">
                            <img src="../items/Spring-Delight.jpg" alt="Spring Delight Thumbnail 1">
                        </div>
                        <div class="thumbnail">
                            <img src="../items/Spring-Delight.jpg" alt="Spring Delight Thumbnail 2">
                        </div>
                        <div class="thumbnail">
                            <img src="../items/Spring-Delight.jpg" alt="Spring Delight Thumbnail 3">
                        </div>
                        <div class="thumbnail">
                            <img src="../items/Spring-Delight.jpg" alt="Spring Delight Thumbnail 4">
                        </div>
                    </div>
                </div>
                
                <div class="product-info">
                    <h1>Spring Delight</h1>
                    <div class="product-price">$49.99</div>
                    <div class="product-rating">
                        <div class="stars">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                        </div>
                        <span class="review-count">24 reviews</span>
                    </div>
                    
                    <div class="product-description">
                        <p>A beautiful arrangement of fresh spring flowers including tulips, daffodils, and hyacinths. This vibrant bouquet brings the joy of spring into any space with its cheerful colors and delightful fragrance.</p>
                        <ul class="product-features">
                            <li>Hand-arranged by our expert florists</li>
                            <li>Includes seasonal spring flowers</li>
                            <li>Arrives in a decorative vase</li>
                            <li>Guaranteed fresh for 7 days</li>
                        </ul>
                    </div>
                    
                    <div class="product-options">
                        <div class="option-group">
                            <label for="size">Size:</label>
                            <div class="option-buttons">
                                <button class="option-button">Small</button>
                                <button class="option-button active">Medium</button>
                                <button class="option-button">Large</button>
                            </div>
                        </div>
                        
                        <div class="option-group">
                            <label for="vase">Vase:</label>
                            <div class="option-buttons">
                                <button class="option-button active">Clear Glass</button>
                                <button class="option-button">Ceramic White</button>
                                <button class="option-button">No Vase</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="product-actions">
                        <div class="quantity-selector">
                            <button class="quantity-btn decrease">-</button>
                            <input type="number" value="1" min="1" max="10" class="quantity-input">
                            <button class="quantity-btn increase">+</button>
                        </div>
                        <button class="btn btn-primary add-to-cart-btn">Add to Cart</button>
                    </div>
                    
                    <div class="product-meta">
                        <div class="meta-item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 14.899A7 7 0 1 1 15.71 8h1.79a4.5 4.5 0 0 1 2.5 8.242"></path><path d="M12 12v9"></path><path d="m8 17 4 4 4-4"></path></svg>
                            <span>Free delivery for orders over $75</span>
                        </div>
                        <div class="meta-item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 9h18v10a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V9Z"></path><path d="m3 9 2.45-4.9A2 2 0 0 1 7.24 3h9.52a2 2 0 0 1 1.8 1.1L21 9"></path><path d="M12 3v6"></path></svg>
                            <span>Same-day delivery available</span>
                        </div>
                    </div>
                </div>
            </section>
            
            <section class="product-tabs">
                <div class="tabs">
                    <button class="tab active" data-tab="description">Description</button>
                    <button class="tab" data-tab="details">Details</button>
                    <button class="tab" data-tab="reviews">Reviews (24)</button>
                </div>
                
                <div class="tab-content">
                    <div id="description" class="tab-pane active">
                        <p>Spring Delight is a beautiful arrangement that captures the essence of the season. This bouquet features a selection of the finest spring flowers, including tulips in various colors, sunny daffodils, fragrant hyacinths, and delicate greenery.</p>
                        <p>Each arrangement is carefully hand-crafted by our expert florists to ensure the highest quality and freshest blooms. The flowers are arranged in a stylish glass vase that complements the vibrant colors of the bouquet.</p>
                        <p>Perfect for birthdays, anniversaries, or simply to brighten someone's day, Spring Delight brings the joy and renewal of springtime into any home or office.</p>
                    </div>
                    
                    <div id="details" class="tab-pane">
                        <h3>Product Details</h3>
                        <ul>
                            <li><strong>Dimensions:</strong> Approximately 12" x 10" (varies slightly as each arrangement is handcrafted)</li>
                            <li><strong>Vase:</strong> Clear glass, 8" tall</li>
                            <li><strong>Flowers:</strong> May include tulips, daffodils, hyacinths, ranunculus, and seasonal greenery</li>
                            <li><strong>Care Instructions:</strong> Change water every 2-3 days. Keep away from direct sunlight and heat sources.</li>
                            <li><strong>Longevity:</strong> 7-10 days with proper care</li>
                        </ul>
                        
                        <h3>Delivery Information</h3>
                        <ul>
                            <li>Same-day delivery available for orders placed before 12pm local time</li>
                            <li>Free delivery for orders over $75</li>
                            <li>Standard delivery: $12.99</li>
                            <li>Express delivery: $19.99</li>
                        </ul>
                    </div>
                    
                    <div id="reviews" class="tab-pane">
                        <div class="reviews-summary">
                            <div class="overall-rating">
                                <div class="rating-number">4.8</div>
                                <div class="stars">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                </div>
                                <div class="review-count">Based on 24 reviews</div>
                            </div>
                        </div>
                        
                        <div class="review-list">
                            <div class="review-item">
                                <div class="review-header">
                                    <div class="reviewer-name">Sarah M.</div>
                                    <div class="review-date">May 15, 2025</div>
                                </div>
                                <div class="review-rating">
                                    <div class="stars">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                    </div>
                                </div>
                                <div class="review-content">
                                    <p>The flowers were absolutely stunning and lasted for weeks. The arrangement was even more beautiful than the picture. Will definitely order again!</p>
                                </div>
                            </div>
                            
                            <div class="review-item">
                                <div class="review-header">
                                    <div class="reviewer-name">Michael T.</div>
                                    <div class="review-date">April 28, 2025</div>
                                </div>
                                <div class="review-rating">
                                    <div class="stars">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                    </div>
                                </div>
                                <div class="review-content">
                                    <p>Ordered this for my wife's birthday and she loved it. The flowers were fresh and the arrangement was beautiful. Delivery was prompt and the flowers were well-packaged.</p>
                                </div>
                            </div>
                            
                            <div class="review-item">
                                <div class="review-header">
                                    <div class="reviewer-name">Jessica K.</div>
                                    <div class="review-date">April 10, 2025</div>
                                </div>
                                <div class="review-rating">
                                    <div class="stars">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                    </div>
                                </div>
                                <div class="review-content">
                                    <p>The Spring Delight bouquet brightened up my home instantly! The colors were vibrant and the flowers were in perfect condition. They lasted much longer than expected.</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="load-more">
                            <button class="btn btn-outline">Load More Reviews</button>
                        </div>
                    </div>
                </div>
            </section>
            
            <section class="related-products">
                <h2 class="section-title">You May Also Like</h2>
                <div class="products-grid">
                    <div class="product-card">
                        <a href="product-details.jsp">
                            <div class="product-image" style="background-image: url('/placeholder.svg?height=400&width=400')"></div>
                            <div class="product-info">
                                <h3>Pastel Dreams</h3>
                                <p class="product-price">$59.99</p>
                            </div>
                        </a>
                        <button class="btn btn-secondary add-to-cart">Add to Cart</button>
                    </div>
                    
                    <div class="product-card">
                        <a href="product-details.jsp">
                            <div class="product-image" style="background-image: url('/placeholder.svg?height=400&width=400')"></div>
                            <div class="product-info">
                                <h3>Elegant Roses</h3>
                                <p class="product-price">$69.99</p>
                            </div>
                        </a>
                        <button class="btn btn-secondary add-to-cart">Add to Cart</button>
                    </div>
                    
                    <div class="product-card">
                        <a href="product-details.jsp">
                            <div class="product-image" style="background-image: url('/placeholder.svg?height=400&width=400')"></div>
                            <div class="product-info">
                                <h3>Sunshine Bouquet</h3>
                                <p class="product-price">$45.99</p>
                            </div>
                        </a>
                        <button class="btn btn-secondary add-to-cart">Add to Cart</button>
                    </div>
                    
                    <div class="product-card">
                        <a href="product-details.jsp">
                            <div class="product-image" style="background-image: url('/placeholder.svg?height=400&width=400')"></div>
                            <div class="product-info">
                                <h3>Lavender Love</h3>
                                <p class="product-price">$55.99</p>
                            </div>
                        </a>
                        <button class="btn btn-secondary add-to-cart">Add to Cart</button>
                    </div>
                </div>
            </section>
        </div>
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

    <script>
        // Tab switching functionality
        document.addEventListener('DOMContentLoaded', function() {
            const tabs = document.querySelectorAll('.tab');
            const tabPanes = document.querySelectorAll('.tab-pane');
            
            tabs.forEach(tab => {
                tab.addEventListener('click', () => {
                    const target = tab.dataset.tab;
                    
                    // Update active tab
                    tabs.forEach(t => t.classList.remove('active'));
                    tab.classList.add('active');
                    
                    // Show corresponding tab pane
                    tabPanes.forEach(pane => {
                        pane.classList.remove('active');
                        if (pane.id === target) {
                            pane.classList.add('active');
                        }
                    });
                });
            });
            
            // Quantity selector
            const decreaseBtn = document.querySelector('.decrease');
            const increaseBtn = document.querySelector('.increase');
            const quantityInput = document.querySelector('.quantity-input');
            
            decreaseBtn.addEventListener('click', () => {
                let value = parseInt(quantityInput.value);
                if (value > 1) {
                    quantityInput.value = value - 1;
                }
            });
            
            increaseBtn.addEventListener('click', () => {
                let value = parseInt(quantityInput.value);
                if (value < 10) {
                    quantityInput.value = value + 1;
                }
            });
            
            // Thumbnail image selection
            const thumbnails = document.querySelectorAll('.thumbnail');
            const mainImage = document.querySelector('.main-image img');
            
            thumbnails.forEach(thumbnail => {
                thumbnail.addEventListener('click', () => {
                    // Update active thumbnail
                    thumbnails.forEach(t => t.classList.remove('active'));
                    thumbnail.classList.add('active');
                    
                    // Update main image (in a real implementation, this would change the src)
                    const thumbnailSrc = thumbnail.querySelector('img').src;
                    mainImage.src = thumbnailSrc.replace('100&width=100', '600&width=600');
                });
            });
        });
    </script>
</body>
</html>