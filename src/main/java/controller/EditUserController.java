package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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

	    HttpSession session = request.getSession(false);
	    if (session == null || session.getAttribute("user") == null) {
	        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
	        return;
	    }

	    try {
	        int userId = Integer.parseInt(request.getParameter("userId"));
	        String fullName = request.getParameter("fullname");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("phone");
	        String address = request.getParameter("address"); // ✅ FIXED
	        String role = request.getParameter("role");
	        String password = request.getParameter("password");

	        UserDAO userDAO = new UserDAO();
	        User existingUser = userDAO.getUserById(userId);
	        if (existingUser == null) {
	            session.setAttribute("errorMessage", "User not found.");
	            response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp?section=users");
	            return;
	        }

	        existingUser.setFullName((fullName != null && !fullName.isEmpty()) ? fullName : existingUser.getFullName());
	        existingUser.setEmail((email != null && !email.isEmpty()) ? email : existingUser.getEmail());
	        existingUser.setPhoneNumber((phone != null && !phone.isEmpty()) ? phone : existingUser.getPhoneNumber());
	        existingUser.setAddress((address != null && !address.isEmpty()) ? address : existingUser.getAddress()); // ✅ FIXED
	        existingUser.setRole((role != null && !role.isEmpty()) ? role : existingUser.getRole());

	        if (password != null && !password.isEmpty()) {
	            existingUser.setPassword(password);
	        } else {
	            existingUser.setPassword(null);
	        }

	        boolean isUpdated = userDAO.updateUser(existingUser);

	        if (isUpdated) {
	            session.setAttribute("successMessage", "User updated successfully!");
	        } else {
	            session.setAttribute("errorMessage", "Failed to update user");
	        }

	        response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp?section=users");

	    } catch (Exception e) {
	        e.printStackTrace();
	        session.setAttribute("errorMessage", "Error: " + e.getMessage());
	        response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp?section=users");
	    }
	}



}
