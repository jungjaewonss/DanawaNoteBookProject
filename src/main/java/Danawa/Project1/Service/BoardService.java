package Danawa.Project1.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Danawa.Project1.Dao.BoardDAO;
import Danawa.Project1.Dto.BoardBean;
import Danawa.Project1.Dto.Paging;
import Danawa.Project1.Dto.ReBoardBean;

@Service
public class BoardService {

	@Autowired
	BoardDAO boardDAO;

	
	
	public ArrayList<BoardBean> allBoard(){
		ArrayList<BoardBean> boardbean =  boardDAO.getAllBoards();
		
		return boardbean;
	}
	
	
	public  void insertbean (BoardBean boardbean , String  email) {
		
		try {
			
			 boardDAO.insertBoard(boardbean , email);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public BoardBean getOneBoard(int num) {
		BoardBean bean = new BoardBean();
		bean = boardDAO.getOneBoard(num);

		return bean;
	}

	public void updateBoard(BoardBean bean) {
		boardDAO.updateBoard(bean);

	
	}

	public void DeleteBoard(int num, String pwd) {
		boardDAO.deleteBoard(num, pwd);
		
	}

	public void boardrewrite(ReBoardBean bean, int num) {
		try {
			boardDAO.insertReWriteBoard(bean);
			boardDAO.updatecommentcount(num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<ReBoardBean> getAllReBoard(int num) {
		ArrayList<ReBoardBean> bean = boardDAO.getAllReBoard(num);

		return bean;
	}

	public String pwdcheck(String pwd, int num, HttpServletResponse response, HttpSession session) {
		String dbpwd = boardDAO.getPass(num);

		if (dbpwd.equals(pwd)) {
			BoardBean bean = boardDAO.getOneBoard(num);
			session.setAttribute("bean", bean);
			return "notebook_q&A_in";
		}

		else {

			try {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('fail password.')"); // 비밀번호틀림
				script.println("history.go(-1);"); // 다시로그인페이지로돌려보내기
				script.println("</script>");
				return null;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return null;
	}

	public void searchbox(String searchvalue, String selectbox , Model model ) {

		if (selectbox.equals("selectnum")) {
			System.out.println("num맞음");
			int count = 0;
			for (int i = 0; i < searchvalue.length(); i++) {
				if (!(searchvalue.charAt(i) >= 48 && searchvalue.charAt(i) <= 57)) {
					count++;
				}
			}
			
			if (count == 0) { //count == 0 은 숫자가맞다
				int num = Integer.parseInt(searchvalue.trim());
                ArrayList<BoardBean> onebean = new ArrayList<BoardBean>();
				BoardBean bean = boardDAO.getSelectNum(num);
				if (bean.getSubject() == null) {
				 onebean =	boardDAO.getAllBoards();
				    Paging paging = new Paging();
					paging.getPagingElement(model, null, onebean, 10);
					
				} else {
					model.addAttribute("onebean", bean);
					onebean.add(bean);
					Paging paging = new Paging();
					paging.getPagingElement(model, null, onebean, 10);
				}
			}
			
			else if(count != 0) {
				 ArrayList<BoardBean> onebean =	boardDAO.getAllBoards();
			    Paging paging = new Paging();
				paging.getPagingElement(model, null, onebean, 10);
			
			}

		}

		
		else if (selectbox.equals("selectsubject")) {
			ArrayList<BoardBean> bean = boardDAO.getAllBoards();
			ArrayList<BoardBean> subbean = new ArrayList<BoardBean>();
			for (int i = 0; i < bean.size(); i++) {
				if (bean.get(i).getSubject().contains(searchvalue.trim())) {
					System.out.println(bean.get(i).getSubject());
					subbean.add(bean.get(i));
					
				}
			}
			Paging paging = new Paging();
			paging.getPagingElement(model, null, subbean, 10);

		}

		else if (selectbox.equals("selectwriter")) {
			ArrayList<BoardBean> bean = boardDAO.getAllBoards();
			ArrayList<BoardBean> wirterbean = new ArrayList<BoardBean>();
			for (int i = 0; i < bean.size(); i++) {
				if (bean.get(i).getWriter().equalsIgnoreCase(searchvalue.trim())) {
					System.out.println(bean.get(i).getWriter());
					wirterbean.add(bean.get(i));
				
				}
			}
			Paging paging = new Paging();
			paging.getPagingElement(model, null, wirterbean, 10);
		}
	}
	
	

	public void deleteMyBoard(List<String> num) {
		
		boardDAO.deleteMyBoard(num);
	}
	


	
	

}
