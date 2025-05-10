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
                    String storedHash = rs.getString("password_hash");

                    if (BCrypt.checkpw(password, storedHash)) {
                        return new User(
                            rs.getInt("user_id"),
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
            query = "UPDATE users SET full_name = ?, email = ?, password_hash = ?, role = ? WHERE user_id = ?";
        } else {
            query = "UPDATE users SET full_name = ?, email = ?, role = ? WHERE user_id = ?";
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
                    return new User(
                        rs.getInt("user_id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        null, // Don't retrieve password hash
                        rs.getString("role")
                    );
                }
            }
        }
        return null;
    }
}
