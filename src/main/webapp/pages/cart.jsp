<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart | Flora</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
    .empty-cart-message {
    	grid-column: 1 / -1;
    	text-align: center;
    	padding: 3rem 0;
	}
	
	.empty-cart-message p {
	    font-size: 1.2rem;
	    margin-bottom: 1.5rem;
	    color: #666;
	}
	
	.empty-cart-message .btn {
	    margin-top: 1rem;
	}
    </style>
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
					    
					    <c:choose>
					        <c:when test="${empty cartItems}">
					            <div class="empty-cart-message">
					                <p>Your cart is empty</p>
					                <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Continue Shopping</a>
					            </div>
					        </c:when>
					        <c:otherwise>
					            <c:forEach var="item" items="${cartItems}">
					                <div class="cart-item">
					                    <div class="cart-item-product">
					                        <div class="cart-item-image">
					                            <c:choose>
					                                <c:when test="${empty item.product.image}">
					                                    <div class="no-image">No Image</div>
					                                </c:when>
					                                <c:otherwise>
					                                    <img src="${pageContext.request.contextPath}/uploads/${item.product.image}" alt="${item.product.productName}">
					                                </c:otherwise>
					                            </c:choose>
					                        </div>
					                        <div class="cart-item-details">
					                            <h3>${item.product.productName}</h3>
					                            <p class="cart-item-variant">SKU: FL-${item.product.productId}</p>
					                            <form method="post" action="${pageContext.request.contextPath}/cart" class="remove-form">
					                                <input type="hidden" name="action" value="remove">
					                                <input type="hidden" name="productId" value="${item.product.productId}">
					                                <button type="submit" class="remove-item">
					                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path></svg>
					                                    Remove
					                                </button>
					                            </form>
					                        </div>
					                    </div>
					                    <div class="cart-item-price">$${item.product.price}</div>
					                    <div class="cart-item-quantity">
					                        <form method="post" action="${pageContext.request.contextPath}/cart" class="update-form">
					                            <input type="hidden" name="action" value="update">
					                            <input type="hidden" name="productId" value="${item.product.productId}">
					                            <div class="quantity-selector">
					                                <button type="button" class="quantity-btn decrease">-</button>
					                                <input type="number" name="quantity" value="${item.quantity}" min="1" max="${item.product.quantity}" class="quantity-input">
					                                <button type="button" class="quantity-btn increase">+</button>
					                            </div>
					                        </form>
					                    </div>
					                    <div class="cart-item-total">$${item.product.price * item.quantity}</div>
					                </div>
					            </c:forEach>
					        </c:otherwise>
					    </c:choose>
					</div>
                    
                    <div class="cart-summary">
					    <h2>Cart Totals</h2>
					    <div class="summary-row">
					        <span>Subtotal</span>
					        <span>$${subtotal}</span>
					    </div>
					    <div class="summary-row">
					        <span>Shipping</span>
					        <span>${subtotal > 50 ? 'FREE' : '$12.99'}</span>
					    </div>
					    <div class="summary-row total">
					        <span>Total</span>
					        <span>$${total}</span>
					    </div>
					    <div class="checkout-button">
					        <a href="${pageContext.request.contextPath}/pages/confirmation.jsp" class="btn btn-primary">Proceed to Checkout</a>
					    </div>
					</div>
                </div>
            </div>
        </section>
        
        <section class="continue-shopping">
            <div class="container">
                <a href="${pageContext.request.contextPath}/products" class="btn btn-outline">
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
	        document.querySelectorAll('.quantity-btn').forEach(btn => {
	    	btn.addEventListener('click', function() {
	        const form = this.closest('.update-form');
	        const input = form.querySelector('.quantity-input');
	        let value = parseInt(input.value);
	
	        if (this.classList.contains('decrease') && value > 1) {
	            input.value = value - 1;
	        } 
	        else if (this.classList.contains('increase')) {
	            input.value = value + 1;
	        }
	
	        form.submit();
		    });
		});
		});
    </script>
</body>
</html>