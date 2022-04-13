package Danawa.Project1.controller;



import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import Danawa.Project1.Dao.UserDAO;
import Danawa.Project1.Dto.BoardBean;
import Danawa.Project1.Dto.Member;
import Danawa.Project1.Dto.Myitem;
import Danawa.Project1.Dto.NoteBookInfoBean;
import Danawa.Project1.Dto.Paging;
import Danawa.Project1.Service.InsertService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {
            
	
	@Autowired
	 private UserDAO userDAO ; 
	@Autowired
      private  InsertService insertservice; //서비스객체생성         
       
    
    @GetMapping("/clicklogin")
	public String Clicklogin() {
		System.out.println("clicklogin");
		return "loginAction";
	}
	
	@GetMapping("/clickinsert")
	public String Clickinsert() {
		
		return "join";
	}
	
	
	@GetMapping("/clickdelete")
	public String Clickdelete(String email , Model model) {
		model.addAttribute("email", email);
		return "user_del";
	}
	
	@GetMapping("/danawamain")
	public String danawamain() {
		
		return "loginmain";
	}
	@GetMapping("/mypage")
	public String mypage(String nickname,HttpSession session , Model model , String pageNum) {
        
	 
		
		String email =	insertservice.searchemail(nickname); //닉네임으로 이메일찾아오기
		 ArrayList<BoardBean> mywrite = insertservice.MyWrite(email);
		
		 
		 model.addAttribute("mywritesize", mywrite.size());
		 model.addAttribute("myitemcount", mywrite);
			Paging.getPagingElement(model, pageNum, mywrite , 5);


		return "Mypage";
	}

	
	
	@GetMapping("newsmain")
	public String newsmain() {
		return "NewsMain";
	}
    

	@PostMapping("/insert")
	public String MemberJoin(@ModelAttribute Member member , HttpServletResponse response) throws IOException {
		  log.info("insertController");
	
		 
		  Member members = insertservice.CreateMember(member); //비밀번호확인을뺀 멤버 객체 
		  int checknum = userDAO.Insert(members); //인설트를성공할시 보낸곳과 실패할시 보내는곳을 구별
		  
		         insertservice.nicknamecheck(member,response);
		  return insertservice.Numcheck(checknum, response);
	}
	
	
	@PostMapping("/login")
	public String Memberlogin(@ModelAttribute Member member , HttpServletResponse response , Model model , HttpSession session) throws SQLException, IOException, ServletException {
	 log.info("login");
	
	int	result = userDAO.login(member.getEmail(), member.getPwd());
	 if(result == 1) {
		 Member member1 =   insertservice.logincheck(result, member, response);
		 session.setAttribute("email", member1.getEmail());
		 session.setAttribute("nickname", member1.getNickname()); //세션값 이메일로부여  
         
		
		 ArrayList<NoteBookInfoBean> beans = insertservice.getNoteBook();
		 ArrayList<NoteBookInfoBean> samsung = insertservice.getSamSungNoteBook();
		 ArrayList<NoteBookInfoBean> asus = insertservice.getAsusNoteBook();
		 ArrayList<NoteBookInfoBean> renoba = insertservice.getRenobaNoteBook();
		 
		 
		 
		 session.setAttribute("notebookbean", beans);
		 session.setAttribute("samsung", samsung);
		 session.setAttribute("asus", asus);
		 session.setAttribute("renoba", renoba);
		 
		 return "loginmain";
	 }
	
		 insertservice.checkInfo(result, response); // 아이디비밀번호틀리면 돌려보내기
		 return null;

	}
	
	
	
	
    @GetMapping("/getlogin")
	public String getlogin() throws SQLException, IOException, ServletException {
	 log.info("login");	 
		 return "loginmain";
	 }
	
	
	
	
	@PostMapping("/delete")
	public String Memberdelete(String email , String pwd , HttpServletResponse response) {
	
		 
		return insertservice.memberdelete(email, pwd, response);
	}
	
	@GetMapping("/histroybackdelete")
	public String histroyback(String email , Model model) {
		model.addAttribute("email", email);
		return "user_update";
	}
	
	
	@GetMapping("/checkingPwd")
	public String Membermodiffy(@RequestParam String email ,@RequestParam String nickname,  Model model) {
		log.info("nickname={}" ,  nickname);
		model.addAttribute("email", email);
		model.addAttribute("nickname", nickname);
		
		return "pass_chk";
	}
	
	
	@PostMapping("/updateinfo")
	public String updateinfo(@RequestParam String email , @RequestParam String pwd , @RequestParam String nickname , HttpServletResponse response , Model model) {
		log.info("email={}", email , "pwd={}" , pwd , "nickname={}" , nickname);
		
		
	int num = userDAO.pwdcheck(email, pwd);
	if(num == 1) {
		model.addAttribute("email", email);
		 return "user_update";
	}
	
	else {
		
		insertservice.checkpass(email, pwd, response);
		return null;
	}
		
	  

	}
	
	 @PostMapping("/modify")
	 public String modify(String email , String nickname , String pwd , HttpServletResponse response , Model model) {
		log.info("email={}" , email , "nickname={}", nickname , "pwd={}", pwd);
		 Member member = new Member(email , pwd , nickname);
		int num =  userDAO.UpDate(member);
		 if(num == 1) {
			 model.addAttribute("emailNick", member);
			 return "loginAction";
		 }
		 else {
			 insertservice.checkpass(email, pwd, response);
			 return null;
		 }
		 
	 }
	
	 @GetMapping("/myitem")
	 public String myItem(HttpSession session , Model model , String pageNum) {
		 //String email =	insertservice.searchemail(nickname);
			/*
			 * session.setAttribute( "email", email); session.setAttribute( "nickname",
			 * nickname);
			 */
		       
		
		String email =  (String) session.getAttribute("email");
		ArrayList<Myitem> myitem = insertservice.myItem(email);
		
		 model.addAttribute("myitemcount", myitem.size());
		Paging.getPagingElement(model, pageNum, myitem , 5);
		
		 
		 System.out.println("email" + email); 
		
	
		
		 return "MypageProductOfInterest";
	 }
	
	 
		/*
		 * @GetMapping("/pagenum") public String pagenum( HttpSession session) {
		 * //session.setAttribute("pageNum", pageNum); // 세션값 이메일로부여
		 * 
		 * return "MypageProductOfInterest"; }
		 */
	
	 
	 @GetMapping("/mypagenum")
	 public String mypagenum(String pageNum ,  HttpSession session , Model model) {
			/* session.setAttribute("pageNum", pageNum); */
			
		 ArrayList<BoardBean> mywrite = insertservice.MyWrite(pageNum);
		 model.addAttribute("mywritesize", mywrite.size());
		 model.addAttribute("myitemcount", mywrite);
			Paging.getPagingElement(model, pageNum, mywrite , 5);
			
		 
		 
		 return "Mypage";
		}
	
	
	 
	 
	
	@ResponseBody
	@PostMapping("/ajaxlogin")
	public String duplicateEmail(@RequestParam String email) {
	
	 return insertservice.checkemail(email); //사용가능한이메일인지체크해서 경고문반환
	}

	
	@ResponseBody
	@PostMapping("/ajaxpwd")
	public String duplicatepwd(@RequestParam String pwd) {	
	 return insertservice.checkpwd(pwd); //사용가능한이메일인지체크해서 경고문반환
	
	}
	
	@ResponseBody
	@PostMapping("/ajaxcheckpwd")
	public String checkpwd(@RequestParam String pwdcheck , @RequestParam String pwd) {	 
	 return insertservice.checkpwd(pwd , pwdcheck); //사용가능한이메일인지체크해서 경고문반환
	
	}
	
	@ResponseBody
	@PostMapping("/ajaxchecknickname")
	public String checkNickname(@RequestParam String nickname) {	 
	 return insertservice.checknickname(nickname); //사용가능한이메일인지체크해서 경고문반환
	
	}
	
	
	
	
}

