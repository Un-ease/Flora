<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Flora</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Montserrat:wght@300;400;500&display=swap" rel="../cssheet">
    
<style>
    .error-message {
        color: red;
        font-size: 0.9rem;
        margin: 10px 0;
        padding: 10px;
        background-color: #ffeeee;
        border: 1px solid #ffcccc;
        border-radius: 4px;
    }
</style>
    
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
                <a href="login.jsp" class="header-icon active">
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
        <section class="auth-section">
            <div class="container">
                <div class="auth-container">
                    <form action="${pageContext.request.contextPath}/RegisterController" id="register-form" class="auth-form" method="post">
                        <h2>Create Account</h2>
                        
                        <%-- Display error message if exists --%>
						<c:if test="${not empty errorMessage}">
						    <div class="error-message">
						        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="vertical-align: middle; margin-right: 5px;">
						            <circle cx="12" cy="12" r="10"></circle>
						            <line x1="12" y1="8" x2="12" y2="12"></line>
						            <line x1="12" y1="16" x2="12.01" y2="16"></line>
						        </svg>
						        ${errorMessage}
						    </div>
						</c:if>
                        
                        <div class="form-group">
                            <label for="register-name">Full Name</label>
                            <input type="text" id="register-name" name="fullName" 
                                   value="${param.fullName}" required>
                        </div>
                        <div class="form-group">
                            <label for="register-email">Email</label>
                            <input type="email" id="register-email" name="email" value="${param.email}" required>	
                        </div>
                        <div class="form-group">
                            <label for="register-password">Password</label>
                            <input type="password" id="register-password" name="password" required>
                        </div>
                        <div class="form-group">
                            <label for="register-confirm-password">Confirm Password</label>
                            <input type="password" id="register-confirm-password" required>
                            <small id="password-error" class="error-message" style="display: none;">
                                Passwords do not match
                            </small>
                        </div>
                        <div class="form-group form-checkbox">
                            <input type="checkbox" id="terms" required>
                            <label for="terms">I agree to the <a href="#">Terms & Conditions</a></label>
                        </div>
                        <button type="submit" class="btn btn-primary">Register</button>
                        <p class="form-footer login-link">
                            Already have an account? <a href="login.jsp">Login here</a>
                        </p>
                    </form>
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
    <script>
    document.getElementById('register-form').addEventListener('submit', function(e) {
        const password = document.getElementById('register-password').value;
        const confirmPassword = document.getElementById('register-confirm-password').value;
        const errorElement = document.getElementById('password-error');
        
        if (password !== confirmPassword) {
            e.preventDefault();
            errorElement.style.display = 'block';
            document.getElementById('register-password').classList.add('error');
            document.getElementById('register-confirm-password').classList.add('error');
        }
    });
    </script>
</body>
</html>