<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart | Flora</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/cart.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
    <%@ include file="/includes/header.jsp" %>
    <%-- Set the active page parameter --%>
    <c:set var="activePage" value="cart" scope="request"/>

    <main>
        <section class="page-header">
            <div class="container">
                <h1>Shopping Cart</h1>
                <div class="breadcrumbs">
                    <a href="index.jsp">Home</a> / <span>Cart</span>
                </div>
            </div>
        </section>

        <section class="cart-section">
            <div class="container">
                <div class="cart-container">
                    <div class="cart-items">
                        <div class="cart-header">
                            <div class="cart-header-product">Product</div>
                            <div class="cart-header-price">Price</div>
                            <div class="cart-header-quantity">Quantity</div>
                            <div class="cart-header-total">Total</div>
                        </div>
                        
                        <!-- Cart Item 1 -->
                        <div class="cart-item">
                            <div class="cart-item-product">
                                <div class="cart-item-image">
                                    <img src="/placeholder.svg?height=100&width=100" alt="Spring Delight">
                                </div>
                                <div class="cart-item-details">
                                    <h3>Spring Delight</h3>
                                    <p class="cart-item-variant">Medium, Clear Glass Vase</p>
                                    <button class="remove-item">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path></svg>
                                        Remove
                                    </button>
                                </div>
                            </div>
                            <div class="cart-item-price">$49.99</div>
                            <div class="cart-item-quantity">
                                <div class="quantity-selector">
                                    <button class="quantity-btn decrease">-</button>
                                    <input type="number" value="1" min="1" max="10" class="quantity-input">
                                    <button class="quantity-btn increase">+</button>
                                </div>
                            </div>
                            <div class="cart-item-total">$49.99</div>
                        </div>
                        
                        <!-- Cart Item 2 -->
                        <div class="cart-item">
                            <div class="cart-item-product">
                                <div class="cart-item-image">
                                    <img src="/placeholder.svg?height=100&width=100" alt="Elegant Roses">
                                </div>
                                <div class="cart-item-details">
                                    <h3>Elegant Roses</h3>
                                    <p class="cart-item-variant">Medium, Ceramic White Vase</p>
                                    <button class="remove-item">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path></svg>
                                        Remove
                                    </button>
                                </div>
                            </div>
                            <div class="cart-item-price">$69.99</div>
                            <div class="cart-item-quantity">
                                <div class="quantity-selector">
                                    <button class="quantity-btn decrease">-</button>
                                    <input type="number" value="1" min="1" max="10" class="quantity-input">
                                    <button class="quantity-btn increase">+</button>
                                </div>
                            </div>
                            <div class="cart-item-total">$69.99</div>
                        </div>
                        
                        <!-- Cart Item 3 -->
                        <div class="cart-item">
                            <div class="cart-item-product">
                                <div class="cart-item-image">
                                    <img src="/placeholder.svg?height=100&width=100" alt="Lavender Love">
                                </div>
                                <div class="cart-item-details">
                                    <h3>Lavender Love</h3>
                                    <p class="cart-item-variant">Small, Clear Glass Vase</p>
                                    <button class="remove-item">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path></svg>
                                        Remove
                                    </button>
                                </div>
                            </div>
                            <div class="cart-item-price">$55.99</div>
                            <div class="cart-item-quantity">
                                <div class="quantity-selector">
                                    <button class="quantity-btn decrease">-</button>
                                    <input type="number" value="1" min="1" max="10" class="quantity-input">
                                    <button class="quantity-btn increase">+</button>
                                </div>
                            </div>
                            <div class="cart-item-total">$55.99</div>
                        </div>
                    </div>
                    
                    <div class="cart-actions">
                        <div class="coupon">
                            <input type="text" placeholder="Coupon code">
                            <button class="btn btn-outline">Apply Coupon</button>
                        </div>
                        <button class="btn btn-outline update-cart">Update Cart</button>
                    </div>
                    
                    <div class="cart-summary">
                        <h2>Cart Totals</h2>
                        <div class="summary-row">
                            <span>Subtotal</span>
                            <span>$175.97</span>
                        </div>
                        <div class="summary-row">
                            <span>Shipping</span>
                            <span>$12.99</span>
                        </div>
                        <div class="summary-row total">
                            <span>Total</span>
                            <span>$188.96</span>
                        </div>
                        <div class="checkout-button">
                            <a href="confirmation.jsp" class="btn btn-primary">Proceed to Checkout</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="continue-shopping">
            <div class="container">
                <a href="products.jsp" class="btn btn-outline">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m12 19-7-7 7-7"></path><path d="M19 12H5"></path></svg>
                    Continue Shopping
                </a>
            </div>
        </section>
    </main>

     <%@ include file="/includes/footer.jsp" %>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Quantity selector functionality
            const decreaseBtns = document.querySelectorAll('.decrease');
            const increaseBtns = document.querySelectorAll('.increase');
            
            decreaseBtns.forEach(btn => {
                btn.addEventListener('click', function() {
                    const input = this.nextElementSibling;
                    let value = parseInt(input.value);
                    if (value > 1) {
                        input.value = value - 1;
                        updateItemTotal(this);
                    }
                });
            });
            
            increaseBtns.forEach(btn => {
                btn.addEventListener('click', function() {
                    const input = this.previousElementSibling;
                    let value = parseInt(input.value);
                    if (value < 10) {
                        input.value = value + 1;
                        updateItemTotal(this);
                    }
                });
            });
            
            // Update item total when quantity changes
            function updateItemTotal(element) {
                const cartItem = element.closest('.cart-item');
                const priceElement = cartItem.querySelector('.cart-item-price');
                const quantityElement = cartItem.querySelector('.quantity-input');
                const totalElement = cartItem.querySelector('.cart-item-total');
                
                const price = parseFloat(priceElement.textContent.replace('$', ''));
                const quantity = parseInt(quantityElement.value);
                const total = price * quantity;
                
                totalElement.textContent = '$' + total.toFixed(2);
            }
        });
    </script>
</body>
</html>