package Danawa.Project1.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import Danawa.Project1.Dto.NoteBookInfoBean;
import Danawa.Project1.Service.InsertService;

@Controller
public class loginController {
    @Autowired
    private  InsertService insertservice;         

	
	@GetMapping("/")
	public String login(Model model) {
    	System.out.println("비로그인");
		 ArrayList<NoteBookInfoBean> samsung = insertservice.getSamSungNoteBook();
		 ArrayList<NoteBookInfoBean> asus = insertservice.getAsusNoteBook();
		 ArrayList<NoteBookInfoBean> renoba = insertservice.getRenobaNoteBook();
		 ArrayList<NoteBookInfoBean> beans = insertservice.getNoteBook();

		 model.addAttribute("notebookbean", beans);
		 model.addAttribute("samsung", samsung);
		 model.addAttribute("asus", asus);
		 model.addAttribute("renoba", renoba);
		 
		
		
		 
		 return "loginmain";
    }
    
    
    
}
