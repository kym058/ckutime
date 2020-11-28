package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	private static UserDAO instance;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public static UserDAO getInstance() {
		if (instance == null) {
			instance = new UserDAO();
		}
		return instance;
	}

	private UserDAO() {
	}

	public void dbConnect() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ckutime?useSSL=false&serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "darakritime";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		int result = 0;
		try {
			dbConnect();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword))
					result = 1; // 로그인 성공
				else
					result = 0; // 비밀번호 불일치
			} else {
				result = -1; // 아이디 없음
			}
		} catch (SQLException e) {
			result = -2; // 데이터베이스 오류
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return result;
	}

	public int join(UserDTO user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?)";
		try {
			dbConnect();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return -1; // 데이터베이스 오류
	}
	
	public void close() {
		if (rs != null) {
			try { rs.close(); } catch (SQLException e) {}
		}
		
		if (pstmt != null) {
			try { pstmt.close(); } catch (SQLException e) {}
		}
		
		if (conn != null) {
			try { conn.close(); } catch (SQLException e) {}
		}
	}

	public static void main(String[] args) {
		getInstance().dbConnect();
	}
}
