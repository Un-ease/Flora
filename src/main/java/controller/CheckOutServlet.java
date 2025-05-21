package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;
import model.Order;
import model.OrderItem;
import model.User;

import java.io.IOException;
import java.util.List;

import dao.CartDAO;
import dao.OrderDAO;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/checkout")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutServlet() {
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
            response.sendRedirect("${pageContext.request.contextPath}/pages/login.jsp");
            return;
        }
        
        try {
            CartDAO cartDAO = new CartDAO();
            List<CartItem> cartItems = cartDAO.getCartItems(user.getUserId());
            
            if (cartItems.isEmpty()) {
                session.setAttribute("errorMessage", "Your cart is empty");
                response.sendRedirect("cart.jsp");
                return;
            }
            
            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("/checkout").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error loading checkout: " + e.getMessage());
            response.sendRedirect("${pageContext.request.contextPath}/cart");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        try {
            // Get form parameters
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String zipCode = request.getParameter("zipCode");
            String paymentMethod = request.getParameter("paymentMethod");
            
            // Build complete shipping address
            String shippingAddress = String.format("%s\n%s\n%s", address, city, zipCode);
            
            // Get cart items
            CartDAO cartDAO = new CartDAO();
            List<CartItem> cartItems = cartDAO.getCartItems(user.getUserId());
            
            // Calculate total
            double total = cartItems.stream()
                .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                .sum();
            
            // Create order
            OrderDAO orderDAO = new OrderDAO();
            Order order = new Order(user.getUserId(), total, shippingAddress, paymentMethod);
            int orderId = orderDAO.createOrder(order);
            
            if (orderId > 0) {
                // Convert cart items to order items
                List<OrderItem> orderItems = cartItems.stream()
                    .map(item -> new OrderItem(
                        item.getProductId(),
                        item.getQuantity(),
                        item.getProduct().getPrice()
                    ))
                    .toList();
                
                // Save order items
                if (orderDAO.createOrderItems(orderId, orderItems)) {
                    // Update product stock
                    orderDAO.updateProductStock(orderItems);
                    
                    // Clear cart
                    cartDAO.clearCart(user.getUserId());
                    
                    // Set success message
                    session.setAttribute("orderId", orderId);
                    response.sendRedirect("order-confirmation");
                    return;
                }
            }
            
            // If we get here, something failed
            session.setAttribute("errorMessage", "Failed to process your order");
            response.sendRedirect("checkout");
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error processing order: " + e.getMessage());
            response.sendRedirect("checkout");
        }
    }

}
