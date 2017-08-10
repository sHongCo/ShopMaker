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
	
	public int getNext() { //����� �ڵ����� ��ȣ����
		String SQL = "SELECT * FROM product ORDER BY pNum DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // ù ��° �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	public String getDate() { //����� �ۼ���  �ý��� �ð� ����
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
		return ""; // �����ͺ��̽� ����
	}

	public ArrayList<REVO> getList(int pageNumber) { //����� ����Ʈ ���
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
	
	public int write(String reContents, String uId) { //����� �Է½� �� ��ȣ, ����, ���̵�, �ð� ���
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
		return -1; // �����ͺ��̽� ����
	}
}
