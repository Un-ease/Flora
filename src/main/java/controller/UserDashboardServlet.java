package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.WishListItem;
import model.Order;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.UserDAO;
import dao.WishListDAO;
import dao.OrderDAO;

@WebServlet("/UserDashboardServlet")
public class UserDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        try {
            // Get wishlist items
            WishListDAO wishListDAO = new WishListDAO();
            List<WishListItem> wishlist = wishListDAO.getWishlistByUser(user.getUserId());
            request.setAttribute("wishlist", wishlist);
            
            // Get recent orders (last 3)
            OrderDAO orderDAO = new OrderDAO();
            List<Order> recentOrders = orderDAO.getOrdersByUserId(user.getUserId(), 3);
            request.setAttribute("recentOrders", recentOrders);
            
            List<Order> allOrders = orderDAO.getOrdersByUserId(user.getUserId());
            request.setAttribute("allOrders", allOrders);
            
            // Get total order count
            int orderCount = orderDAO.getOrderCount(user.getUserId());
            request.setAttribute("orderCount", orderCount);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading dashboard data: " + e.getMessage());
        }
        
        request.setAttribute("user", user);
        request.getRequestDispatcher("/pages/user-dashboard.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }

        User currentUser = (User) session.getAttribute("user");

        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String currentPassword = request.getParameter("currentPassword");

        UserDAO userDAO = new UserDAO();
        try {
            // Verify current password
            if (!userDAO.verifyPassword(currentUser.getUserId(), currentPassword)) {
                request.setAttribute("error", "Current password is incorrect.");
                doGet(request, response);
                return;
            }

            // Update user details
            currentUser.setFullName(fullName);
            currentUser.setAddress(address);
            currentUser.setPhoneNumber(phone);
            
            boolean updated = userDAO.updateUser(currentUser);
            if (updated) {
                // Refresh user data from DB
                User updatedUser = userDAO.getUserById(currentUser.getUserId());
                session.setAttribute("user", updatedUser);
                request.setAttribute("success", "Account details updated successfully.");
            } else {
                request.setAttribute("error", "Failed to update account details.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
        }

        doGet(request, response);
    }
}