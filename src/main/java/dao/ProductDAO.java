package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import model.Product;
import database.DatabaseConnection;

public class ProductDAO {
    private Connection conn;
    
    public ProductDAO() throws SQLException, ClassNotFoundException {
        this.conn = DatabaseConnection.getConnection();
    }

    public boolean addProduct(Product product) throws SQLException {
        Objects.requireNonNull(product, "Product cannot be null");
        
        String query = "INSERT INTO Products (product_name, product_description, price, image, stock_quantity, sold) " +
                       "VALUES (?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getProductDescription());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getImage());
            ps.setInt(5, product.getQuantity());
            ps.setInt(6, 0); // Initial sold count
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("Error adding product: " + e.getMessage());
            throw e;
        }
    }
    
    public boolean deleteProduct(int productID) throws SQLException {
        String query = "DELETE FROM Products WHERE product_ID = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, productID);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            throw e;
        }
    }
     
    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>(); // Changed to List<Product>
        String query = "SELECT * FROM Products";
        
        try (PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setProductDescription(rs.getString("product_description"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                product.setQuantity(rs.getInt("stock_quantity"));
                product.setSold(rs.getInt("sold"));
                
                products.add(product);
            }
        }
        return products;
    }
    
    public List<Product> getLimitedProducts(int limit) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products LIMIT ?";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setProductDescription(rs.getString("product_description"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                product.setQuantity(rs.getInt("stock_quantity"));
                product.setSold(rs.getInt("sold"));
                
                products.add(product);
            }
        }
        return products;
    }
    
    
}