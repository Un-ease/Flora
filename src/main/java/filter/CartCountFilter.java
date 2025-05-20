package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import model.User;
import dao.CartDAO;

import java.io.IOException;

@WebFilter("/*")  // Applies to all URLs
public class CartCountFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpSession session = httpReq.getSession(false);
        
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            try {
                CartDAO cartDAO = new CartDAO();
                int cartCount = cartDAO.getCartItemCount(user.getUserId());

                // Option 1: Make it available to JSP
                request.setAttribute("cartItemCount", cartCount);
                
                // Option 2 (optional): Store in session if you prefer
                // session.setAttribute("cartItemCount", cartCount);

            } catch (Exception e) {
                e.printStackTrace(); // Log properly in real apps
            }
        }

        // Continue filter chain
        chain.doFilter(request, response);
    }
}
