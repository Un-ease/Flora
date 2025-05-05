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
 * Servlet implementation class AddProductController with web-accessible upload path
 */
@WebServlet("/AddProductController")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class AddProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(AddProductController.class.getName());
    
    // Upload directory should match the one in web.xml
    private static final String UPLOAD_DIRECTORY = "uploads";
       
    public AddProductController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // Get the web application directory - the root of the web application
            String webAppPath = request.getServletContext().getRealPath("/");
            
            // This is the critical part: create a path that will be web-accessible
            String uploadPath = webAppPath + UPLOAD_DIRECTORY;
            
            logger.info("Web application path: " + webAppPath);
            logger.info("Upload path: " + uploadPath);
            
            // Create the directory if it doesn't exist
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                boolean created = uploadDir.mkdirs();
                logger.info("Upload directory created: " + created);
                if (!created) {
                    throw new IOException("Failed to create upload directory: " + uploadPath);
                }
            }
            
            // Check if directory is writable
            if (!uploadDir.canWrite()) {
                logger.warning("Upload directory is not writable: " + uploadPath);
                throw new IOException("Upload directory is not writable: " + uploadPath);
            }
            
            // Get form data
            String productName = request.getParameter("productName");
            String productDescription = request.getParameter("productDescription");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            // Handle file upload
            Part filePart = request.getPart("image");
            
            if (filePart == null || filePart.getSize() == 0) {
                throw new ServletException("No file uploaded or file is empty");
            }
            
            String fileName = getFileName(filePart);
            if (fileName == null || fileName.isEmpty()) {
                throw new ServletException("No file name found");
            }
            
            // Create a safe and unique filename
            String safeName = System.currentTimeMillis() + "_" + 
                              fileName.replaceAll("[^a-zA-Z0-9.-]", "_");
            
            // Complete file path
            Path filePath = Paths.get(uploadPath, safeName);
            logger.info("Saving file to: " + filePath);
            
            // Save the file
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
                logger.info("File saved successfully");
            }
            
            // Create product object
            Product product = new Product();
            product.setProductName(productName);
            product.setProductDescription(productDescription);
            product.setPrice(price);
            product.setQuantity(quantity);
            product.setImage(safeName);  // Store just the filename
            
            // Add to database
            ProductDAO productDAO = new ProductDAO();
            boolean isAdded = productDAO.addProduct(product);
            
            if (isAdded) {
                logger.info("Product added to database successfully");
                request.getSession().setAttribute("successMessage", 
                    "Product added successfully! Image uploaded to: " + UPLOAD_DIRECTORY + "/" + safeName);
            } else {
                logger.warning("Failed to add product to database");
                request.getSession().setAttribute("errorMessage", "Failed to add product to database");
            }
            
            response.sendRedirect(request.getContextPath() + "/pages/admin-dashboard.jsp");
            
        } catch (Exception e) {
            logger.severe("Error in AddProductController: " + e.getMessage());
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