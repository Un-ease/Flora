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
        
        System.out.println("ProductServlet doGet called"); // Debug
        
        try {
            ProductDAO productDAO = new ProductDAO();
            List<Product> products = productDAO.getAllProducts();
            
            // Debug output
            System.out.println("Number of products from DB: " + products.size());
            for (Product product : products) {
                System.out.println("Product: " + product.getProductName() + 
                                 ", Price: " + product.getPrice() + 
                                 ", Image: " + product.getImage());
            }
            
            request.setAttribute("products", products);
            
            // Verify attribute is set
            System.out.println("Products attribute set: " + 
                (request.getAttribute("products") != null)); // Debug
            
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
