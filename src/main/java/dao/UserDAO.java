package dao;

import java.sql.*;
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
}
