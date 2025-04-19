package controller;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class AddProductController
 */
@WebServlet("/AddProductController")
public class AddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductController() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String productName = request.getParameter("productName");
        String productDescription = request.getParameter("productDescription");
        String priceParam = request.getParameter("price");
        String image = request.getParameter("image");
        String quantityParam = request.getParameter("quantity");

        try {
            // Validate input
            if (productName == null || productName.isEmpty()) {
                throw new IllegalArgumentException("Product name cannot be null or empty.");
            }
            double price = Double.parseDouble(priceParam);
            if (price <= 0) {
                throw new IllegalArgumentException("Price must be greater than zero.");
            }
            int quantity = Integer.parseInt(quantityParam);

            // Create a Product object
            Product product = new Product();
            product.setProductName(productName);
            product.setProductDescription(productDescription);
            product.setPrice(price);
            product.setImage(image);
            product.setQuantity(quantity);

            // Call the DAO to add the product
            ProductDAO productDAO = new ProductDAO();
            boolean isAdded = productDAO.addProduct(product);

            if (isAdded) {
                response.sendRedirect("success.jsp?message=Product added successfully");
            } else {
                response.sendRedirect("error.jsp?message=Failed to add product");
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

}
