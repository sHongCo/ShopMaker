package shop;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	public Connection getConnection(){
		
		String url = "jdbc:mysql://localhost:3306/barony?" + "useUnicode=true&characterEncoding=euc-kr";
		String id = "root";
		String pass = "1234";
		
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,id,pass);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
}
