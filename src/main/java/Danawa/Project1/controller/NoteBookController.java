package Danawa.Project1.controller;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import Danawa.Project1.Dto.Mallinfo;
import Danawa.Project1.Dto.NoteBookInfoBean;
import Danawa.Project1.Dto.Paging;
import Danawa.Project1.Service.NoteBookService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notebook")
public class NoteBookController {

	@Autowired
	private NoteBookService notebookService;
	private ArrayList<NoteBookInfoBean> notebeanss = null;
	
	// paging
	@GetMapping("/pagenum")
	public String pagenum(String pageNum, HttpServletRequest request, HttpSession session, Model model, String nickname, String cls
			, String allnotebook) {
		System.out.println("test");
		
		
		ArrayList<NoteBookInfoBean> notebean = null;
		Map<String, ?> map = null;
		if(RequestContextUtils.getInputFlashMap(request) != null) {
	     map = RequestContextUtils.getInputFlashMap(request);
		}
		
	   
				
		if(map != null && map.get("notebean") != null) { //분류하자마자 1페이지에서온경우
			
			notebean = (ArrayList<NoteBookInfoBean>) map.get("notebean");
			Paging.getPagingElement(model, pageNum, notebean , 10);
			notebeanss = notebean;
		}
		else if(notebeanss != null &&  (allnotebook == null || !allnotebook.equals("allnotebook")) ) {
			Paging.getPagingElement(model, pageNum, notebeanss , 10);
		}
		else if(allnotebook != null &&  allnotebook.equals("allnotebook")) {
			notebean = notebookService.getNoteBook();// 모든노트북불러와서
			Paging.getPagingElement(model, pageNum, notebean , 10);
			notebeanss = null;
		}
		else { // 처음들어왔을때 전체보기했을때
			notebean = notebookService.getNoteBook();// 모든노트북불러와서
			Paging.getPagingElement(model, pageNum, notebean , 10);
		}
		
		
		
		
	 // 페이징하는 대필요한 요소와 반환될노트북정보

		return "NoteBookMain";
	}

	
	
	// classfication
	@GetMapping("/classification")
	public String classification(String[] company, String[] screeninch, String[] weight, String[] price,
			String[] memory, String[] usb, String[] purpose, String[] thickness, HttpSession session, Model model
			 ,String pageNum, RedirectAttributes redirectAttribute , String isCheckBoxClick) {

		System.out.println("/classification");
		// 분류한 게시물전체를 불러옴
		
		HashSet<NoteBookInfoBean> bean = notebookService.getClassifiedNotebook(company, screeninch, weight, price,
				memory, usb, purpose, thickness);
		
		ArrayList<NoteBookInfoBean> notebean = new ArrayList<NoteBookInfoBean>(bean);
		
		if(company == null && screeninch == null &&  weight ==null &&  price ==null &&
				memory == null && usb ==null && purpose == null && thickness == null) {
			    notebean = notebookService.getNoteBook();
		}
		
		redirectAttribute.addFlashAttribute("notebean", notebean);
		redirectAttribute.addFlashAttribute("isCheckBoxClick");
		return "redirect:/notebook/pagenum";
	}

	
	
	@GetMapping("/textsearch")
	public String textSearch(String textSearch  , Model model , String pageNum) {
		 HashSet<NoteBookInfoBean> textSearchNotebook = notebookService.textSearch(textSearch);
		 ArrayList<NoteBookInfoBean>textSearchNotebooks = new ArrayList<NoteBookInfoBean>(textSearchNotebook);
		 System.out.println(textSearch);
		 System.out.println(textSearchNotebooks);
		 
		 
		 Paging.getPagingElement(model, pageNum, textSearchNotebooks , 10);
		 
		 return "NoteBookMain";
	}
	
	
	
	

	@GetMapping("/onenotebook")
	public String OneNoteBook(String subject, String nickname, HttpSession session) {
        System.out.println(subject);
		NoteBookInfoBean onenotebook = notebookService.OneNoteBook(subject);
		Mallinfo info = notebookService.searchMall(onenotebook);

		ArrayList<Mallinfo> mallinfo = notebookService.oneMallInfo(info);

		session.setAttribute("mallinfo", mallinfo);
		session.setAttribute("onenotebook", onenotebook);
		

		return "NotebookOne";
	}

	@ResponseBody
	@PostMapping(value = "/productOfInterest", consumes = "application/json;charset=UTF-8")
	public String productOfInterest(@RequestBody Map<?, ?> notebook, HttpSession session) {
    
		String subject = (String) notebook.get("subject");
		String email = (String) notebook.get("email");
        
		
		System.out.println("controller " + subject);

		NoteBookInfoBean mynotebook = new NoteBookInfoBean();
		String result = notebookService.myOneNotebook(subject, email, session) + "";

//		 
//	   
		return result;
	}

	@ResponseBody
	@PostMapping(value = "/deleteAllProduct", consumes = "application/json", produces = "application/text")
	public String deleteAllProduct(@RequestBody Map<String, Object> map) {
		List<String> subjects = (List<String>) map.get("checkedSubject");

		System.out.println(subjects);
		notebookService.deleteAllMyProduct(subjects);

		return "ok";
	}
	
	

}
