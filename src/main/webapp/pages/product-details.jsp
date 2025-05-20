<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details | Flora</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/product-details.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
    /* Message styles */
			.message-container {
			    margin-bottom: 1.5rem;
			}
			
			.alert {
			    padding: 12px 16px;
			    border-radius: 4px;
			    margin-bottom: 1rem;
			    font-size: 0.9rem;
			}
			
			.alert-success {
			    background-color: #d4edda;
			    color: #155724;
			    border: 1px solid #c3e6cb;
			}
			
			.alert-error {
			    background-color: #f8d7da;
			    color: #721c24;
			    border: 1px solid #f5c6cb;
			}
	</style>
</head>
<body>
    <%@ include file="/includes/header.jsp" %>
    <%-- Set the active page parameter --%>


     <main>
        <section class="product-details-section">
            <div class="container">
                <div class="breadcrumbs">
                    <a href="${pageContext.request.contextPath}/index">Home</a> / 
                    <a href="${pageContext.request.contextPath}/products">Shop</a> / 
                    <span>${product.productName}</span>
                </div>
                
                <div class="product-details">
                    <div class="product-gallery">
                        <div class="main-image">
                            <c:choose>
                                <c:when test="${empty product.image}">
                                    <div class="no-image">No Image Available</div>
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/uploads/${product.image}" alt="${product.productName}">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="thumbnail-images">
                            <div class="thumbnail active">
                                <c:choose>
                                    <c:when test="${empty product.image}">
                                        <div class="no-image">No Image</div>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/uploads/${product.image}" alt="${product.productName}">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <!-- For now, we only have one image per product -->
                        </div>
                    </div>
                    
                    <div class="product-info">
                    	<div class="message-container">
					        <c:if test="${not empty successMessage}">
					            <div class="alert alert-success">${successMessage}</div>
					        </c:if>
					        <c:if test="${not empty errorMessage}">
					            <div class="alert alert-error">${errorMessage}</div>
					        </c:if>
					    </div>
                        <h1>${product.productName}</h1>
                        <div class="product-price">$${product.price}</div>
                        <div class="product-rating">
                            <div class="stars">
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                            </div>
                            <span class="rating-count">(24 reviews)</span>
                        </div>
                        
                        <div class="product-short-description">
                            <p>${product.productDescription}</p>
                            <ul class="product-features">
                                <li>Hand-arranged by our expert florists</li>
                                <li>Includes premium seasonal flowers</li>
                                <li>Arrives in a decorative vase</li>
                                <li>Guaranteed fresh for 7 days</li>
                            </ul>
                        </div>
                        
                        <div class="product-actions">
                            <div class="quantity-selector">
                                <button class="quantity-btn decrease">-</button>
                                <input type="number" value="1" min="1" max="${product.quantity}" class="quantity-input">
                                <button class="quantity-btn increase">+</button>
                            </div>
                            <form method="post" action="${pageContext.request.contextPath}/product-details" class="add-to-cart-form">
							    <input type="hidden" name="action" value="addToCart">
							    <input type="hidden" name="productId" value="${product.productId}">
							    <input type="hidden" name="quantity" id="hidden-quantity" value="1">
							    <button type="submit" class="btn btn-primary">Add to Cart</button>
							</form>
                            <button class="btn-wishlist">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
                            </button>
                        </div>
                        
                        <div class="product-meta">
                            <div class="meta-item">
                                <span class="meta-label">SKU:</span>
                                <span class="meta-value">FL-${product.productId}</span>
                            </div>
                           
                            <div class="meta-item">
                                <span class="meta-label">Stock:</span>
                                <span class="meta-value">${product.quantity > 0 ? 'In Stock' : 'Out of Stock'}</span>
                            </div>
                        </div>
                        
                        <div class="product-share">
                            <span>Share:</span>
                            <div class="social-icons">
                                <a href="#" class="social-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>
                                </a>
                                <a href="#" class="social-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>
                                </a>
                                <a href="#" class="social-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>
                                </a>
                                <a href="#" class="social-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22.54 6.42a2.78 2.78 0 0 0-1.94-2C18.88 4 12 4 12 4s-6.88 0-8.6.46a2.78 2.78 0 0 0-1.94 2A29 29 0 0 0 1 11.75a29 29 0 0 0 .46 5.33A2.78 2.78 0 0 0 3.4 19c1.72.46 8.6.46 8.6.46s6.88 0 8.6-.46a2.78 2.78 0 0 0 1.94-2 29 29 0 0 0 .46-5.25 29 29 0 0 0-.46-5.33z"></path><polygon points="9.75 15.02 15.5 11.75 9.75 8.48 9.75 15.02"></polygon></svg>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
         <section class="related-products">
            <div class="container">
                <h2>You May Also Like</h2>
                <div class="products-grid">
                    <c:choose>
                        <c:when test="${empty similarProducts}">
                            <p>No similar products available at this time.</p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="similarProduct" items="${similarProducts}">
                                <div class="product-card">
                                    <a href="${pageContext.request.contextPath}/product-details?id=${similarProduct.productId}">
                                        <div class="product-image" style="background-image: url('${pageContext.request.contextPath}/uploads/${similarProduct.image}')">
                                            <c:if test="${empty similarProduct.image}">
                                                <div class="no-image">No Image</div>
                                            </c:if>
                                        </div>
                                        <div class="product-info">
                                            <h3>${similarProduct.productName}</h3>
                                            <p class="product-price">$${similarProduct.price}</p>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>
    </main>

    <%@ include file="/includes/footer.jsp" %>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Thumbnail image click handler
            const thumbnails = document.querySelectorAll('.thumbnail');
            const mainImage = document.querySelector('.main-image img');
            
            thumbnails.forEach(thumbnail => {
                thumbnail.addEventListener('click', function() {
                    // Remove active class from all thumbnails
                    thumbnails.forEach(t => t.classList.remove('active'));
                    
                    // Add active class to clicked thumbnail
                    this.classList.add('active');
                    
                    // Update main image src
                    const thumbnailSrc = this.querySelector('img').src;
                    mainImage.src = thumbnailSrc;
                });
            });
            
            // Quantity selector
            const decreaseBtn = document.querySelector('.quantity-btn.decrease');
            const increaseBtn = document.querySelector('.quantity-btn.increase');
            const quantityInput = document.querySelector('.quantity-input');
            const maxQuantity = ${product.quantity};
            
         // Update the quantity sync logic
            quantityInput.addEventListener('change', function() {
                let value = parseInt(this.value);
                if (value < 1) {
                    this.value = 1;
                } else if (value > maxQuantity) {
                    this.value = maxQuantity;
                }
                document.getElementById('hidden-quantity').value = this.value;
            });

            // Also update the increase/decrease buttons
            decreaseBtn.addEventListener('click', function() {
                let value = parseInt(quantityInput.value);
                if (value > 1) {
                    quantityInput.value = value - 1;
                    document.getElementById('hidden-quantity').value = quantityInput.value;
                }
            });

            increaseBtn.addEventListener('click', function() {
                let value = parseInt(quantityInput.value);
                if (value < maxQuantity) {
                    quantityInput.value = value + 1;
                    document.getElementById('hidden-quantity').value = quantityInput.value;
                }
            });
            
            // Add to cart functionality can be added here
            
            // Add to cart buttons on similar products
            const similarAddToCartBtns = document.querySelectorAll('.products-grid .add-to-cart');
            similarAddToCartBtns.forEach(btn => {
                btn.addEventListener('click', function() {
                    const productId = this.getAttribute('data-product-id');
                    
                    // Add product to cart with quantity 1
                    alert(`Added product #${productId} to cart!`);
                });
            });
        });
    </script>

</body>
</html>