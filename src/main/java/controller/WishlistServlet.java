package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.WishListDAO;
import model.User;
import model.WishListItem;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
/**
 * Servlet implementation class WishlistServlet
 */
@WebServlet("/WishlistServlet")
public class WishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishlistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.getWriter().append("Served at: ").append(request.getContextPath());
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            session.setAttribute("errorMessage", "You must be logged in to use the wishlist.");
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }

        String action = request.getParameter("action");
        long productId = Long.parseLong(request.getParameter("productId"));
        boolean actionSuccess = false;

        try {
            WishListDAO wishlistDAO = new WishListDAO();

            if ("add".equals(action)) {
                actionSuccess = wishlistDAO.addToWishlist(user.getUserId(), productId);
                if (actionSuccess) {
                    session.setAttribute("successMessage", "Product added to your wishlist.");
                }
            } else if ("remove".equals(action)) {
                actionSuccess = wishlistDAO.removeFromWishlist(user.getUserId(), productId);
                if (actionSuccess) {
                    session.setAttribute("successMessage", "Product removed from your wishlist.");
                }
            }
            
            // Store the updated wishlist status in the session instead of request
            // This ensures it persists after redirect
            boolean isInWishlist = wishlistDAO.isProductInWishlist(user.getUserId(), productId);
            session.setAttribute("isInWishlist_" + productId, isInWishlist);

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "An error occurred while updating your wishlist: " + e.getMessage());
        }

        // Redirect to previous page or fallback
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer != null ? referer : request.getContextPath() + "/product-details?id=" + productId);
    }

    

}
