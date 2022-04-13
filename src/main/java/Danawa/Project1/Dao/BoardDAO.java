package Danawa.Project1.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import Danawa.Project1.Dto.BoardBean;
import Danawa.Project1.Dto.ReBoardBean;

@Repository

public class BoardDAO {

	// 우선 DAO 클래스는 데이터베이스에 직접접속해서 데이터를가져오는클래스이다
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public BoardDAO() {

	}

	
	public void deleteMyBoard(List<String> num) {
		try {
		   getCon();
		   for(int i = 0 ; i < num.size(); i++) {
		   String sql ="delete from board where num = ?";
		   pstmt = con.prepareStatement(sql);
		  int nums =  Integer.parseInt(num.get(i));
		   pstmt.setInt(1, nums);
		   pstmt.executeQuery();
		   }
		   
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<BoardBean> getAllMyBoard(int start, int end , String email) {
		ArrayList<BoardBean> bean = new ArrayList();

		try {
			getCon();
			// 쿼리준비
			String sql = "select * from (select A.* , Rownum Rnum from (select * from  board where email = ?)A)"
					+ "where Rnum >=? and Rnum <=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			// 데이터 개수가 몇개인지 모르기해 반복문을 이용해서 데이터추출

			while (rs.next()) {
				BoardBean beans = new BoardBean();
				beans.setNum(rs.getInt("num"));
				beans.setWriter(rs.getString("writer"));
				beans.setEmail(rs.getString("email"));
				beans.setSubject(rs.getString("subject"));
				beans.setPassword(rs.getString("password"));
				beans.setReg_date(rs.getDate("reg_date").toString());
				beans.setRef(rs.getInt("ref"));
				beans.setReadcount(rs.getInt("readcount"));
				beans.setCommentcount(rs.getInt("commentcount"));
				beans.setContent(rs.getString("content"));

				bean.add(beans);
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;

	}
	
	
	
	public ArrayList<BoardBean> getmywriter(String email) {
		
		ArrayList<BoardBean> beans = new ArrayList<BoardBean>();
		try {
			getCon();

			String sql = "select * from board where email = ?";
			// 쿼리실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			// 쿼리 실행후 결과를 리턴
			rs = pstmt.executeQuery();

			while (rs.next()) {
				System.out.println("데이터넣는중");
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setEmail(rs.getString("email"));
				bean.setSubject(rs.getString("subject"));
				bean.setPassword(rs.getString("password"));
				bean.setReg_date(rs.getString("reg_date").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setCommentcount(rs.getInt("commentcount"));
				bean.setContent(rs.getString("content"));
				beans.add(bean);
			} 
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return beans;

	}
	
	
	
	public BoardBean getSelectNum(int num) {
		BoardBean bean = new BoardBean();
		try {
			getCon();
			String sql = "select * from board where num = ?";
			// 쿼리실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 쿼리 실행후 결과를 리턴
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println("데이터넣는중");
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setEmail(rs.getString("email"));
				bean.setSubject(rs.getString("subject"));
				bean.setPassword(rs.getString("password"));
				bean.setReg_date(rs.getString("reg_date").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setCommentcount(rs.getInt("commentcount"));
				bean.setContent(rs.getString("content"));
			} else {
				System.out.println("데이터없음");
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;

	}

	public void changeNull() {
		try {
			getCon();
			// UPDATE [테이블명] SET [컬럼명] = ISNULL([컬럼명], '바꾸려는 값')
			String sql = "update board set password = isnull([password], ?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "defualt");
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getAllCount() {
		int count = 0;
		try {
			getCon();
			String sql = "select count(*) from board";
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

	//
	public int deleteBoard(int num, String password) {
		int check = 0;

		try {
			getCon();
			String sql = "delete from board where num = ? and password = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				check = 1;
				System.out.println("삭제완료");

			} // 비밀번호가 맞으면 return 1

			else {
				System.out.println("삭제안됨");// 틀리면 defualt 0
				System.out.println(num);
				System.out.println(password);
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	public int checkWriter(int num) {
		int check = 0;
		int rs = 0;
		try {
			getCon();
			String sql = "select writer from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeUpdate();
			if (rs > 0) {
				check = 1;
			} // 비밀번호가 맞으면 return 1
				// 틀리면 defualt 0
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	public void updateref(BoardBean bean) {
		try {
			getCon();
			String sql = "update board set subject=? , content=? ,  ref = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getRef());
			pstmt.setInt(4, bean.getNum());
			pstmt.executeUpdate();
			con.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateNum(BoardBean bean) {
		try {
			getCon();
			String sql = "update board set num=? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum() - 1);
			pstmt.setInt(2, bean.getNum());

			pstmt.executeUpdate();
			con.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updatelike(int num) {
		try {
			getCon();
			String sql = "update board set likes=likes+1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			con.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateBoard(BoardBean bean) {
		try {
			getCon();
			String sql = "update board set subject=? , content=? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
			pstmt.executeUpdate();
			con.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updatecommentcount(int ref) {
		try {
			getCon();
			String sql = "update board set commentcount= commentcount+1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);

			pstmt.executeUpdate();
			con.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 업데이트와 삭제시 비밀번호인증할시 비밀번호를 얻어오는 메소드
	public String getPass(int num) {
		String pass = "";
		try {
			getCon();
			String sql = "select password from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pass = rs.getString("password");
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return pass;
	}

	// boardupdate 와 boardDel
	public BoardBean getOneUpdateBoard(int num) {
		BoardBean bean = new BoardBean();
		try {

			getCon();

			String sql = "select * from board where num = ?";
			// 쿼리실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 쿼리 실행후 결과를 리턴
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setEmail(rs.getString("email"));
				bean.setSubject(rs.getString("subject"));
				bean.setPassword(rs.getString("password"));
				bean.setReg_date(rs.getString("reg_date").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setContent(rs.getString("content"));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;

	}

	// 답변글이 저장되는 메소드
	public void reWriteBoard(BoardBean bean) {
		// 부모글그룹과 글레벨 글스텝을 읽어드림
		int ref = bean.getRef();

		try {
			getCon();
			////////////////////// 핵심 코드 /////////////
			// 1 부모글보다 큰 likes 의 값을 전부 1씩 ㅣ증가시켜줌
//			String levelsql = "update board set likes = likes+1 where ref =? and likes > ? "; //이미있는 relevel 애들을 +1 씩증가해두고 자기자신은 밑에서 1증가
//			
//			pstmt = con.prepareStatement(levelsql);
//			pstmt.setInt(1, ref);

//			pstmt.executeUpdate();
			// 답변글 데이터를 저장
			String sql = "insert into board values(board_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref); // 부모의ref 값을그대로넣어줌

			pstmt.setString(8, bean.getContent());

			pstmt.executeUpdate();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public BoardBean getOneMyBoard(int num) {
		BoardBean bean = new BoardBean();
		try {
			getCon();
			String sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setEmail(rs.getString("email"));
				bean.setSubject(rs.getString("subject"));
				bean.setPassword(rs.getString("password"));
				bean.setReg_date(rs.getString("reg_date").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setContent(rs.getString("content"));
			}
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// 하나의 게시글을 리턴하는 메소드
	public BoardBean getOneBoard(int num) {
		BoardBean bean = new BoardBean();
		try {
			getCon();

			String readsql = "update board set readcount = readcount + 1 where num = ? ";
			pstmt = con.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			String sql = "select * from board where num = ?";
			// 쿼리실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 쿼리 실행후 결과를 리턴
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println("데이터넣는중");
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setEmail(rs.getString("email"));
				bean.setSubject(rs.getString("subject"));
				bean.setPassword(rs.getString("password"));
				bean.setReg_date(rs.getString("reg_date").toString());
				bean.setRef(rs.getInt("ref"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setContent(rs.getString("content"));
			} else {
				System.out.println("데이터없음");
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;

	}

	// 모든 게시글을 리턴해주는 메소드
	public ArrayList<BoardBean> getAllBoard(int start, int end) {
		ArrayList<BoardBean> bean = new ArrayList();

		try {
			getCon();
			// 쿼리준비
			String sql = "select * from (select A.* , Rownum Rnum from (select * from  board order by num desc )A)"
					+ "where Rnum >=? and Rnum <=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			// 데이터 개수가 몇개인지 모르기해 반복문을 이용해서 데이터추출

			while (rs.next()) {
				BoardBean beans = new BoardBean();
				beans.setNum(rs.getInt("num"));
				beans.setWriter(rs.getString("writer"));
				beans.setEmail(rs.getString("email"));
				beans.setSubject(rs.getString("subject"));
				beans.setPassword(rs.getString("password"));
				beans.setReg_date(rs.getDate("reg_date").toString());
				beans.setRef(rs.getInt("ref"));
				beans.setReadcount(rs.getInt("readcount"));
				beans.setCommentcount(rs.getInt("commentcount"));
				beans.setContent(rs.getString("content"));

				bean.add(beans);
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;

	}

	public ArrayList<BoardBean> getAllBoards() {
		ArrayList<BoardBean> bean = new ArrayList();

		try {

			getCon();
			// 쿼리준비
			String sql = "select * from board order by num desc";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			// 데이터 개수가 몇개인지 모르기해 반복문을 이용해서 데이터추출

			while (rs.next()) {

				BoardBean beans = new BoardBean();
				beans.setNum(rs.getInt("num"));
				beans.setWriter(rs.getString("writer"));
				beans.setEmail(rs.getString("email"));
				beans.setSubject(rs.getString("subject"));
				beans.setPassword(rs.getString("password"));
				beans.setReg_date(rs.getDate("reg_date").toString());
				beans.setRef(rs.getInt("ref"));
				beans.setReadcount(rs.getInt("readcount"));
				beans.setCommentcount(rs.getInt("commentcount"));
				beans.setContent(rs.getString("content"));

				bean.add(beans);
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;

	}

//	public ArrayList<BoardBean> getAllBoard(int start , int end)  {
//		ArrayList<BoardBean> bean = new ArrayList();
//	 
//		try {
//			
//			 getCon();
//			 //쿼리준비
//			 String sql = "select * from (select A.* , Rownum Rnum from (select * from board order by num desc)A) "
//			 		+ "where Rnum >=? and Rnum <=?";
//
//			 String sql = "select * from  board order by num desc";
//			
//			 
//			 //			
//			 pstmt = con.prepareStatement(sql);
////			
//			 pstmt.setInt(1, start);
//     		 pstmt.setInt(2, end);
//      		 rs = pstmt.executeQuery();
//			 //데이터 개수가 몇개인지 모르기해 반복문을 이용해서 데이터추출
//
//			 while(rs.next()) {
//					
//				 BoardBean beans = new BoardBean();
//			    beans.setNum(rs.getInt(1)); 
//				beans.setWriter(rs.getString(2));
//				beans.setEmail(rs.getString(3));
//				beans.setSubject(rs.getString(4));
//				beans.setPassword(rs.getString(5));
//				beans.setReg_date(rs.getDate(6).toString());
//				beans.setRef(rs.getInt(7));
//			    beans.setReadcount(rs.getInt(8));
//			    beans.setCommentcount(rs.getInt(9));
//				beans.setContent(rs.getString(10));
//
//			   bean.add(beans);
//			 }
//			 con.close();
//			 
//		}
//		catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("열이름틀림");
//		}
//		
//		return bean;
//		
//		
//		
//	}

	public ArrayList<ReBoardBean> getAllReBoard(int mainnum) {
		ArrayList<ReBoardBean> bean = new ArrayList();

		try {

			// 쿼리준비
			getCon();
			String sql = "select * from rewrite  where ref= ? order by num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mainnum);
//			 pstmt.setInt(1, start);
//			 pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			// 데이터 개수가 몇개인지 모르기해 반복문을 이용해서 데이터추출

			while (rs.next()) {
				ReBoardBean beans = new ReBoardBean();
				beans.setNum(rs.getInt("num"));
				beans.setWriter(rs.getString("writer"));
				beans.setReg_date(rs.getDate("reg_date").toString());
				beans.setContent(rs.getString("content"));
				beans.setRef(rs.getInt("ref"));
				bean.add(beans);
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;

	}

	public int printref(BoardBean bean) {
		int count = 0;

		try {
			getCon();
			// 쿼리준비
			String sql = "select ref from board where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			rs = pstmt.executeQuery();
			// 데이터 개수가 몇개인지 모르기해 반복문을 이용해서 데이터추출

			if (rs.next()) {
				count = rs.getInt(1);
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	public int getReCount(int mainnum) {
		int count = 0;

		try {
			getCon();
			// 쿼리준비
			String sql = "select count(ref) from rewrite where ref =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mainnum);
//			 pstmt.setInt(1, start);
//			 pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			// 데이터 개수가 몇개인지 모르기해 반복문을 이용해서 데이터추출

			if (rs.next()) {
				count = rs.getInt(1);
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;

	}

	public  void insertBoard(BoardBean bean , String email) throws SQLException {
		// 빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		 ArrayList<BoardBean> insertbean = new  ArrayList<BoardBean>();
	
		int ref = 0; // 글그룹을 의미 = 쿼리를 실행시켜서 가장큰 ref 값을가져온후 +1 을해줌
		int commentcount = 0;
		try {
			getCon();
			// 실제로 게시글 전체값을 테이블에 저장
			String sql = "insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,0,?,?,0,0)";
			getCon();
			pstmt = con.prepareStatement(sql);

			// ?표의 값 매핑
			pstmt.setString(1, bean.getWriter()); //
			pstmt.setString(2, email); //
			pstmt.setString(3, bean.getSubject());//
			pstmt.setString(4, bean.getPassword());//
			pstmt.setInt(5, ref);//
			pstmt.setInt(6, commentcount);//
			pstmt.setString(7, bean.getContent());//

			// 쿼리를 실행하시오
			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				
				System.out.println("있음");
				
			} else {
				System.out.println("없음");
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void insertReWriteBoard(ReBoardBean bean) throws SQLException {
		// 빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		try {
			getCon();

			// 실제로 게시글 전체값을 테이블에 저장
			String sql = "insert into rewrite values(reboard_seq.nextval,?,sysdate,?,?)";

			pstmt = con.prepareStatement(sql);

			// ?표의 값 매핑

			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum()); // 해당 게시물의 num 이 rewrite테이블의 ref 값으로 들어간
			// 쿼리를 실행하시오
			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 데이터 베이스의 커넥션풀을 사용하도록 설정하는 메소드
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
