package re;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import re.REVO;

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

	// 로그인 정보에서 리플달 때 아이디를 따와야 함, 미완성
	public String getreName() {
		return null;
	}

	public ArrayList<REVO> getList(int pageNumber) { // 리뷰글 리스트 출력
		String SQL = "SELECT * FROM review WHERE reNum < ? ORDER BY reNum DESC LIMIT 10";
		ArrayList<REVO> list = new ArrayList<REVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				REVO revo = new REVO();
				revo.setreNum(rs.getInt(1));
				revo.setreContents(rs.getString(2));
				revo.setreName(rs.getString(3));
				revo.setreDate(rs.getString(4));
				list.add(revo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int write(String reContents, String reName, String reDate) { // 리뷰글 입력시 글 번호, 내용, 닉네임, 시간 출력
		String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 0);
			pstmt.setString(2, reContents);
			pstmt.setString(3, reName);
			pstmt.setString(4, reDate);
			pstmt.setInt(5, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
