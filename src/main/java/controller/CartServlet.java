package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import model.User;

import java.io.IOException;
import java.util.List;

import dao.CartDAO;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        try {
            CartDAO cartDAO = new CartDAO();
            List<CartItem> cartItems = cartDAO.getCartItems(user.getUserId());
            
            // Calculate totals
            double subtotal = cartItems.stream()
                .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                .sum();
            double shipping = subtotal > 50 ? 0 : 12.99; // Free shipping over $50
            double total = subtotal + shipping;
            
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("subtotal", subtotal);
            request.setAttribute("shipping", shipping);
            request.setAttribute("total", total);
            System.out.println("User ID: " + user.getUserId());
            List<CartItem> cartItems1 = cartDAO.getCartItems(user.getUserId());
            System.out.println("Number of cart items retrieved: " + cartItems1.size());
            cartItems1.forEach(item -> System.out.println(
                "Item: " + item.getProduct().getProductName() + 
                ", Qty: " + item.getQuantity()
            ));
            
            request.getRequestDispatcher("/pages/cart.jsp").forward(request, response);
            
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading cart: " + e.getMessage());;
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        String productIdParam = request.getParameter("productId");
        
        try {
            CartDAO cartDAO = new CartDAO();
            int productId = Integer.parseInt(productIdParam);
            
            if ("update".equals(action)) {
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                cartDAO.updateCartItem(user.getUserId(), productId, quantity);
            } 
            else if ("remove".equals(action)) {
                cartDAO.removeItemFromCart(user.getUserId(), productId);
            }
            
            response.sendRedirect("cart");
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error updating cart: " + e.getMessage());
            response.sendRedirect("cart");
        }
    }

}
