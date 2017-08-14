
/**
 * @author 강민지
 * @date 17.08.10
 * @File DAO.java
 * 
 * DB 명령클래스
 */

package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;


public class DAO {
	private Connection conn;
	private ResultSet rs;
	
	private static DAO instance = new DAO();
    
    public static DAO getDao() {
        return instance;
    }

 
    
    public DAO() {
    	try {
    		String dbURL = "jdbc:mysql://localhost:3306/shop?" ;//+ "useUnicode=true&characterEncoding=euc-kr";
    		String dbID = "root";
    		String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    
    
    
    
    
    
    
    
    
    
public ArrayList<OVO> orderCheck(String oId) {
		
		
		String sql = "SELECT * from `order` where oId = ?";
		ArrayList<OVO> alist = new ArrayList<OVO>();
		PreparedStatement pstmt=null;
		
		System.out.println("시작");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, oId);
			rs = pstmt.executeQuery();
			System.out.println("조회");
			while (rs.next()) {
				OVO ovo = new OVO();
				ovo.setoNum(rs.getInt(1));
				ovo.setoName(rs.getString(2));
				ovo.setoId(rs.getString(3));
				ovo.setoPhone(rs.getString(4));
				ovo.setoAdd(rs.getString(5));
				ovo.setoProduct(rs.getString(6));
				ovo.setoQuan(rs.getInt(7));
				ovo.setoDate(rs.getTimestamp(8));
				ovo.setoPrice(rs.getInt(9));
				alist.add(ovo);
			}
		} catch (Exception e) {
		} 
		return alist;
	}

	public ArrayList<OVO> orderOutputData(String did, Timestamp oDate) {

		System.out.println("come");
		String sql = "SELECT * from `order` where oId = ? and oDate = ?";

		ArrayList<OVO> list = new ArrayList<OVO>();
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, did);
		    pstmt.setTimestamp(2, oDate);
			System.out.println(did);
		    System.out.println(oDate);

			rs = pstmt.executeQuery();
			System.out.println(oDate);
			// Timestamp bDate = resultSet.getTimestamp("bDate");

			while (rs.next()) {
				OVO ovo = new OVO();
				ovo.setoNum(rs.getInt(1));
				ovo.setoName(rs.getString(2));
				ovo.setoId(rs.getString(3));
				ovo.setoPhone(rs.getString(4));
				ovo.setoAdd(rs.getString(5));
				ovo.setoProduct(rs.getString(6));
				ovo.setoQuan(rs.getInt(7));
				ovo.setoDate(rs.getTimestamp(8));
				ovo.setoPrice(rs.getInt(9));
				list.add(ovo);
			}

		} catch (Exception e) {
			System.out.println("XX");

			// TODO: handle exception
		}

		return list;
	}
	
	//////////////////////////////////////////////////////////
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 // 리뷰 리스트 출력
 	public ArrayList<REVO> getReList() {
 		String SQL = "SELECT * FROM review";
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
 	public int writeReview(String reContents, String reId, int rePoint) {
 		String SQL = "INSERT INTO review (reContents, reId, rePoint) VALUES(?,?,?)";
 		try {
 			PreparedStatement pstmt = conn.prepareStatement(SQL);
 			pstmt.setString(1, reContents);
 			pstmt.setString(2, reId);
 			pstmt.setInt(3, rePoint);
 			pstmt.execute();
 		} catch (Exception e) {
 			// TODO: handle exception
 		}
 		return -1;
 	}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

	public String pasing(String data) {
		try {
			data = new String(data.getBytes("8859_1"), "euc-kr");
		} catch (Exception e) {
		}

		return data;
	}

	public void deleteWishList(String dnum) {

		String SQL = "DELETE FROM pretend WHERE dnum=?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dnum);
			pstmt.executeUpdate();

		} catch (Exception e) {

		}

	}

