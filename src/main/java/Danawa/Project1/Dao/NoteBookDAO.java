package Danawa.Project1.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import Danawa.Project1.Dto.Mallinfo;
import Danawa.Project1.Dto.NoteBookInfoBean;

@Repository
public class NoteBookDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
   

	
	public ArrayList<NoteBookInfoBean> samSungNoteBook() {
		ArrayList<NoteBookInfoBean> samsungs = new  ArrayList<NoteBookInfoBean>();
		try {
			getCon();
			String sql = "select * from notebookinfo where company = ?";
			pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "삼성전자");	
          rs =  pstmt.executeQuery();
            while(rs.next()) {
            	NoteBookInfoBean samsung =  new NoteBookInfoBean();
            	samsung.setImg(rs.getString("img"));
            	samsung.setSubject(rs.getString("subject"));
            	samsungs.add(samsung);
            }
            pstmt.close();
			con.close();
			rs.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return samsungs;
	}
	
	
	
	public ArrayList<NoteBookInfoBean> ASUSNoteBook() {
		ArrayList<NoteBookInfoBean> ASUSs = new  ArrayList<NoteBookInfoBean>();
		try {
			getCon();
			String sql = "select * from notebookinfo where company = ?";
			pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "ASUS");	
          rs =  pstmt.executeQuery();
            while(rs.next()) {
            	NoteBookInfoBean ASUS =  new NoteBookInfoBean();
            	ASUS.setImg(rs.getString("img"));
            	ASUS.setSubject(rs.getString("subject"));
            	ASUSs.add(ASUS);
            }
            pstmt.close();
			con.close();
			rs.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return ASUSs;
	}
	
	
	public ArrayList<NoteBookInfoBean> RenobaNoteBook() {
		ArrayList<NoteBookInfoBean>  Renobas = new  ArrayList<NoteBookInfoBean>();
		try {
			getCon();
			String sql = "select * from notebookinfo where company=?";
			pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "레노버");	
          rs =  pstmt.executeQuery();
            while(rs.next()) {
            	NoteBookInfoBean Renoba =  new NoteBookInfoBean();
            	Renoba.setImg(rs.getString("img"));
            	Renoba.setSubject(rs.getString("subject"));
            	Renobas.add(Renoba);
            }
            pstmt.close();
			con.close();
			rs.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return Renobas;
	}
	
	

	public void deleteAllMyProduct(List<String> subjects) {
		
		 try {
			 getCon();
			 for(int i = 0 ; i <  subjects.size() ; i++) {
			 String sql = "delete myitem where subject = ?";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, subjects.get(i));
			 pstmt.executeQuery();
		
			 }
		 }catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public NoteBookInfoBean OneNotebook(String subject) {
		NoteBookInfoBean notebook = new  NoteBookInfoBean();
		try {
			getCon();
			String sql = "select * from notebookinfo where subject = ?";
			
			 pstmt =  con.prepareStatement(sql);
			 pstmt.setString(1, subject);
			 rs = pstmt.executeQuery();
			 
			     if(rs.next()) {
				 notebook.setSubject(rs.getString("subject"));
				 notebook.setScreeninch(rs.getString("screeninch"));
				 notebook.setWeight(rs.getString("weight"));
				 notebook.setCompany(rs.getString("company"));
				 notebook.setPrice(rs.getString("price"));
				 notebook.setImg(rs.getString("img"));
				 notebook.setMemory(rs.getString("memory"));
				 notebook.setUsb(rs.getString("usb"));
				 notebook.setPurpose(rs.getString("purpose"));
				 notebook.setThickness(rs.getString("thickness"));
				 notebook.setAllinfo(rs.getString("allinfo"));
			     }
			 
			 pstmt.close();
			 con.close();
			 rs.close();
			 
		}catch (Exception e) {
		   e.printStackTrace();
		}
		
		return notebook;
	}
	
	
	
	
	
	public Mallinfo searchMall(NoteBookInfoBean bean) {
		 Mallinfo mall = new Mallinfo();
		 try {
			
			 getCon();
			 String sql = "select * from mallinfo where modelnum = ?";
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, bean.getSubject());
			rs =  pstmt.executeQuery();
			 
			while(rs.next()) {
				
				mall.setModelnum(rs.getString("modelnum"));
				mall.setLink(rs.getString("link"));
				mall.setLogo(rs.getString("logo"));
				mall.setPrice(rs.getString("price"));
				mall.setShipping(rs.getString("shipping"));
				mall.setMallname(rs.getString("mallname"));
			}
			
			 pstmt.close();
			 con.close();
			 rs.close();
			
			
		 }catch (Exception e) {
		 e.printStackTrace();
		 }
		 
		 
		return  mall;
	}
	
	
	public ArrayList<Mallinfo> mallinfo1(String subject) {
		 ArrayList<Mallinfo> mallinfo = new ArrayList<Mallinfo>();
		 try {
			 getCon();
			 String sql = "select * from  mallinfo where modelnum = ? order by price";
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, subject);
			
			rs =  pstmt.executeQuery();
			 
			while(rs.next()) {
				Mallinfo mall = new Mallinfo();
				mall.setModelnum(rs.getString("modelnum"));
				mall.setLink(rs.getString("link"));
				mall.setLogo(rs.getString("logo"));
				mall.setPrice(rs.getString("price"));
				mall.setShipping(rs.getString("shipping"));
				mall.setMallname(rs.getString("mallname"));
				mallinfo.add(mall);
			}
			
			 pstmt.close();
			 con.close();
			 rs.close();
			
		 }catch (Exception e) {
		 e.printStackTrace();
		 }
		 
		 
		return  mallinfo;
	}
	
	
	
	public ArrayList<Mallinfo> mallinfo(Mallinfo bean) {
		 ArrayList<Mallinfo> mallinfo = new ArrayList<Mallinfo>();
		 try {
			 getCon();
			 String sql = "select * from  mallinfo where modelnum = ? order by ? desc";
			 
			 pstmt = con.prepareStatement(sql);
			 System.out.println(bean);
			 pstmt.setString(1, bean.getModelnum());
			 pstmt.setInt(2,  Integer.parseInt(bean.getPrice()));
			rs =  pstmt.executeQuery();
			 
			while(rs.next()) {
				Mallinfo mall = new Mallinfo();
				mall.setModelnum(rs.getString("modelnum"));
				mall.setLink(rs.getString("link"));
				mall.setLogo(rs.getString("logo"));
				mall.setPrice(rs.getString("price"));
				mall.setShipping(rs.getString("shipping"));
				mall.setMallname(rs.getString("mallname"));
				mallinfo.add(mall);
			}
			 pstmt.close();
			 con.close();
			 rs.close();
			
		 }catch (Exception e) {
		 e.printStackTrace();
		 }
		 
		 
		return  mallinfo;
	}
	
	

	public ArrayList<NoteBookInfoBean> getAllNoteBook(int start, int end) {
		ArrayList<NoteBookInfoBean> bean = new ArrayList<>();

		try {
			getCon();
			// 쿼리준비
			String sql = "select * from (select A.* , Rownum Rnum from (select * from  notebookinfo)A)"
					+ "where Rnum >=? and Rnum <=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			// 데이터 개수가 몇개인지 모르기해 반복문을 이용해서 데이터추출

			while (rs.next()) {
				NoteBookInfoBean beanss = new NoteBookInfoBean();
				beanss.setSubject(rs.getString("subject"));
				beanss.setScreeninch(rs.getString("screeninch"));
				beanss.setWeight(rs.getString("weight"));
				beanss.setCompany(rs.getString("company"));
				beanss.setPrice(rs.getString("price"));
				beanss.setImg(rs.getString("img"));
				beanss.setMemory(rs.getString("memory"));
				beanss.setUsb(rs.getString("usb"));
				beanss.setPurpose(rs.getString("purpose"));
				beanss.setThickness(rs.getString("thickness"));
				beanss.setAllinfo(rs.getString("allinfo"));

				bean.add(beanss);
			}
			 pstmt.close();
			 con.close();
			 rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;

	}
	
	

	public int getAllCount() {
		int count = 0;
		try {
			getCon();
			String sql = "select count(*) from notebookinfo";
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

	public ArrayList<NoteBookInfoBean> getAllNoteBooks() {
		ArrayList<NoteBookInfoBean> beans = new ArrayList<NoteBookInfoBean>();
		try {
			getCon();
			String sql = "select * from notebookinfo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				NoteBookInfoBean beanss = new NoteBookInfoBean();
				beanss.setSubject(rs.getString("subject"));
				beanss.setScreeninch(rs.getString("screeninch"));
				beanss.setWeight(rs.getString("weight"));
				beanss.setCompany(rs.getString("company"));
				beanss.setPrice(rs.getString("price"));
				beanss.setImg(rs.getString("img"));
				beanss.setMemory(rs.getString("memory"));
				beanss.setUsb(rs.getString("usb"));
				beanss.setPurpose(rs.getString("purpose"));
				beanss.setThickness(rs.getString("thickness"));
				beanss.setAllinfo(rs.getString("allinfo"));

				beans.add(beanss);
			}
			 pstmt.close();
			 con.close();
			 rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return beans;
	}

	public void getCon() throws SQLException {
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

}
