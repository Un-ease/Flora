package controller;

import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Product;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.logging.Logger;
/**
 * Servlet implementation class EditProductController
 */
@WebServlet("/EditProductController")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10,
	    maxRequestSize = 1024 * 1024 * 50
	    )
public class EditProductController extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	    private static final Logger logger = Logger.getLogger(EditProductController.class.getName());
	    private static final String UPLOAD_DIRECTORY = "uploads";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductController() {
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
		// TODO Auto-generated method stub
		try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            String productDescription = request.getParameter("productDescription");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            // Get existing product to preserve image if new one isn't uploaded
            ProductDAO productDAO = new ProductDAO();
            Product existingProduct = productDAO.getProductById(productId);
            if (existingProduct == null) {
                throw new ServletException("Product not found with ID: " + productId);
            }
            
            String imageName = existingProduct.getImage();
            
            // Handle file upload if present
            Part filePart = request.getPart("image");
            if (filePart != null && filePart.getSize() > 0) {
                // New file uploaded - process it
                String webAppPath = request.getServletContext().getRealPath("/");
                String uploadPath = webAppPath + UPLOAD_DIRECTORY;
                
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
                
                String fileName = getFileName(filePart);
                String safeName = System.currentTimeMillis() + "_" + 
                                  fileName.replaceAll("[^a-zA-Z0-9.-]", "_");
                
                Path filePath = Paths.get(uploadPath, safeName);
                try (InputStream fileContent = filePart.getInputStream()) {
                    Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
                }
                
                imageName = safeName;
            }
            
            // Update product
            Product product = new Product();
            product.setProductId(productId);
            product.setProductName(productName);
            product.setProductDescription(productDescription);
            product.setPrice(price);
            product.setQuantity(quantity);
            product.setImage(imageName);
            
            boolean isUpdated = productDAO.updateProduct(product);
            
            if (isUpdated) {
                request.getSession().setAttribute("successMessage", "Product updated successfully!");
            } else {
                request.getSession().setAttribute("errorMessage", "Failed to update product");
            }
            
            response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp");
            
        } catch (Exception e) {
            logger.severe("Error in EditProductController: " + e.getMessage());
            request.getSession().setAttribute("errorMessage", "Error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp");
        }
    }


	private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 2, token.length() - 1);
            }
        }
        return "";
    }
}
