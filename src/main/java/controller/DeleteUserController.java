package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class DeleteUserController
 */
@WebServlet("/DeleteUserController")
public class DeleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserController() {
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
            
            UserDAO userDAO = new UserDAO();
            boolean isDeleted = userDAO.deleteUser(userId);
            
            if (isDeleted) {
                request.getSession().setAttribute("successMessage", "User deleted successfully!");
            } else {
                request.getSession().setAttribute("errorMessage", "Failed to delete user");
            }
            
            response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp?section=users");
            
        } catch (Exception e) {
            request.getSession().setAttribute("errorMessage", "Error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp?section=users");
        }
    }

}
