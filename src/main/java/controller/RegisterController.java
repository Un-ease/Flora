package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;
import java.util.UUID;
import dao.UserDAO;
import utils.JwtUtil;
/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
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
	    
	    String fullName = request.getParameter("fullName");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    User newUser = new User();
	    newUser.setFullName(fullName);
	    newUser.setEmail(email);
	    newUser.setPassword(password);
	    newUser.setRole("Customer");

	    try {
	        UserDAO userDao = new UserDAO();
	        if (userDao.isEmailTaken(email)) {
	            request.setAttribute("errorMessage", "Email address is already in use. Please use a different email.");
	            request.setAttribute("fullName", fullName);
	            request.setAttribute("email", email);
	            request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
	            return;
	        }
	      
	        if (userDao.register(newUser)) {
	            // Registration successful - redirect to login page with success message
	            request.getSession().setAttribute("registrationSuccess", "Registration successful! Please login.");
	            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
	        } else {
	            request.setAttribute("errorMessage", "Registration failed. Please try again.");
	            request.setAttribute("fullName", fullName); // Preserve entered name
	            request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("errorMessage", "System error during registration: " + e.getMessage());
	        request.setAttribute("fullName", fullName); // Preserve entered name
	        request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
	    }
	}
}


