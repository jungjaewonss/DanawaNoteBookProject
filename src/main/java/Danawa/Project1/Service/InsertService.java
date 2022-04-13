package Danawa.Project1.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Danawa.Project1.Dao.BoardDAO;
import Danawa.Project1.Dao.MyitemDAO;
import Danawa.Project1.Dao.NoteBookDAO;
import Danawa.Project1.Dao.UserDAO;
import Danawa.Project1.Dto.BoardBean;
import Danawa.Project1.Dto.Member;
import Danawa.Project1.Dto.Myitem;
import Danawa.Project1.Dto.NoteBookInfoBean;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class InsertService {

	@Autowired
	private UserDAO userdao;

	@Autowired
	private BoardDAO boarddao;
	
	@Autowired
	private MyitemDAO mydao;
	
	
	public String searchemail(String nickname) {
	String email =	userdao.searchEmail(nickname);
	
	return email;
	}
	
	public Member CreateMember(Member member) {
		String email = member.getEmail();
		String pwd = member.getPwd();
		String name = member.getName();
		String nickname = member.getNickname();
		String phone = member.getPhone();
		Member members = new Member(email, pwd, name, nickname, phone);
		return members;
	}

	public String Numcheck(int checknum, HttpServletResponse response) throws IOException {

		if (checknum == 1) {
			return "redirect:/member/clicklogin";
		}

		else if (checknum == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Fail Join.')");
			script.println("</script>");
			return "join";

		}
		return "join";

	}

	public Member logincheck(int result, Member member, HttpServletResponse response) throws IOException {
		Member member1 = null;
		if (result == 1) {
			UserDAO userDAO = new UserDAO();
			String nicknames = userDAO.PrintNickname(member.getEmail()).getNickname();
			member1 = new Member(member.getEmail(), nicknames);

			return member1;

		}

		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('fail password.')"); // 비밀번호틀림
			script.println("history.go(-1);"); // 다시로그인페이지로돌려보내기
			script.println("</script>");
		}

		return member1;

	}

	public void checkInfo(int result, HttpServletResponse response) {
		PrintWriter script;
		try {
			script = response.getWriter();
			if (result == 0) {
				script.println("<script>");
				script.println("alert('fail password.')"); // 비밀번호틀림
				script.println("history.go(-1);"); // 다시로그인페이지로돌려보내기
				script.println("</script>");
			} else if (result == -1) {

				script.println("<script>");
				script.println("alert('Fail ID.')");
				script.println("history.go(-1);"); // 다시로그인페이지로돌려보내기
				script.println("</script>");
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void checkpass(String email, String pwd, HttpServletResponse response) {
		UserDAO dao = new UserDAO();
		int num = dao.pwdcheck(email, pwd);
		PrintWriter script;
		try {
			script = response.getWriter();
			if (num < 1) {

				script.println("<script>");
				script.println("alert('fail password.')"); // 비밀번호틀림
				script.println("history.go(-1);"); // 다시로그인페이지로돌려보내기
				script.println("</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public String checkemail(String email) {
		if (email.length() == 0) {
			return "* 이메일을입력해주세요";
		}
		int count = 0;
		for (int i = 0; i < email.length(); i++) {
			if ((email.charAt(i) + "").equals("@")) {
				count++;
			}
		}
		if (count != 1) {
			return "* 올바른형식의이메일을입력해주세요";
		}

		int num = userdao.duplicateEmailCheck(email);

		if (num == 1) {
			return "<b style='color: green;'><i class=\"fa-solid fa-circle-check\"></i> 사용가능한이메일입니다</b>";

		} else
			return "* 사용중인 이메일입니다.*";
	}

	public String checkpwd(String pwd) {

		int eng = 0;
		int num = 0;
		int ch = 0;
		for (int i = 0; i < pwd.length(); i++) {
			if ((pwd.charAt(i)) >= 65 && (pwd.charAt(i)) <= 90 || (pwd.charAt(i) >= 97 && pwd.charAt(i) <= 122)) { // 영문아스키코드처리
				eng++;
			}
			if (pwd.charAt(i) >= 48 && pwd.charAt(i) <= 57) {// 숫자아스키코드처리
				num++;
			}

			if (pwd.charAt(i) >= 33 && pwd.charAt(i) <= 47 || pwd.charAt(i) >= 58 && pwd.charAt(i) <= 64
					|| pwd.charAt(i) >= 91 && pwd.charAt(i) <= 96 || pwd.charAt(i) >= 123 && pwd.charAt(i) <= 126) {
				ch++;
			}
		}

		if ((pwd.length() >= 8 && pwd.length() <= 20)) {

			if (eng > 0 && num > 0 && ch > 0) {
				return "<b style='color: green;'><i class=\"fa-solid fa-circle-check\"></i> 사용가능한 비밀번호</b>";
			}

			if (eng == 0) {
				return "* 영문을포함해주세요";

			}

			if (num == 0) {
				return "* 숫자를포함해주세요";
			}

			if (ch == 0) {
				return "* 특수문자를포함해주세요";
			}
		}

		return "* 8자 ~ 20자 로 입력해주세요";

	}

	public String checkpwd(String pwd, String pwdcheck) {

		if (!(pwd.equals(pwdcheck))) {
			return "* 비밀번호가 일치하지않습니다.";
		}

		return "";
	}

	public String checknickname(String nickname) {
		int num = userdao.duplicateNicknameCheck(nickname);

		if (nickname.length() >= 1 && nickname.length() <= 10) {
			if (num == 1) {
				return "<b style='color: green;'><i class=\"fa-solid fa-circle-check\"></i> 사용가능한 닉네임 입니다</b>";
			}

			else if (num != 1) {
				return "* 이미사용중인 닉네임입니다";
			}
		}

		if (!(nickname.length() >= 1 && nickname.length() <= 10)) {
			return "* 1자 ~ 10자 의 닉네임을 입력해주세요";
		}

		return "";

	}

	public String memberdelete(String email, String pwd, HttpServletResponse response) {

		int num = userdao.DelMember(email, pwd);

		if (num == 1) {
			return "loginAction";
		}

		if (num < 1) {
			log.info("경고문");
			PrintWriter script;
			try {
				script = response.getWriter();
				script.println("<script>");
				script.println("alert('CheckPassword')");
				script.println("history.go(-1);"); // 다시로그인페이지로돌려보내기
				script.println("</script>");
				return null;

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		System.out.println(num);
		log.info("널");
		return null;
	}

	public void nicknamecheck(Member member, HttpServletResponse response) {
		int num = userdao.duplicateNicknameCheck(member.getNickname());
		if (num != 0) {
			PrintWriter script;
			try {
				script = response.getWriter();
				script.println("<script>");
				script.println("alert('CheckPassword')");
				script.println("history.go(-1);"); // 다시로그인페이지로돌려보내기
				script.println("</script>");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	public ArrayList<NoteBookInfoBean> getNoteBook() {
		NoteBookDAO dao = new NoteBookDAO();
		ArrayList<NoteBookInfoBean> beans = dao.getAllNoteBooks();

		return beans;
	}
	
	
	public ArrayList<NoteBookInfoBean> getSamSungNoteBook() {
		NoteBookDAO dao = new NoteBookDAO();
		ArrayList<NoteBookInfoBean> samsungbean = dao.samSungNoteBook();
          
		return samsungbean;
	}
	
	
	public ArrayList<NoteBookInfoBean> getAsusNoteBook() {
		NoteBookDAO dao = new NoteBookDAO();
		ArrayList<NoteBookInfoBean> asusbean = dao.ASUSNoteBook();
          
		return asusbean;
	}
	
	public ArrayList<NoteBookInfoBean> getRenobaNoteBook() {
		NoteBookDAO dao = new NoteBookDAO();
		ArrayList<NoteBookInfoBean> rebobabean = dao.RenobaNoteBook();
		
		return rebobabean;
	}
	
	
	public ArrayList<BoardBean> MyWrite(String email) {
	 ArrayList<BoardBean> bean = boarddao.getmywriter(email);
	 return bean;
	}
	
	
	
	
	public ArrayList<Myitem> myItem(String email){
	ArrayList<Myitem> myitem = mydao.printAllMyItem(email);
	
	return myitem;
	}
	

}
