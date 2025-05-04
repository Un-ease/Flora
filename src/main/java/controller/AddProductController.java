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
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
/**
 * Servlet implementation class AddProductController
 */
@WebServlet("/AddProductController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10,  maxRequestSize = 1024 * 1024 * 50)   // 10MB
   // 50MB
public class AddProductController extends HttpServlet {
	private static final String UPLOAD_DIR = "uploads";

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get application path
        String appPath = request.getServletContext().getRealPath("");
        String uploadPath = appPath + File.separator + UPLOAD_DIR;
        
        // Create upload folder if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        
        try {
            // Get form data
            String productName = request.getParameter("productName");
            String productDescription = request.getParameter("productDescription");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            // Handle file upload
            Part filePart = request.getPart("image");
            String fileName = System.currentTimeMillis() + "_" + getFileName(filePart);
            String filePath = uploadPath + File.separator + fileName;
            
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
            }
            
            // Create product object
            Product product = new Product();
            product.setProductName(productName);
            product.setProductDescription(productDescription);
            product.setPrice(price);
            product.setQuantity(quantity);
            product.setImage(fileName);
            
            // Add to database
            ProductDAO productDAO = new ProductDAO();
            boolean isAdded = productDAO.addProduct(product);
            
            if (isAdded) {
                request.getSession().setAttribute("successMessage", "Product added successfully!");
            } else {
                request.getSession().setAttribute("errorMessage", "Failed to add product");
            }
            
            response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
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
