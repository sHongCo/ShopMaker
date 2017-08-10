package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class UserDAO {

	private static Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
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

	public int login(String uId, String uPass) {
		String SQL = "SELECT uPass FROM user WHERE uId = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, uId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(uPass)) {
					return 1;// 로그인 성공
				} else
					return 0;// 비밀번호 불일치
			}
			return -1;// 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// 데이터 베이스 호출
	}

	public int join(UVO UVO) {

		PreparedStatement pstmt = null;
		String SQL = "insert into user values(?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, UVO.getuId());
			pstmt.setString(2, UVO.getuPass());
			pstmt.setString(3, UVO.getuName());
			pstmt.setString(4, UVO.getuPhone());
			pstmt.setString(5, UVO.getuMail1());
			pstmt.setString(6, UVO.getuMail2());
			pstmt.setString(7, UVO.getuAdd());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	//public boolean idChk(String uId){
		
	//}
}
