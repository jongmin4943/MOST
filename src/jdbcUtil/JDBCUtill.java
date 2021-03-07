package jdbcUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtill {
	
	private static String url = "";
	private static String user = "root";
	private static String password = "12345";
	
	public static Connection getConnection() {
		try {
			Class.forName("");
			Connection conn = DriverManager.getConnection(url, user, password);
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("드이버 검색 실패");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	public static void close(Connection conn) {
		try {
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			if(rs != null) rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(Statement stmt) {
		try {
			if(stmt != null) stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void close(ResultSet rs,Statement stmt,Connection conn) {
		close(rs);
		close(stmt);
		close(conn);
	}
}
