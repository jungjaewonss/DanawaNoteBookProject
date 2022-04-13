package Danawa.Project1.Dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import lombok.ToString;

@ToString
public class Paging {
	// 시작 페이지
	private static int startPage;
	
	//끝페이지
	private static  int endPage;
	
	// 이전 페이지 , 다음 페이지 존재유무
	private static boolean prev, next;
	
	// 전체 게시물 수
	private static int total;
	
	
	private static int pagePerBlock = 5;
	
	
	private static int currentPage;
	private static int currentBlock;
	
	
	private static int totalBlock;
	private static int totalPage;

	private static int startRow;
	private static int endRow;

	
	
	
	public static void getPagingElement(Model model, String pageNum , ArrayList<?> arr , int recordPerPage ) throws NumberFormatException {
		System.out.println(pageNum);
		if(pageNum == null || pageNum.equals("null")) {
			pageNum = "1";
		}
		currentPage = Integer.parseInt(pageNum);
		currentBlock = (int) Math.ceil(currentPage / (double)pagePerBlock);
		total = arr.size();
		startRow = (currentPage-1) * recordPerPage + 1; // 1
		endRow   = currentPage * recordPerPage; // 10
		totalPage  = (int) Math.ceil(total / (double)recordPerPage);  //카운터링 숫자를 얼마까지 보여줄건지 결정 
    	totalBlock = (int) Math.ceil(totalPage / (double)pagePerBlock);
    	   
    	if(endRow > total) {
    		
			endRow = total ;   
		}
    	List<?> currentList = arr.subList(startRow-1, endRow);
    	//처음보여질블럭숫자
    	startPage = (currentPage / pagePerBlock) * pagePerBlock + 1;
    	endPage = startPage  + pagePerBlock - 1;
    	
    	model.addAttribute("startPage", startPage);
    	model.addAttribute("endPage", endPage);

    	model.addAttribute("recordPerPage", recordPerPage);
    	model.addAttribute("pagePerBlock", pagePerBlock);
    	model.addAttribute("currentList", currentList);
    	model.addAttribute("currentPage", currentPage);
    	model.addAttribute("currentBlock", currentBlock);
    	model.addAttribute("total", total);
    	model.addAttribute("totalPage", totalPage);
    	model.addAttribute("totalBlock",totalBlock );
	
      
	
	}
	
	

	
	
}
