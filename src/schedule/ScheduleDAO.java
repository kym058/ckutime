package schedule;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import lecture.Lecture;

public class ScheduleDAO {

	private Connection conn;
	private ResultSet rs;

	public ScheduleDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ckutime";
			String dbID = "root";
			String dbPassword = "darakritime";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getTime(String lectureID) {
		Connection conn = null;
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ckutime?useSSL=false&serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "darakritime";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String SQL = "SELECT lectureTime FROM LECTURE WHERE lectureID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, lectureID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "";
	}	
	
	public ArrayList<Lecture> getList(String userID) {
		Connection conn = null;
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ckutime?useSSL=false&serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "darakritime";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ArrayList<Lecture> lectureList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			lectureList = new ArrayList<Lecture>();
			String SQL = "SELECT lectureTime, lectureName, lectureClassroom, LECTURE.lectureID, lectureCredit FROM LECTURE, SCHEDULE, USER WHERE USER.userID = ? AND USER.userID = SCHEDULE.userID AND LECTURE.lectureID = SCHEDULE.lectureID";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Lecture lecture = new Lecture();
				lecture.setLectureTime(rs.getString(1));
				lecture.setLectureName(rs.getString(2));
				lecture.setLectureClassroom(rs.getString(3));
				lecture.setLectureID(Integer.parseInt(rs.getString(4)));
				lecture.setLectureCredit(rs.getString(5));
				lectureList.add(lecture);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return lectureList;
	}
	
	public ArrayList<String> getArea4(String area3) {
		Connection conn = null;
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ckutime?useSSL=false&serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "darakritime";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ArrayList<String> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			list = new ArrayList<String>();
			String SQL = "SELECT DISTINCT area4Name FROM LECTURE WHERE area3Name = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, area3);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String temp = rs.getString(1);
				list.add(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public int delete(String userID, String lectureID) {
		Connection conn = null;
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ckutime?useSSL=false&serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "darakritime";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		try {
			String SQL = "DELETE FROM SCHEDULE WHERE userID = ? AND lectureID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, lectureID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public int allDelete(String userID) {
		Connection conn = null;
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ckutime?useSSL=false&serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "darakritime";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		try {
			String SQL = "DELETE FROM SCHEDULE WHERE userID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public int getNumber(String lectureID) {
		Connection conn = null;
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ckutime?useSSL=false&serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "darakritime";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		try {
			String SQL = "SELECT COUNT(LECTURE.lectureID) FROM LECTURE, SCHEDULE WHERE LECTURE.lectureID = ? AND LECTURE.lectureID = SCHEDULE.lectureID";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, lectureID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public ArrayList<Lecture> getLectureList(String collegeType, String area3, String area4, String day, String credit, String search) {
		if(area4.equals("전체")) {
			area4 = "";
		}
		if(day.equals("전체")) {
			day = "";
		}
		if(credit.equals("전체")) {
			credit = "";
		}
		Connection conn = null;
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ckutime?useSSL=false&serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "darakritime";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ArrayList<Lecture> lectureList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			lectureList = new ArrayList<Lecture>();
			String SQL = "SELECT * FROM LECTURE WHERE collegeType = ? AND area3Name = ? AND area4Name LIKE ? AND lectureTime LIKE ? AND lectureCredit LIKE ? AND lectureName LIKE ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, collegeType);
			pstmt.setString(2, area3);
			pstmt.setString(3, "%" + area4 + "%");
			pstmt.setString(4, "%" + day + "%");
			pstmt.setString(5, "%" + credit + "%");
			pstmt.setString(6, "%" + search + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Lecture lecture = new Lecture();
				lecture.setLectureID(Integer.parseInt(rs.getString("lectureID")));
				lecture.setLectureGrade(rs.getString("lectureGrade"));
				lecture.setLectureName(rs.getString("lectureName"));
				lecture.setLectureProfessor(rs.getString("lectureProfessor"));
				lecture.setLectureCredit(rs.getString("lectureCredit"));
				lecture.setLectureDivide(rs.getString("lectureDivide"));
				lecture.setLectureLimit(rs.getString("lectureLimit"));
				lecture.setLectureTime(rs.getString("lectureTime"));
				lectureList.add(lecture);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return lectureList;
	}
	
	public int insert(String userID, String lectureID) {
		Connection conn = null;
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ckutime?useSSL=false&serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "darakritime";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		try {
			String SQL = "INSERT INTO SCHEDULE VALUES (?, ?)";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, lectureID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public int getPeople() {
		Connection conn = null;
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ckutime?useSSL=false&serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "darakritime";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		try {
			String SQL = "SELECT COUNT(userID) FROM (SELECT DISTINCT USER.userID FROM USER, SCHEDULE WHERE USER.userID = SCHEDULE.userID) AS TEMP";
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}	
	
}
