
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
    <div class="container header-container">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/index.jsp">
                <h1>Flora</h1>
            </a>
        </div>
        <nav>
		    <ul class="nav-links">
		        <li><a href="${pageContext.request.contextPath}/" 
		               class="${requestScope.activePage eq 'home' ? 'active' : ''}">Home</a></li>
		               
		        <li><a href="${pageContext.request.contextPath}/products" 
		               class="${requestScope.activePage eq 'shop' ? 'active' : ''}">Shop</a></li>
		               
		        <li><a href="#" 
		               class="${requestScope.activePage eq 'about' ? 'active' : ''}">About</a></li>
		               
		        <li><a href="#" 
		               class="${requestScope.activePage eq 'contact' ? 'active' : ''}">Contact</a></li>
		    </ul>
		</nav>
        <div class="header-actions">
            <a href="${pageContext.request.contextPath}/pages/user-dashboard.jsp" class="header-icon ${param.activePage eq 'account' ? 'active' : ''}">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
                    <circle cx="12" cy="7" r="4"></circle>
                </svg>
            </a>
            <a href="${pageContext.request.contextPath}/pages/cart.jsp" class="header-icon cart-icon ${param.activePage eq 'cart' ? 'active' : ''}">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="8" cy="21" r="1"></circle>
                    <circle cx="19" cy="21" r="1"></circle>
                    <path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"></path>
                </svg>
                <span class="cart-count">0</span>
            </a>
            <button class="mobile-menu-toggle">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="3" y1="12" x2="21" y2="12"></line>
                    <line x1="3" y1="6" x2="21" y2="6"></line>
                    <line x1="3" y1="18" x2="21" y2="18"></line>
                </svg>
            </button>
        </div>
    </div>
</header>
</body>
</html>