package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpFilter;
import java.io.IOException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import utils.JwtUtil;

@WebFilter("/*")
public class SessionFilter extends HttpFilter implements Filter {
    
    private static final String[] PUBLIC_PATHS = {
        "/pages/login.jsp",
        "/pages/register.jsp",
        "/LoginController",
        "/RegisterController",
        "/pages/index.jsp",
        "/css/",
        "/pages/js/",
        "/items/",
        "/index",
        "/uploads/"
    };

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        
        // Set security headers
        httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        httpResponse.setHeader("Pragma", "no-cache");
        httpResponse.setDateHeader("Expires", 0);
        httpResponse.setHeader("X-Frame-Options", "DENY");
        httpResponse.setHeader("X-Content-Type-Options", "nosniff");

        // Check if this is a public path
        if (isPublicPath(path)) {
            chain.doFilter(request, response);
            return;
        }

        // 1. First check session
        HttpSession session = httpRequest.getSession(false);
        User sessionUser = (session != null) ? (User) session.getAttribute("user") : null;

        // 2. Then check JWT cookie
        String jwtToken = getJwtToken(httpRequest);

        if (sessionUser == null || jwtToken == null) {
            redirectToLogin(httpRequest, httpResponse);
            return;
        }

        try {
            // Validate JWT
            DecodedJWT decodedJWT = JwtUtil.validateToken(jwtToken);
            
            // Verify session user matches JWT claims
            if (!sessionUser.getEmail().equals(decodedJWT.getSubject())) {
                redirectToLogin(httpRequest, httpResponse);
                return;
            }

            // Add user info to request for convenience
            httpRequest.setAttribute("user", sessionUser);
            chain.doFilter(request, response);

        } catch (JWTVerificationException e) {
            redirectToLogin(httpRequest, httpResponse);
        }
    }

    private boolean isPublicPath(String path) {
        for (String publicPath : PUBLIC_PATHS) {
            if (path.startsWith(publicPath)) {
                return true;
            }
        }
        return false;
    }

    private String getJwtToken(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("jwt".equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    private void redirectToLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Store original URL for redirect back after login
        String originalUri = request.getRequestURI();
        String queryString = request.getQueryString();
        if (queryString != null) {
            originalUri += "?" + queryString;
        }
        
        HttpSession session = request.getSession(true);
        session.setAttribute("redirectAfterLogin", originalUri);
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
    }

    public void init(FilterConfig fConfig) throws ServletException {
        // Initialization code if needed
    }
}