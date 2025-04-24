package controller;

import java.util.ArrayList;
import java.sql.SQLException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.UUID;
import model.User;
import utils.JwtUtil;
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.login(email, password);

            if (user != null) {
                // 1. Create HTTP session and store user object
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                
                // Generate CSRF token
                String csrfToken = UUID.randomUUID().toString();
                session.setAttribute("csrfToken", csrfToken);
                
                // 2. Generate JWT token
                String jwtToken = JwtUtil.generateToken(user.getEmail(), user.getRole());

                // 3. Set JWT token as HTTP-only cookie
                Cookie jwtCookie = new Cookie("jwt", jwtToken);
                jwtCookie.setHttpOnly(true);
                jwtCookie.setSecure(request.isSecure());
                jwtCookie.setPath("/");
                jwtCookie.setMaxAge(24 * 60 * 60); // 24 hours
                
                // Set SameSite attribute
                String sameSiteHeader = String.format("jwt=%s; SameSite=Strict", jwtToken);
                response.setHeader("Set-Cookie", sameSiteHeader);
                response.addCookie(jwtCookie);

                // 4. Handle redirect after login
                String redirectUrl = (String) session.getAttribute("redirectAfterLogin");
                if (redirectUrl != null) {
                    session.removeAttribute("redirectAfterLogin");
                    response.sendRedirect(redirectUrl);
                } else {
                    // Default redirect based on role
                    if ("Admin".equals(user.getRole())) {
                        response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/pages/user-dashboard.jsp");
                    }
                }
            } else {
                // Login failed
                request.setAttribute("errorMessage", "Invalid email or password");
                request.setAttribute("email", email); // Preserve the entered email
                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "System error during login: " + e.getMessage());
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
        }
    }


}
