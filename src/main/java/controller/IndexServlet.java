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
@WebServlet(name = "IndexServlet", urlPatterns = {"/index", ""})  // Changed "/" to "" to be more precise
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
        
        // Handle static resources properly
        if (path.startsWith("/css/") || path.startsWith("/js/") || path.startsWith("/items/") || path.startsWith("/uploads/")) {
            // Extract the resource name from the path
            String resourcePath = "/WEB-INF" + path;  // Adjust this if your resources are elsewhere
            String contentType = getContentTypeForResource(path);
            
            if (contentType != null) {
                response.setContentType(contentType);
                // Get the resource as a stream
                try (java.io.InputStream in = getServletContext().getResourceAsStream(resourcePath)) {
                    if (in == null) {
                        // Resource not found, let the request continue to be processed normally
                        // This might happen if the resource is in a different location
                    } else {
                        // Resource found, stream it to the response
                        java.io.OutputStream out = response.getOutputStream();
                        byte[] buffer = new byte[1024];
                        int bytesRead;
                        while ((bytesRead = in.read(buffer)) != -1) {
                            out.write(buffer, 0, bytesRead);
                        }
                        return; // Important: return after serving the resource
                    }
                }
            }
        }
        
        if (request.getRequestURI().contains("/pages/index.jsp")) {
            response.sendRedirect(request.getContextPath() + "/index");
            return;
        }
        // If we get here, either this is not a static resource request
        // or we couldn't find the requested resource
        try {
            ProductDAO productDAO = new ProductDAO();
            List<Product> featuredProducts = productDAO.getLimitedProducts(4);
            
            request.setAttribute("featuredProducts", featuredProducts);
            request.getRequestDispatcher("/pages/index.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading featured products: " + e.getMessage());
            request.getRequestDispatcher("/pages/index.jsp").forward(request, response);
        }
    }

    // Helper method to determine content type
    private String getContentTypeForResource(String path) {
        if (path.endsWith(".css")) {
            return "text/css";
        } else if (path.endsWith(".js")) {
            return "application/javascript";
        } else if (path.endsWith(".png")) {
            return "image/png";
        } else if (path.endsWith(".jpg") || path.endsWith(".jpeg")) {
            return "image/jpeg";
        } else if (path.endsWith(".gif")) {
            return "image/gif";
        } else if (path.endsWith(".svg")) {
            return "image/svg+xml";
        } else if (path.endsWith(".woff")) {
            return "font/woff";
        } else if (path.endsWith(".woff2")) {
            return "font/woff2";
        } else if (path.endsWith(".ttf")) {
            return "font/ttf";
        }
        return null;
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
