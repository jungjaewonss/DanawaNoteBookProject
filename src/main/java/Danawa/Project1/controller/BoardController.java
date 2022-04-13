package Danawa.Project1.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Danawa.Project1.Dao.BoardDAO;
import Danawa.Project1.Dto.BoardBean;
import Danawa.Project1.Dto.Paging;
import Danawa.Project1.Dto.ReBoardBean;
import Danawa.Project1.Service.BoardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")


public class BoardController {

	@Autowired private BoardDAO boardDAO;
	@Autowired private BoardService boardService;
	

	@GetMapping("/mainlist")
	public String mainboard(Model model) {
		System.out.println("mainlist");
		ArrayList<BoardBean> boardbean =  boardService.allBoard();
		Paging paging = new Paging();
		paging.getPagingElement(model, null, boardbean, 10);
		
		
		model.addAttribute("boardbean", boardbean);
		
		return "notebook_q&a_main";
	}

	@GetMapping("/write")
	public String writeboard(String nickname, String email, Model model) {
//		model.addAttribute("nickname", nickname);
//		model.addAttribute("email", email);

		return "notebook_q&a_write";
	}

	@PostMapping("/writeok")
	public String writeOk(@ModelAttribute BoardBean boardbean, String writer, String email , Model model) {
		if (boardbean.getPassword().equals("") || boardbean.getPassword() == null) {
			boardbean.setPassword("default");
		}
		
		boardService.insertbean(boardbean, email); //인설트
	    
		

		return "redirect:/board/mainlist"; // 작성하면 보드
	}

	@GetMapping("/inboard")
	public String inboard(int num, Model model, String nickname, HttpSession session) {
		session.setAttribute("usernick", nickname); // 세션값 이메일로부여

		BoardBean bean = boardService.getOneBoard(num);
		session.setAttribute("bean", bean);
		// model.addAttribute("nickname", nickname);
		return "notebook_q&A_in";
	}

	@GetMapping("/returnlist")
	public String returnlist(String nickname, Model model, HttpSession session) {
	
		return "redirect:/board/mainlist";
	}

	@PostMapping("/boardmodify")
	public String boardmodify(BoardBean boardbean, Model model, HttpSession session , HttpServletRequest request) {
		
		session.setAttribute("nickname", boardbean.getWriter()); // 세션값 이메일로부여
		model.addAttribute("boardbean", boardbean);
		
		BoardBean bean =(BoardBean)request.getAttribute("bean");
		if(bean != null) {
		model.addAttribute("boardbean", bean);
		}
		
		
		
		return "notebook_q&a_modify";
	}

	@PostMapping("/boardmodiffyok")
	public String modiffyok(BoardBean bean, HttpSession session) {
		session.setAttribute("nickname", bean.getWriter()); // 세션값 이메일로부여
		session.setAttribute("bean", null);  
		 boardService.updateBoard(bean);
		return  "redirect:/board/mainlist";   // 수정후 게시판 메인이동

	}

	@PostMapping("/boardDel")
	public String boardDel(BoardBean bean, HttpSession session) {
		session.setAttribute("nickname", bean.getWriter()); // 세션값 이메일로부여
		session.setAttribute("bean", null);
		boardService.DeleteBoard(bean.getNum(), bean.getPassword());
		
		return "redirect:/board/mainlist";  // 삭제후 게시판 메인으로이동
	}

	@PostMapping("/boardrewrite")
	public String boardRewrite(int num, String writer, String content, Model model, HttpSession session)
			throws IOException {
		session.setAttribute("usernick", writer); // 세션값 이메일로부여

		ReBoardBean rebean = new ReBoardBean();
		rebean.setNum(num);
		rebean.setWriter(writer);
		rebean.setContent(content);
		BoardBean bean = boardDAO.getOneBoard(num);
		session.setAttribute("bean", bean);
		boardService.boardrewrite(rebean, num); // rewrite insert

		return "notebook_q&A_in";

	}

	@GetMapping("/pwdcheck")
	public String passcheck(HttpSession session, String nickname, int num) {
		session.setAttribute("usernick", nickname); // 세션값 이메일로부여
		session.setAttribute("num", num); // 세션값 이메일로부여

		return "boardpwdcheck";
	}

	@PostMapping("/pwdcheckok")
	public String pwdcheckok(String password, int num, HttpServletResponse response, HttpSession session) {

		return boardService.pwdcheck(password, num, response, session);
	}

	@GetMapping("/pagenum")
	public String pagenum(String pageNum, HttpSession session) {
		session.setAttribute("pageNum", pageNum); // 세션값 이메일로부여

		return "notebook_q&a_main";
	}

	@GetMapping("/searchbox")
	public String searchbox(String textsearch, String selectbox , Model model) {
		System.out.println(selectbox);
		boardService.searchbox(textsearch, selectbox , model );
	
		return "notebook_q&a_main";
	}

	@GetMapping("/listmain")
	public String listmain(Model model) {
		ArrayList<BoardBean> boardbean =  boardService.allBoard();
		Paging paging = new Paging();
		paging.getPagingElement(model, null, boardbean, 10);
		
		return "notebook_q&a_main";
	}
	
	
	@ResponseBody
	@PostMapping(value ="/deleteAllProduct" , consumes = "application/json", produces = "application/text")
	public String deleteAllProduct(@RequestBody Map<String, Object> map) {
	List<String> checkednum = (List<String>) map.get("checkednum");
		
		
		System.out.println(checkednum);
		boardService.deleteMyBoard(checkednum);
		
		return "ok";
	}
	
	
	
	


	
}
