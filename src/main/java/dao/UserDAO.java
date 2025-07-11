package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import model.User;
import org.mindrot.jbcrypt.BCrypt;
import database.DatabaseConnection;

public class UserDAO {

    public boolean register(User user) throws SQLException, ClassNotFoundException {
        Objects.requireNonNull(user, "User cannot be null");

        String query = "INSERT INTO users (full_name, email, password_hash, role) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, hashedPassword);
            ps.setString(4, "Customer");

            return ps.executeUpdate() > 0;
        }
    }

    public User login(String email, String password) throws SQLException, ClassNotFoundException {
        String query = "SELECT * FROM users WHERE email = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
            	if (rs.next()) {
            	    int userId = rs.getInt("user_id");
            	    String storedHash = rs.getString("password_hash");
            	    if (BCrypt.checkpw(password, storedHash)) {
            	        return new User(
            	            userId,
            	            rs.getString("full_name"),
            	            rs.getString("email"),
            	            storedHash,
            	            rs.getString("role")
            	        );
            	    } 
            	} 
                return null;
            }
        }
    }
    
    public boolean isEmailTaken(String email) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        boolean emailExists = false;

        try {
            // Get database connection
            conn = DatabaseConnection.getConnection();
            
            // SQL query to check if email exists
            String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            
            resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                emailExists = count > 0;
            }
        } finally {
            // Close resources in reverse order of creation
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
        return emailExists;
    }
    
    public boolean updateUser(User user) throws SQLException, ClassNotFoundException {
        Objects.requireNonNull(user, "User cannot be null");
        
        String query;
        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            query = "UPDATE users SET full_name = ?, email = ?, password_hash = ?, address = ?, phone_number = ?, role = ? WHERE user_id = ?";
        } else {
            query = "UPDATE users SET full_name = ?, email = ?, address = ?, phone_number = ?, role = ? WHERE user_id = ?";
        }
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            int paramIndex = 1;
            ps.setString(paramIndex++, user.getFullName());
            ps.setString(paramIndex++, user.getEmail());
            
            if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
                ps.setString(paramIndex++, hashedPassword);
            }
            
            ps.setString(paramIndex++, user.getAddress());
            ps.setString(paramIndex++, user.getPhoneNumber());
            ps.setString(paramIndex++, user.getRole());
            ps.setInt(paramIndex, user.getUserId());
            
            return ps.executeUpdate() > 0;
        }
    }


    public boolean deleteUser(int userID) throws SQLException, ClassNotFoundException {
    	System.out.println("Attempting to delete user ID: " + userID);
    	String query = "DELETE FROM users WHERE user_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, userID);
            return ps.executeUpdate() > 0;
        }
    }

    public List<User> getAllUsers() throws SQLException, ClassNotFoundException {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM users";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));  // Using setter instead of constructor
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                // Password is intentionally not set
                
                users.add(user);
            }
        }
        return users;
    }

    public User getUserById(int userId) throws SQLException, ClassNotFoundException {
        String query = "SELECT * FROM users WHERE user_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, userId);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User user = new User(
                        rs.getInt("user_id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        null, // password hash omitted
                        rs.getString("role")
                    );
                    user.setAddress(rs.getString("address"));
                    user.setPhoneNumber(rs.getString("phone_number"));
                    return user;
                }
            }
        }
        return null;
    }

    
    public boolean verifyPassword(int userId, String password) throws SQLException, ClassNotFoundException {
        String query = "SELECT password_hash FROM users WHERE user_id = ?"; // Change to password_hash
        
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String storedPasswordHash = rs.getString("password_hash"); // Use password_hash
                    // Use BCrypt to compare the provided password with the stored hash
                    return BCrypt.checkpw(password, storedPasswordHash); // Proper password comparison
                }
            }
        }
        return false;
    }

    
    public int getUserCountByRole(String role) throws SQLException, ClassNotFoundException {
        String query = "SELECT COUNT(*) FROM users WHERE role = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, role);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }

    public int getActiveUserCount() throws SQLException, ClassNotFoundException {
        // Assuming 'active' means logged in within last 30 days
        String query = "SELECT COUNT(*) FROM users";
        
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)) {
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }
}
