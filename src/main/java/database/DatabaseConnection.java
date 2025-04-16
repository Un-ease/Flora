package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private final static String databaseName = "flora";
    private final static String username = "root";
    private final static String password = "";
    private final static String jdbcUrl = "jdbc:mysql://localhost:3306/" + databaseName + 
                                        "?useSSL=false&serverTimezone=UTC";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            // Modern JDBC drivers auto-load, no need for Class.forName()
            Connection con = DriverManager.getConnection(jdbcUrl, username, password);
            System.out.println("Database Connected Successfully");
            return con;
        } catch (SQLException e) {
            System.err.println("Failed to connect to Database");
            throw e; // Re-throw to let caller handle
        }
    }

    // Proper main method for testing
    public static void main(String[] args) throws ClassNotFoundException {
        try {
            Connection con = getConnection();
            if (con != null) {
                System.out.println("Connection test successful!");
                con.close(); // Always close connections
            }
        } catch (SQLException e) {
            System.err.println("Database connection failed!");
            e.printStackTrace();
        }
    }
}