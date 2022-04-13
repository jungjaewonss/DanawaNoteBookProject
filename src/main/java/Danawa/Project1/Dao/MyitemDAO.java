package Danawa.Project1.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import Danawa.Project1.Dto.Myitem;
@Repository
public class MyitemDAO {
	private Connection con ;
	private PreparedStatement pstmt;
	private ResultSet rs ;
	int check = -1;
	
	
	public int getAllMyWriteCount(String email) {
		int count = 0;
		try {
			getCon();
			String sql = "select count(*) from board where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				count = rs.getInt(1);
			}
			con.close();

		} catch (Exception e) {

		}
		return count;
	}
	
	
	public int getAllMyItemCount() {
		int count = 0;
		try {
			getCon();
			String sql = "select count(*) from myitem";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}
			con.close();

		} catch (Exception e) {

		}
		return count;
	}
	
	
	
	public int duplicateMyItem(String subject){
		int check = 0;
		try {		
			getCon();
			String sql = "select * from myitem where subject = ?";
		pstmt = con.prepareStatement(sql);
			pstmt.setString(1, subject);
			check =	pstmt.executeUpdate();
			if(check == 0) {
				System.out.println("관심상품중복없음");
			}
			else if(check > 0) {
				System.out.println("관심상품중복");
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			 try {
				pstmt.close();
				con.close();
				 rs.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			 
		}
		return check;
	}
	
	
	public int insertMyItem(Myitem item) {
	    int duplicateMyitem = 0;  
		try {
		getCon();
		
		String checksql = "select * from myitem where subject = ?";
		pstmt = con.prepareStatement(checksql);
		pstmt.setString(1, item.getSubject());
		duplicateMyitem = pstmt.executeUpdate();
		
		if(duplicateMyitem == 0) {
		String sql = "insert into myitem values(?,?,?,?,?)";
		 pstmt = con.prepareStatement(sql);
		 pstmt.setString(1, item.getEmail());
		 pstmt.setString(2, item.getSubject());
		 pstmt.setString(3, item.getPrice());
		 pstmt.setString(4, item.getImg());
		 pstmt.setString(5, item.getRegdate());
		check =  pstmt.executeUpdate();
		}
		
		else {
			check = -2;
		}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			closeAll();
		}
		return check;
	}
	
	public ArrayList<Myitem> printAllMyItem(String email){
		ArrayList<Myitem> items = new ArrayList<Myitem>();
		try {
			getCon();
			String sql = "select * from  Myitem where email = ? order by regdate desc";
			pstmt  = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Myitem item = new Myitem();
				item.setEmail(rs.getString("email"));
				item.setImg(rs.getString("img"));
				item.setPrice(rs.getString("price"));
				item.setSubject(rs.getString("subject"));
				item.setRegdate(rs.getString("regdate"));
				items.add(item);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			closeAll();
		}
		 return items;
	}
	
	
	
	
	public void getCon() throws SQLException{
		try {

			String driver = "oracle.jdbc.driver.OracleDriver";
			String user = "scott";
			String password = "tiger";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Class.forName(driver); // JDBC 드라이버 객체 생성
			con = DriverManager.getConnection(url, user, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
	
	public void closeAll() {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
