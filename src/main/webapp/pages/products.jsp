<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop | Flora</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/products.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <div class="container header-container">
            <div class="logo">
                <a href="index.html">
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
        <section class="page-header">
            <div class="container">
                <h1>Shop Our Collection</h1>
                <div class="breadcrumbs">
                    <a href="index.html">Home</a> / <span>Shop</span>
                </div>
            </div>
        </section>

        <section class="products-section">
            <div class="container">
                <div class="products-layout">
                    <aside class="filters">
                        <div class="filter-group">
                            <h3>Categories</h3>
                            <ul class="filter-list">
                                <li><a href="#" class="active">All Products</a></li>
                                <li><a href="#">Bouquets</a></li>
                                <li><a href="#">Arrangements</a></li>
                                <li><a href="#">Plants</a></li>
                                <li><a href="#">Gifts</a></li>
                            </ul>
                        </div>
                        
                        <div class="filter-group">
                            <h3>Price Range</h3>
                            <div class="price-range">
                                <input type="range" min="0" max="200" value="200" class="price-slider">
                                <div class="price-values">
                                    <span>$0</span>
                                    <span>$200</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="filter-group">
                            <h3>Occasion</h3>
                            <ul class="filter-list">
                                <li>
                                    <input type="checkbox" id="birthday">
                                    <label for="birthday">Birthday</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="anniversary">
                                    <label for="anniversary">Anniversary</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="sympathy">
                                    <label for="sympathy">Sympathy</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="congratulations">
                                    <label for="congratulations">Congratulations</label>
                                </li>
                                <li>
                                    <input type="checkbox" id="love">
                                    <label for="love">Love & Romance</label>
                                </li>
                            </ul>
                        </div>
                        
                        <button class="btn btn-outline mobile-filter-toggle">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"></polygon></svg>
                            Filters
                        </button>
                    </aside>
                    
                    <div class="products-content">
                        <div class="products-header">
                            <div class="products-count">
                                <p>Showing 12 of 36 products</p>
                            </div>
                            <div class="products-sort">
                                <label for="sort">Sort by:</label>
                                <select id="sort">
                                    <option value="featured">Featured</option>
                                    <option value="price-low">Price: Low to High</option>
                                    <option value="price-high">Price: High to Low</option>
                                    <option value="newest">Newest</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="products-grid">
                            <!-- Product 1 -->
                            <div class="product-card">
                                <a href="product-details.jsp">
                                    <div class="product-image" style="background-image: url('/placeholder.svg?height=400&width=400')"></div>
                                    <div class="product-info">
                                        <h3>Spring Delight</h3>
                                        <p class="product-price">$49.99</p>
                                    </div>
                                </a>
                                <button class="btn btn-secondary add-to-cart">Add to Cart</button>
                            </div>
                            
                            <!-- Product 2 -->
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
                            
                            <!-- Product 3 -->
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
                            
                            <!-- Product 4 -->
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
                            
                            <!-- Product 5 -->
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
                            
                            <!-- Product 6 -->
                            <div class="product-card">
                                <a href="product-details.jsp">
                                    <div class="product-image" style="background-image: url('/placeholder.svg?height=400&width=400')"></div>
                                    <div class="product-info">
                                        <h3>Tropical Paradise</h3>
                                        <p class="product-price">$79.99</p>
                                    </div>
                                </a>
                                <button class="btn btn-secondary add-to-cart">Add to Cart</button>
                            </div>
                            
                            <!-- Product 7 -->
                            <div class="product-card">
                                <a href="product-details.jsp">
                                    <div class="product-image" style="background-image: url('/placeholder.svg?height=400&width=400')"></div>
                                    <div class="product-info">
                                        <h3>Rustic Charm</h3>
                                        <p class="product-price">$52.99</p>
                                    </div>
                                </a>
                                <button class="btn btn-secondary add-to-cart">Add to Cart</button>
                            </div>
                            
                            <!-- Product 8 -->
                            <div class="product-card">
                                <a href="product-details.jsp">
                                    <div class="product-image" style="background-image: url('/placeholder.svg?height=400&width=400')"></div>
                                    <div class="product-info">
                                        <h3>Peaceful Lily</h3>
                                        <p class="product-price">$62.99</p>
                                    </div>
                                </a>
                                <button class="btn btn-secondary add-to-cart">Add to Cart</button>
                            </div>
                            
                            <!-- Product 9 -->
                            <div class="product-card">
                                <a href="product-details.jsp">
                                    <div class="product-image" style="background-image: url('/placeholder.svg?height=400&width=400')"></div>
                                    <div class="product-info">
                                        <h3>Garden Delight</h3>
                                        <p class="product-price">$58.99</p>
                                    </div>
                                </a>
                                <button class="btn btn-secondary add-to-cart">Add to Cart</button>
                            </div>
                        </div>
                        
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
                        <li><a href="index.html">Home</a></li>
                        <li><a href="products.html">Shop</a></li>
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