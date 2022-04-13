package Danawa.Project1.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.openqa.selenium.html5.SessionStorage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/logout")
public class LogoutController {

	@GetMapping("/main")
	public String logout(HttpSession session) {
		 System.out.println("로그아웃");
		 session.invalidate();
		 return "redirect:/";
	}
	

	


}
