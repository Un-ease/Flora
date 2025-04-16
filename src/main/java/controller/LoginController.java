package controller;

import java.util.ArrayList;
import java.sql.SQLException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import model.User;
import dao.UserDAO;
/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
	protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			UserDAO userdao = new UserDAO();
			User user = userdao.login(email, password);
			if(user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				
				response.sendRedirect(request.getContextPath() + "/pages/index.jsp");
			} else {
				// If login fails, send an error message to the log in page
				request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
				request.getRequestDispatcher("/pages/Login.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// Log the error properly in production (use a logger)
			request.setAttribute("errorMessage", "A system error occurred. Please try again later.");
			request.getRequestDispatcher("/pages/Login.jsp").forward(request, response);
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}

}
