package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.OrderItem;

import java.io.IOException;
import java.util.List;

import dao.OrderDAO;

/**
 * Servlet implementation class OrderConfirmationServlet
 */
@WebServlet("/order-confirmation")
public class OrderConfirmationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderConfirmationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer orderId = (Integer) session.getAttribute("orderId");
        
        // Check if user has just completed an order
        if (orderId == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        
        try {
            OrderDAO orderDAO = new OrderDAO();
            
            // Get order details
            Order order = orderDAO.getOrderById(orderId);
            if (order == null) {
                session.setAttribute("errorMessage", "Order not found");
                response.sendRedirect(request.getContextPath() + "/");
                return;
            }
            
            // Get order items
            List<OrderItem> orderItems = orderDAO.getOrderItems(orderId);
            
            // Calculate subtotal
            double subtotal = orderItems.stream()
                .mapToDouble(item -> item.getPrice() * item.getQuantity())
                .sum();
            
            // Set attributes for JSP
            request.setAttribute("order", order);
            request.setAttribute("orderItems", orderItems);
            request.setAttribute("subtotal", subtotal);
            
            // Clear the orderId from session so user can't refresh and see it again
            session.removeAttribute("orderId");
            
            request.getRequestDispatcher("/pages/confirmation.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error loading order confirmation: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/");
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
