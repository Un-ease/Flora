package dao;

import java.sql.*;
import java.util.Objects;
import model.Product;
import database.DatabaseConnection;


public class ProductDAO {
	private Connection conn;
	
	public ProductDAO() throws SQLException, ClassNotFoundException{
		this.conn = DatabaseConnection.getConnection();
	}

	public boolean addProduct(Product product) throws SQLException {
	    if (product == null) {
	        throw new IllegalArgumentException("Product cannot be null");
	    }

	    if (conn == null) {
	        throw new SQLException("Database connection is not established.");
	    }

	    boolean isRowInserted = false;
	    String query = "INSERT INTO products (product_name, product_description, price, image, stock_quantity, sold) VALUES (?, ?, ?, ?, ?, ?)";

	    // Validate input data
	    if (product.getProductName() == null || product.getProductName().isEmpty()) {
	        throw new IllegalArgumentException("Product name cannot be null or empty");
	    }
	    if (product.getPrice() <= 0) {
	        throw new IllegalArgumentException("Price must be greater than zero");
	    }

	    try (PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setString(1, product.getProductName());
	        ps.setString(2, product.getProductDescription());
	        ps.setDouble(3, product.getPrice());
	        ps.setString(4, product.getImage());
	        ps.setInt(5, product.getQuantity());
	        ps.setInt(6, 0); // Hardcoded sold value

	        int rows = ps.executeUpdate();
	        if (rows > 0) {
	            isRowInserted = true;
	        }
	    } catch (SQLException e) {
	        System.out.println("SQL Error: " + e.getMessage());
	        e.printStackTrace();
	        throw new RuntimeException("Database operation failed", e);
	    }

	    return isRowInserted;
	}
}
