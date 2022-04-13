package Danawa.Project1.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import Danawa.Project1.Dto.Member;

@Repository
public class UserDAO {

	// DELETE FROM 테이블명
	// WHERE

	private Connection conn ;
	private PreparedStatement pstmt;
	private ResultSet rs ;

	public String searchEmail(String nickname) {
		String email = "";
		try {
			getCon();
			String sql = "select uemail from member where unick = ?";
			pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, nickname);
	        rs = pstmt.executeQuery(); 
        
          if(rs.next()) {
        	  email= rs.getString("uemail");
          }
          
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return email;
	}
	
	
	public int duplicateNicknameCheck(String nickname) {

		int rs = 0;
		try {

			getCon();

			String sql = "SELECT * FROM member WHERE unick = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeUpdate();

			if (rs == 1) {
				return -1;
			}

			else if (rs == 0) {
				return 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();

		}
		return -2;
	}

	public int duplicatePhoneCheck(String phone) {
		String sql = "SELECT * FROM member WHERE uphone = ?";
		int rs = 0;
		try {
			getCon();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phone);
			rs = pstmt.executeUpdate();

			if (rs == 1) {
				return -1;
			}

			else if (rs == 0) {
				return 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return -2;
	}

	public int duplicateEmailCheck(String email) {

		int rs = 0;
		try {
			getCon();
			String sql = "SELECT * FROM member WHERE uemail = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeUpdate();

			if (rs == 1) {
				return -1;
			}

			else if (rs == 0) {
				return 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();

		}
		return -2;
	}

	public int pwdcheck(String email, String pwd) {
		int rs = 0;
		try {
			getCon();
			String sql = "SELECT * FROM member WHERE upwd=? and uemail =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, email);
			rs = pstmt.executeUpdate();

			if (rs == 1) {
				return 1;
			}

			else if (rs == 0) {
				return -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();

		}
		return -2;
	}

	public int DelMember(String email, String pwd) {

		int rs = 0;

		try {
			String SQL = "delete from member where uemail = ? and upwd = ?";
			getCon();
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, email);
			pstmt.setString(2, pwd);

			// pstmt.setString(1, userEmail);
			rs = pstmt.executeUpdate();

			if (rs == 1) {
				return 1; // 정상수정완료
			} else if (rs == 0) {
				return 0; // 해당아이디없음
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			closeAll();
		}
		return -1; // 데이터베이스오류
	}

	public Member PrintEmailname(String email) {
		Member member = new Member();
		List list = new ArrayList();
		String SQL = "select uemail from member where uemail = ? ";
		String emails = null;

		try {

			getCon();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);

			// pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				member = new Member(rs.getString(1));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return member;

	}

	public int UpDate(Member member) {
		String SQL = "UPDATE member SET upwd=?, unick=? WHERE uemail=?";

		int rs = 0;

		try {
			getCon();
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, member.getPwd());
			pstmt.setString(2, member.getNickname());
			pstmt.setString(3, member.getEmail());

			// pstmt.setString(1, userEmail);
			rs = pstmt.executeUpdate();

			if (rs == 1) {
				return 1; // 정상수정완료
			} else if (rs == 0) {
				return 0; // 해당아이디없음
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			closeAll();
		}
		return -1; // 데이터베이스오류
	}

	// ==============================================================================
	public Member PrintNickname(String email) {
		Member member = new Member();
		List list = new ArrayList();
		String SQL = "select unick from member where uemail = ? ";
		String nickname = null;

		try {
			getCon();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);

			// pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				member = new Member(rs.getString(1));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return member;

	}

	// ===================================================================================
	public int Insert(Member member) {

		int rs = 0;

		try {
			getCon();
			String SQL = "insert into member values(?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getNickname());
			pstmt.setString(5, member.getPhone());

			// pstmt.setString(1, userEmail);
			rs = pstmt.executeUpdate();
			if (rs > 0) {
				return 1; // 정상적으로 insert 되면 1 return
			} else
				return 0;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}

		return -2;// 데이터베이스오류
	}

	// ==================================================================================
	public int login(String userEmail, String userPassword) throws SQLException {
		String SQL = "select upwd  from member where uemail = ? ";
		try {

			getCon();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery(); // 같은비밀번호가있으면 비밀번호가들어가있음

			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인성공
				} else {
					return 0; // 비밀번호가틀림
				}
			}
			return -1; // 아이디가없음

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();

		}
		return -2; // 데이터베이스오류
	}

	public void getCon() throws SQLException {
		try {

			String driver = "oracle.jdbc.driver.OracleDriver";
			String user = "scott";
			String password = "tiger";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Class.forName(driver); // JDBC 드라이버 객체 생성
			conn = DriverManager.getConnection(url, user, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
	
	public void closeAll() {
		if(conn != null) {
			try {
				conn.close();
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
