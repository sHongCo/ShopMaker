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
			String dbPassword = "aaaa";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteWishList(String dnum) {

		String SQL = "DELETE FROM new_table WHERE dnum=?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dnum);
			pstmt.executeUpdate();

		} catch (Exception e) {

		}

	}

	public void orderCheck(OVO ovo, String oId, String oProduct, int oQuan, int oPrice) {

		String SQL = "INSERT INTO barony.`order` (oId, oProduct, oQuan, oPrice) VALUES (?,?,?,?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, oId);
			pstmt.setString(2, oProduct);
			pstmt.setInt(3, oQuan);
			pstmt.setInt(4, oPrice);
			pstmt.execute();
			System.out.println("DAO orderCheck 실행 ");
		} catch (Exception e) {
			System.out.println("DAO orderCheck 에러");
		}

	}

	public ArrayList<OVO> orderOutputData(String did) {

		String SQL = "SELECT oName, oId, oPhone, oAdd, oProduct, oQuan, oPrice, oDate FROM barony.`order` WHERE oId=?";

		ArrayList<OVO> list = new ArrayList<OVO>();
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, did);
			rs = pstmt.executeQuery();

			// Timestamp bDate = resultSet.getTimestamp("bDate");

			while (rs.next()) {
				OVO ovo = new OVO();
				ovo.setoName(rs.getString(1));
				ovo.setoId(rs.getString(2));
				ovo.setoPhone(rs.getString(3));
				ovo.setoAdd(rs.getString(4));
				ovo.setoProduct(rs.getString(5));
				ovo.setoQuan(rs.getInt(6));
				ovo.setoPrice(rs.getInt(7));
				ovo.oDate = rs.getTimestamp("oDate");

				list.add(ovo);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public ArrayList<DVO> outputData(String did) {

		String SQL = "SELECT dnum, dname, dcount, dprice FROM new_table WHERE did=?";

		ArrayList<DVO> list = new ArrayList<DVO>();
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, did);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				DVO dvo = new DVO();
				dvo.setDnum(rs.getInt(1));
				dvo.setDname(rs.getString(2));
				dvo.setDcount(rs.getInt(3));
				dvo.setDprice(rs.getInt(4));
				list.add(dvo);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;

	}

	public ArrayList<PVO> getList(int pageNumber) {
		String SQL = "SELECT * FROM product";// WHERE pNum < ? ORDER BY bbsID DESC LIMIT 10
		ArrayList<PVO> list = new ArrayList<PVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			// pstmt.setInt(1, getNest() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PVO pvo = new PVO();
				pvo.setpNum(rs.getInt(1));
				pvo.setpProduct(rs.getString(2));
				pvo.setpQuan(rs.getInt(3));
				pvo.setpPrice(rs.getInt(4));
				;
				list.add(pvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void inputData(PVO pvo, String dname, int dcount, int dprice, String did) {

		String SQL = "INSERT INTO new_table (dname, dcount, dprice, did) VALUES(?,?,?,?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dname);
			pstmt.setInt(2, dcount);
			pstmt.setInt(3, dprice);
			pstmt.setString(4, did);
			pstmt.execute();
			System.out.println("DAO inputData 실행 ");

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	/*
	 * public PVO getProduct(String pProduct){
	 * 
	 * String SQL = "SELECT pNum, pQuan, pPrice FROM product WHERE pProduct=?"; PVO
	 * pvo = null;
	 * 
	 * try { PreparedStatement pstmt = conn.prepareStatement(SQL);
	 * pstmt.setString(1, pProduct); rs = pstmt.executeQuery();
	 * 
	 * if(rs.next()){ pvo = new PVO(); pvo.setpQuan(1); pvo.setpPrice(2);
	 * 
	 * }
	 * 
	 * } catch (Exception e) { // TODO: handle exception }
	 * 
	 * 
	 * return pvo; }
	 */

	public PVO getNum(int pNum) {

		String SQL = "SELECT pProduct, pQuan, pPrice FROM product WHERE pNum=?";
		PVO pvo = null;

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pNum);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				pvo = new PVO();
				pvo.setpProduct(rs.getString(1));
				pvo.setpQuan(rs.getInt(2));
				pvo.setpPrice(rs.getInt(3));

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		// System.out.println("pvo DAO : " + pvo);

		return pvo;

	}

	/*
	 * 
	 * public String getDate() { String SQL = "SELECT NOW()"; try {
	 * PreparedStatement pstmt = conn.prepareStatement(SQL); rs =
	 * pstmt.executeQuery(); if(rs.next()) { return rs.getString(1); } } catch
	 * (Exception e) { e.printStackTrace(); } return ""; }
	 * 
	 * 
	 * public int write(int pNum, String pProduct, int pQuan ,int pPrice) { String
	 * SQL = "INSERT INTO BBS VALUES(?, ?, ?, ?, ?)"; try { PreparedStatement pstmt
	 * = conn.prepareStatement(SQL); pstmt.setInt(1, pNum); pstmt.setString(2,
	 * pProduct); pstmt.setInt(3, pQuan); pstmt.setInt(4, pPrice); pstmt.setInt(5,
	 * 1); return pstmt.executeUpdate(); } catch (Exception e) {
	 * e.printStackTrace(); } return -1; // 데이터베이스 오류 }
	 */
	public int getNest() {
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

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM product WHERE pNum < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNest() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public PVO getPVO(int pNum) {
		String SQL = "SELECT * FROM product WHERE pNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				PVO pvo = new PVO();
				pvo.setpNum(rs.getInt(1));
				pvo.setpProduct(rs.getString(2));
				pvo.setpQuan(rs.getInt(3));
				pvo.setpPrice(rs.getInt(4));
				;
				return pvo;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(int pNum, String pProduct, int pPrice) {
		String SQL = "UPDATE BBS SET pProduct = ?, pPrice = ? WHERE pNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, pProduct);
			pstmt.setInt(2, pPrice);
			pstmt.setInt(3, pNum);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public int delete(int pNum) {
		String SQL = "UPDATE product SET pNum = 0 WHERE pNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pNum);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류

	}

}
