package controller;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class RemoveProductController
 */
@WebServlet("/RemoveProductController")
public class RemoveProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the product_ID from the request parameter
        String productIDParam = request.getParameter("productID");

        try {
            // Validate the product_ID
            if (productIDParam == null || productIDParam.isEmpty()) {
                throw new IllegalArgumentException("Product ID cannot be null or empty.");
            }
            int productID = Integer.parseInt(productIDParam);

            // Call the DAO to delete the product
            ProductDAO productDAO = new ProductDAO();
            boolean isDeleted = productDAO.deleteProduct(productID);

            if (isDeleted) {
                response.sendRedirect("/pages/admin-dashboard.jsp");
            } else {
                response.sendRedirect("error.jsp?message=Failed to delete product. Product not found.");
            }
        } catch (IllegalArgumentException e) {
            response.sendRedirect("error.jsp?message=" + e.getMessage());
        } catch (SQLException e) {
            response.sendRedirect("error.jsp?message=Database error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String productIDParam = request.getParameter("productID");

        try {
            // Basic validation
            if (productIDParam == null || productIDParam.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp#products-section");
                return;
            }

            int productID = Integer.parseInt(productIDParam);
            ProductDAO productDAO = new ProductDAO();
            productDAO.deleteProduct(productID);
            
            // Redirect back to products section
            response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp#products-section");
            
        } catch (NumberFormatException | SQLException | ClassNotFoundException e) {
            // On any error, just redirect back
            response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp#products-section");
        }
    }
}
