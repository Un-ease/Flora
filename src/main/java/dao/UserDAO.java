package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DatabaseConnection;
import model.User;

public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public UserDAO() throws ClassNotFoundException, SQLException {
		this.conn = DatabaseConnection.getConnection();
	}
	
	public boolean register(User user) {
		boolean isUserRegistered = false;
		String query = "INSERT INTO users (fullName, email, password, role) VALUES ( ?, ?, ?, ?)";
		if (conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, user.getFullName());
				ps.setString(2, user.getEmail());
				ps.setString(3, user.getPassword());
				ps.setString(4, "Customer"); // Hardcode role as "Customer" for all registration
				if(ps.executeUpdate() > 0) {
					isUserRegistered = true;
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return isUserRegistered;
	}
	
	//Get User Log info
	public User login(String email, String password) {
		User user = null;
		String query = "SELECT * FROM users WHERE email = ? AND password = ?";
		if(conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, email);
				ps.setString(2, password);
				ResultSet userSet = ps.executeQuery();
				
				if(userSet.next()) {
					user = new User(
							userSet.getInt("userId"),
							userSet.getString("fullName"),
							userSet.getString("email"),
							userSet.getString("password"),
							userSet.getString("role")
							);
				}
				
			} catch (SQLException e ) {
				e.printStackTrace();
			}
		}
		return user;
	}
}
