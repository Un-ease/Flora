package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;
import model.Order;
import model.Product;
import model.User;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            ProductDAO productDAO = new ProductDAO();
            UserDAO userDAO = new UserDAO();
            OrderDAO orderDAO = new OrderDAO();
            
            // Get all products, users, and orders
            List<Product> products = productDAO.getAllProducts();
            List<User> users = userDAO.getAllUsers();
            List<Order> orders = orderDAO.getAllOrders();
            
            // Get dashboard statistics
            int totalProducts = products.size();
            int totalOrders = orders.size();
            int totalCustomers = userDAO.getUserCountByRole("customer");
            int activeUsers = userDAO.getActiveUserCount();
            System.out.println("Products: " + products.size());
            System.out.println("Orders: " + orders.size());
            System.out.println("Users: " + users.size());
            // Get recent orders (last 3)
            List<Order> recentOrders = orders.size() > 3 ? orders.subList(0, 3) : orders;
            
            // Get recent products (last 3)
            List<Product> recentProducts = products.size() > 3 ? products.subList(0, 3) : products;
            
            // Set request attributes
            request.setAttribute("products", products);
            request.setAttribute("users", users);
            request.setAttribute("orders", orders);
            request.setAttribute("recentOrders", recentOrders);
            request.setAttribute("recentProducts", recentProducts);
            request.setAttribute("totalProducts", totalProducts);
            request.setAttribute("totalOrders", totalOrders);
            request.setAttribute("totalCustomers", totalCustomers);
            request.setAttribute("activeUsers", activeUsers);
            
            String section = request.getParameter("section") != null ? 
                           request.getParameter("section") : "dashboard";
            request.setAttribute("activeSection", section);
            
            request.getRequestDispatcher("/pages/admin-dashboard.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading admin dashboard: " + e.getMessage());
            request.getRequestDispatcher("/pages/admin-dashboard.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}