package dao;

import model.WishListItem;
import model.Product;
import java.sql.*;
import java.util.*;

import database.DatabaseConnection;

public class WishListDAO {
    private Connection conn;
        
    public WishListDAO() throws SQLException, ClassNotFoundException {
        this.conn = DatabaseConnection.getConnection();
    }

    public boolean addToWishlist(long userId, long productId) throws SQLException {
        // First check if the item is already in the wishlist
        if (isProductInWishlist(userId, productId)) {
            return false; // Already exists
        }
        
        String sql = "INSERT INTO wishlist (user_id, product_id) VALUES (?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, userId);
            ps.setLong(2, productId);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean removeFromWishlist(long userId, long productId) throws SQLException {
        String sql = "DELETE FROM wishlist WHERE user_id = ? AND product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, userId);
            ps.setLong(2, productId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }

    public List<WishListItem> getWishlistByUser(int userId) throws SQLException {
        String sql = """
            SELECT w.*, p.product_name, p.price, p.image
            FROM wishlist w
            JOIN products p ON w.product_id = p.product_id
            WHERE w.user_id = ?
            """;
        List<WishListItem> list = new ArrayList<>();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                	System.out.println("Wishlist item found: productId=" + rs.getInt("product_id") + ", productName=" + rs.getString("product_name")+" image:"+rs.getString("image"));
                    WishListItem item = new WishListItem();
                    item.setWishlistId(rs.getInt("wishlist_id"));
                    item.setUserId((int) userId);
                    item.setProductId(rs.getInt("product_id"));

                    Product product = new Product();
                    product.setProductId(rs.getInt("product_id"));
                    product.setProductName(rs.getString("product_name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImage(rs.getString("image"));

                    item.setProduct(product);
                    list.add(item);
                }
            }
        }
        System.out.println("Total wishlist items fetched: " + list.size());
        return list;
    }
    
    public boolean isProductInWishlist(long userId, long productId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM wishlist WHERE user_id = ? AND product_id = ?";
        
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, userId);
            stmt.setLong(2, productId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
}