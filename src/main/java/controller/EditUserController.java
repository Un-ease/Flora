package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.sql.SQLException;
/**
 * Servlet implementation class EditUserController
 */
@WebServlet("/EditUserController")
public class EditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String fullName = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");
            String password = request.getParameter("password");
            
            // Create user object
            User user = new User();
            user.setUserId(userId);
            user.setFullName(fullName);
            user.setEmail(email);
            user.setRole(role);
            
            // Only set password if it was provided
            if (password != null && !password.isEmpty()) {
                user.setPassword(password);
            }
            
            // Update user
            UserDAO userDAO = new UserDAO();
            boolean isUpdated = userDAO.updateUser(user);
            
            if (isUpdated) {
                request.getSession().setAttribute("successMessage", "User updated successfully!");
            } else {
                request.getSession().setAttribute("errorMessage", "Failed to update user");
            }
            
            response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp?section=users");
            
        } catch (Exception e) {
            request.getSession().setAttribute("errorMessage", "Error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp?section=users");
        }
    }

}
