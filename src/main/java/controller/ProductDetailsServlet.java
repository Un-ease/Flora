package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.ProductDAO;
import model.Product;

/**
 * Servlet implementation class ProductDetailsServlet
 */
@WebServlet("/product-details")
public class ProductDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // Get product ID from request parameter
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/products");
                return;
            }
            
            int productId = Integer.parseInt(idParam);
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductById(productId);
            
            if (product == null) {
                // Product not found, redirect to products page
                response.sendRedirect(request.getContextPath() + "/products");
                return;
            }
            
            // Set product as request attribute
            request.setAttribute("product", product);
            
            // Get similar products
            List<Product> allProducts = productDAO.getAllProducts();
            List<Product> similarProducts = allProducts.stream()
                .filter(p -> p.getProductId() != productId)
                .limit(4)
                .toList();
            
            
            
            // Set similar products as request attribute
            request.setAttribute("similarProducts", similarProducts);
            
            request.getRequestDispatcher("/pages/product-details.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            // Invalid ID format
            response.sendRedirect(request.getContextPath() + "/products");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}