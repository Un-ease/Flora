package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;
import java.util.List;

import dao.ProductDAO;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet(name = "IndexServlet", urlPatterns = {"/index", "/"})
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	String path = request.getServletPath();
        
        // Skip static resources
        if (path.startsWith("/css/") || path.startsWith("/js/") || path.startsWith("/images/")) {
            request.getRequestDispatcher(path).forward(request, response);
            return;
        }
        try {
            ProductDAO productDAO = new ProductDAO();
            List<Product> featuredProducts = productDAO.getLimitedProducts(4); // Get first 4 products
            
            request.setAttribute("featuredProducts", featuredProducts);
            request.getRequestDispatcher("/pages/index.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading featured products: " + e.getMessage());
            request.getRequestDispatcher("/pages/index.jsp").forward(request, response);
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
