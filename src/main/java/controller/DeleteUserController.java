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
        String userIDParam = request.getParameter("userID");
		try{
			if (userIDParam == null || userIDParam.isEmpty()){
				response.sendRedirect(request.getContextPath()+ "/pages/admin-dashboard.jsp");
				System.out.println("userID"+userIDParam);
				return;
			}

			int userID = Integer.parseInt(userIDParam);
			UserDAO userDAO = new UserDAO();
			userDAO.deleteUser(userID);
			response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp#users-section");
		            
		    } catch (NumberFormatException | SQLException | ClassNotFoundException e) {
		            // On any error, just redirect back
		            response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp?#users-section");
		        }
		}
    

}
