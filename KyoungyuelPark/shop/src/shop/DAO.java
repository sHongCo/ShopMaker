package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class DAO {
	private Connection conn;
	private ResultSet rs;

	public DAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/barony";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 세션의 로그인 아이디와 일치하는 계정의 정보를 리뷰DB에 입력

	// 리뷰 리스트 출력
	public ArrayList<REVO> getReList() {
		String SQL = "SELECT * FROM 'review'";
		ArrayList<REVO> list = new ArrayList<REVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				REVO revo = new REVO();
				revo.setreNum(rs.getInt(1));
				revo.setreContents(rs.getString(2));
				revo.setreId(rs.getString(3));
				revo.reDate = rs.getTimestamp(4);
				revo.setrePoint(rs.getInt(5));
				list.add(revo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 리뷰 입력
	public void writeReview(REVO revo, String reId, String reContents, Timestamp reDate, int rePoint) {
		String SQL = "INSERT INTO 'shop'.'review' ('reContents', 'reId', 'rePoint') VALUES(?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, reContents);
			pstmt.setString(2, reId);
			pstmt.setInt(3, rePoint);
			pstmt.execute();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
