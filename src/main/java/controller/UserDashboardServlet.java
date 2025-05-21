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

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.UserDAO;
import dao.WishListDAO;

/**
 * Servlet implementation class UserDashboardServlet
 */
@WebServlet("/UserDashboardServlet")
public class UserDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        try {
            WishListDAO wishListDAO = new WishListDAO();
            List<WishListItem> wishlist = wishListDAO.getWishlistByUser(user.getUserId());
            request.setAttribute("wishlist", wishlist);
        } catch (Exception e) {
            e.printStackTrace(); // Handle properly in real projects
        }
        
        System.out.println("Number: "+ user.getPhoneNumber());
        request.setAttribute("user", user);
        request.getRequestDispatcher("/pages/user-dashboard.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        String newPassword = request.getParameter("newPassword"); // Optional

        UserDAO userDAO = new UserDAO();
        try {
            User userFromDb = userDAO.login(currentUser.getEmail(), currentPassword);
            if (userFromDb == null) {
                request.setAttribute("error", "Current password is incorrect.");
            } else {
                // Merge changes
                currentUser.setFullName(fullName != null ? fullName : currentUser.getFullName());
                currentUser.setAddress(address != null ? address : currentUser.getAddress());
                currentUser.setPhoneNumber(phone != null ? phone : currentUser.getPhoneNumber());
                if (newPassword != null && !newPassword.isEmpty()) {
                    currentUser.setPassword(newPassword);
                } else {
                    currentUser.setPassword(null); // Don't update password
                }

                boolean updated = userDAO.updateUser(currentUser);
                if (updated) {
                    User updatedUser = userDAO.getUserById(currentUser.getUserId());
                    session.setAttribute("user", updatedUser);
                    request.setAttribute("success", "Account details updated successfully.");
                } else {
                    request.setAttribute("error", "Failed to update account details.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred. Please try again.");
        }

        // Forward to JSP to show messages and updated info
        request.getRequestDispatcher("/pages/user-dashboard.jsp").forward(request, response);
    }


}