/*	public void orderCheck(OVO ovo, String oId, String oProduct, int oQuan, int oPrice) {

		String SQL = "INSERT INTO `shop`.`order` (oId, oProduct, oQuan, oPrice) VALUES (?,?,?,?)";

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
*/
/*	public ArrayList<OVO> orderOutputData(String did) {

		String SQL = "SELECT oName, oId, oPhone, oAdd, oProduct, oQuan, oPrice, oDate FROM `shop`.`order` WHERE oId=?";

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
				ovo.setoDate(rs.getTimestamp("oDate"));

				list.add(ovo);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}*/

	public ArrayList<DVO> outputData(String did) {

		String SQL = "SELECT dnum, dname, dcount, dprice FROM pretend WHERE did=?";

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
		String SQL = "SELECT * FROM product";// WHERE pNum < ? ORDER BY bbsID
												// DESC LIMIT 10
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

		String SQL = "INSERT INTO pretend (dname, dcount, dprice, did) VALUES(?,?,?,?)";

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
	 * String SQL = "SELECT pNum, pQuan, pPrice FROM product WHERE pProduct=?";
	 * PVO pvo = null;
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
	 * public int write(int pNum, String pProduct, int pQuan ,int pPrice) {
	 * String SQL = "INSERT INTO BBS VALUES(?, ?, ?, ?, ?)"; try {
	 * PreparedStatement pstmt = conn.prepareStatement(SQL); pstmt.setInt(1,
	 * pNum); pstmt.setString(2, pProduct); pstmt.setInt(3, pQuan);
	 * pstmt.setInt(4, pPrice); pstmt.setInt(5, 1); return
	 * pstmt.executeUpdate(); } catch (Exception e) { e.printStackTrace(); }
	 * return -1; // 데이터베이스 오류 }
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
	
/********** 주문 페이지 ********/	
	//최종 주문하기
	public void insertOrder(OVO vo) {
		
		PreparedStatement pstmt = null;
			try {
			String sql = "INSERT INTO `shop`.`order` ( `oName`, `oId`, `oPhone`, `oAdd`, `oProduct`, `oQuan`, `oDate`, `oPrice`) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pasing(vo.getoName()));
			pstmt.setString(2, vo.getoId());
			pstmt.setString(3, vo.getoPhone());
			pstmt.setString(4, pasing(vo.getoAdd()));
			pstmt.setString(5, pasing(vo.getoProduct()));
			pstmt.setInt(6, vo.getoQuan());
			pstmt.setTimestamp(7, vo.getoDate());
			pstmt.setInt(8, vo.getoPrice());
            pstmt.executeUpdate();
           
            sql= "SELECT max(oNum) from `order`;";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
            	vo.setoNum(rs.getInt(1));
            }
            
		} catch (Exception e) {
		
		}/* finally {
			System.out.println(vo.getoDate());
			DBClose.close(conn, pstmt);
		}*/
	}

	//선택한 상품 불러오기(바로주문하기)
	public PVO getProduct(int pNum) {
		PreparedStatement pstmt = null;
	
		PVO pvo = new PVO();
		try {
			String sql = "SELECT * from product where pNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pNum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pvo.setpNum(rs.getInt(1));
				pvo.setpProduct(rs.getString(2));
				pvo.setpQuan(rs.getInt(3));
				pvo.setpPrice(rs.getInt(4));
				System.out.println("끝!");				
			}
		} catch (Exception e) {
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return pvo;
	}
	
	//해당 id장바구니 불러오기.(장바구니로 주문하기 첫 화면)
	public ArrayList<OVO> getProductList(String uid) {
	
		PreparedStatement pstmt = null;
		ArrayList<OVO> alist = new ArrayList<OVO>();
		System.out.println("시작");
		try {
			String sql = "SELECT `dname`,`dcount`,`dprice` from `pretend` where did=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			System.out.println("조회");
			while (rs.next()) {
				OVO ovo = new OVO();
				ovo.setoProduct(rs.getString(1));
				ovo.setoQuan(rs.getInt(2));
				ovo.setoPrice(rs.getInt(3));
				alist.add(ovo);
			}
		} catch (Exception e) {
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return alist;
	}
	
/********** 주문결과창 페이지 ********/	
	//주문 결과불러오기 
	public OVO getOrder(int oNum) {
		
		PreparedStatement pstmt = null;
	
		OVO ovo = new OVO();
		try {
			String sql = "SELECT * from `order` where oNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oNum);
			
			System.out.println("시작"+oNum);
			rs = pstmt.executeQuery();
			System.out.println("전송");
			while (rs.next()) {				
				ovo.setoNum(rs.getInt(1));
				ovo.setoName(rs.getString(2));
				ovo.setoId(rs.getString(3));
				ovo.setoPhone(rs.getString(4));
				ovo.setoAdd(rs.getString(5));
				ovo.setoProduct(rs.getString(6));
				ovo.setoQuan(rs.getInt(7));
				ovo.setoDate(rs.getTimestamp(8));
				ovo.setoPrice(rs.getInt(9));
				System.out.println("완료");
			}
		} catch (Exception e) {
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return ovo;
	}
	
/********** 관리자 페이지 ********/	
	//주문목록
	public ArrayList<OVO> getOrderList() {
		PreparedStatement pstmt = null;
		ArrayList<OVO> alist = new ArrayList<OVO>();
		System.out.println("시작");
		try {
			String sql = "SELECT * from `order`";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			System.out.println("조회");
			while (rs.next()) {
				OVO ovo = new OVO();
				ovo.setoNum(rs.getInt(1));
				ovo.setoName(rs.getString(2));
				ovo.setoId(rs.getString(3));
				ovo.setoPhone(rs.getString(4));
				ovo.setoAdd(rs.getString(5));
				ovo.setoProduct(rs.getString(6));
				ovo.setoQuan(rs.getInt(7));
				ovo.setoDate(rs.getTimestamp(8));
				ovo.setoPrice(rs.getInt(9));
				alist.add(ovo);
			}
		} catch (Exception e) {
		} 
		return alist;
	}
	
	//상품목록
	public ArrayList<PVO> getGoodList(){
		String SQL = "SELECT * FROM product";
		ArrayList<PVO> list = new ArrayList<PVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PVO pvo = new PVO();
				pvo.setpNum(rs.getInt(1));
				pvo.setpProduct(rs.getString(2));
				pvo.setpQuan(rs.getInt(3));
				pvo.setpPrice(rs.getInt(4));;
				list.add(pvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	//상품 지우기
	public void deleteProduct(int pNum) {
	
		PreparedStatement pstmt = null;
	
		try {
			String sql = "DELETE FROM `shop`.`product` WHERE `pNum`=?;";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, pNum);
            pstmt.executeUpdate();
                    
		} catch (Exception e) {
			System.out.println("오류!");
		} finally {
			System.out.println("성공!");
			DBClose.close(conn, pstmt);
		}
	}

	//상품재고 수정
	public void modifyProduct(PVO vo) {
	
		PreparedStatement pstmt = null;

		try {
			String sql = "UPDATE `shop`.`product` SET pQuan=?, pPrice=? WHERE pNum=?;";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, vo.getpQuan());
			pstmt.setInt(2, vo.getpPrice());
			pstmt.setInt(3, vo.getpNum());
            pstmt.executeUpdate();           
                    
		} catch (Exception e) {
			System.out.println("오류!");
		} finally {
			System.out.println("성공!");
			DBClose.close(conn, pstmt);
		}
	}
	//상품 추가
	public void insertProduct(PVO vo) {
	
		PreparedStatement pstmt = null;
	
		try {
			String sql = "insert into `shop`.`product` ( `pProduct`, `pQuan`, `pPrice`) VALUES ( ?, ?, ? );";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getpProduct());
			pstmt.setInt(2, vo.getpQuan());
			pstmt.setInt(3, vo.getpPrice());
            pstmt.executeUpdate();           
                    
		} catch (Exception e) {
			System.out.println("오류!");
		} finally {
			System.out.println("성공!");
			DBClose.close(conn, pstmt);
		}
	}

}
