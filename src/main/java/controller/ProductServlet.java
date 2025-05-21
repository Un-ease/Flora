package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Product;

import java.io.IOException;

import dao.ProductDAO;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/products"})
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        System.out.println("ProductServlet doGet called");

        String query = request.getParameter("query");
        
        try {
            ProductDAO productDAO = new ProductDAO();
            List<Product> products;
            
            if (query != null && !query.trim().isEmpty()) {
                System.out.println("Searching for products with keyword: " + query);
                products = productDAO.searchProducts(query.trim());
            } else {
                products = productDAO.getAllProducts();
            }


            request.setAttribute("products", products);
            request.setAttribute("query", query); // Optional: for displaying the query in the UI

            request.getRequestDispatcher("/pages/products.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading products: " + e.getMessage());
            request.getRequestDispatcher("/pages/error.jsp").forward(request, response);
        }
    }

    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }

}
