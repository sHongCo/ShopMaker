package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import shop.REVO;

public class DAO {

	private Connection conn;
	private ResultSet rs;

	public DAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/shop";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNext() { //리뷰글 자동으로 번호증가
		String SQL = "SELECT * FROM product ORDER BY pNum DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public String getDate() { //리뷰글 작성시  시스템 시간 제공
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}

	public ArrayList<REVO> getList(int pageNumber) { //리뷰글 리스트 출력
		String SQL = "SELECT * FROM review WHERE reNum < ? ORDER BY reNum DESC LIMIT 10";
		ArrayList<REVO> list = new ArrayList<REVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				REVO revo = new REVO();
				revo.setreNum(rs.getInt(1));
				revo.setreTitle(rs.getString(2));
				revo.setreContents(rs.getString(3));
				revo.setreName(rs.getString(4));
				revo.setreDate(rs.getString(5));
				revo.setrePoint(rs.getInt(6));
				list.add(revo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int write(String reContents, String uId) { //리뷰글 입력시 글 번호, 내용, 아이디, 시간 출력
		String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, reContents);
			pstmt.setString(3, uId);
			pstmt.setString(4, getDate());
			pstmt.setInt(5, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
