package dao;

import model.CartItem;
import model.Product;
import database.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    private Connection conn;
    
    public CartDAO() throws SQLException, ClassNotFoundException {
        this.conn = DatabaseConnection.getConnection();
    }
    
    public boolean addItemToCart(int userId, int productId, int quantity) throws SQLException {
        // Check if item already exists in cart
        if (isItemInCart(userId, productId)) {
            return updateItemQuantity(userId, productId, quantity, true); // Increment existing quantity
        }
        
        String query = "INSERT INTO cart_items (user_id, product_id, quantity) VALUES (?, ?, ?)";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, quantity);
            
            return ps.executeUpdate() > 0;
        }
    }
    
    public boolean removeItemFromCart(int userId, int productId) throws SQLException {
        String query = "DELETE FROM cart_items WHERE user_id = ? AND product_id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            
            return ps.executeUpdate() > 0;
        }
    }
    
    public boolean updateItemQuantity(int userId, int productId, int quantity, boolean increment) throws SQLException {
        String query;
        if (increment) {
            query = "UPDATE cart_items SET quantity = quantity + ? WHERE user_id = ? AND product_id = ?";
        } else {
            query = "UPDATE cart_items SET quantity = ? WHERE user_id = ? AND product_id = ?";
        }
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, quantity);
            ps.setInt(2, userId);
            ps.setInt(3, productId);
            
            return ps.executeUpdate() > 0;
        }
    }
    
    public List<CartItem> getCartItems(int userId) throws SQLException {
        List<CartItem> cartItems = new ArrayList<>();
        String query = "SELECT ci.*, p.* FROM cart_items ci " +
                       "JOIN products p ON ci.product_id = p.product_id " +
                       "WHERE ci.user_id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CartItem item = new CartItem();
                    item.setCartItemId(rs.getInt("cart_item_id"));
                    item.setUserId(rs.getInt("user_id"));
                    item.setProductId(rs.getInt("product_id"));
                    item.setQuantity(rs.getInt("quantity"));
                    
                    // Set product details
                    Product product = new Product();
                    product.setProductId(rs.getInt("product_id"));
                    product.setProductName(rs.getString("product_name"));
                    product.setProductDescription(rs.getString("product_description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImage(rs.getString("image"));
                    product.setQuantity(rs.getInt("stock_quantity"));
                    product.setSold(rs.getInt("sold"));
                    
                    item.setProduct(product);
                    cartItems.add(item);
                }
            }
        }
        return cartItems;
    }
    
    public boolean clearCart(int userId) throws SQLException {
        String query = "DELETE FROM cart_items WHERE user_id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            
            return ps.executeUpdate() > 0;
        }
    }
    
    public boolean isItemInCart(int userId, int productId) throws SQLException {
        String query = "SELECT COUNT(*) FROM cart_items WHERE user_id = ? AND product_id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
    
    public int getCartItemCount(int userId) throws SQLException {
        String query = "SELECT SUM(quantity) FROM cart_items WHERE user_id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }
    
    
    public boolean updateCartItem(int userId, int productId, int quantity) throws SQLException {
        String query = "UPDATE cart_items SET quantity = ? WHERE user_id = ? AND product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, quantity);
            ps.setInt(2, userId);
            ps.setInt(3, productId);
            return ps.executeUpdate() > 0;
        }
    }


}