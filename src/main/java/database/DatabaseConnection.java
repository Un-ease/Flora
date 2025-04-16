package database;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class DatabaseConnection {
	private final static String databaseName = "flora";
	private final static String username = "root";
	private final static String password = "";
	private final static String jdbcUrl = "jdbc:mysql://localhost:3306/" + databaseName;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Connection con;
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = (Connection) DriverManager.getConnection(jdbcUrl, username, password);
		if (con==null) {
			System.out.println("Failed to connect to Database");
		} else {
			System.out.println("Database Connected SuccessFully");
		}
		return con;
	}

}
