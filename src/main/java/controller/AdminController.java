package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.ProductDAO;
import dao.UserDAO;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            ProductDAO productDAO = new ProductDAO();
            UserDAO userDAO = new UserDAO();
            
            request.setAttribute("products", productDAO.getAllProducts());
            request.setAttribute("users", userDAO.getAllUsers());
            
            String section = request.getParameter("section") != null ? 
                           request.getParameter("section") : "dashboard";
            request.setAttribute("activeSection", section);
            
            request.getRequestDispatcher("/pages/admin-dashboard.jsp").forward(request, response);
            
        } catch (Exception e) {
            // Log error
            request.setAttribute("error", "Error loading admin dashboard");
            request.getRequestDispatcher("/pages/admin-dashboard.jsp").forward(request, response);
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
