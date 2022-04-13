package Danawa.Project1.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Danawa.Project1.Dao.MyitemDAO;
import Danawa.Project1.Dao.NoteBookDAO;
import Danawa.Project1.Dto.Mallinfo;
import Danawa.Project1.Dto.Myitem;
import Danawa.Project1.Dto.NoteBookInfoBean;

@Service
public class NoteBookService {
	@Autowired
	private NoteBookDAO noteBookDAO;
	
	@Autowired
	MyitemDAO myitemdao;
	
	
	// dao에서 allNotebook 가지고 와서 사용자가 선택한 keyword를 가지고 조건 검색하는 부분
	public HashSet<NoteBookInfoBean> getClassifiedNotebook(String[] company, String[] screeninch, String[] weight,
			String[] price, String[] memory, String[] usb, String[] purpose, String[] thickness ) {

		ArrayList<NoteBookInfoBean> allnotebook = noteBookDAO.getAllNoteBooks(); // 전체노트북받기

		ArrayList<NoteBookInfoBean> arrcompany = new ArrayList<NoteBookInfoBean>(); // 회사별
		HashSet<NoteBookInfoBean> set = new HashSet<>(); // 나중에 각각의 arraylist를담아서 중복제거

		// 회사이름
		String companys = Arrays.toString(company);
		String screeninchs = Arrays.toString(screeninch);
		String weights = Arrays.toString(weight);
		String memorys = Arrays.toString(memory);
		String usbs = Arrays.toString(usb);
		String purposes = Arrays.toString(purpose);
		String thicknesss = Arrays.toString(thickness);

		// Stringa a =
		// (Math.round(Float.parseFloat(allnotebook.get(i).getScreeninch()))+"") ;

		for (int i = 0; i < allnotebook.size(); i++) { // 회사이름 포함체크 A , b , c
			if ((company != null) && (screeninch != null) && (weight != null) && (memory != null) && (usb != null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& memorys.contains(allnotebook.get(i).getMemory())) {
					arrcompany.add(allnotebook.get(i));
					System.out.println("db인치" + allnotebook.get(i).getScreeninch());
				}
			}
			// ===================================================================
			else if ((company != null) && (screeninch == null) && (weight == null) && (memory == null)
					&& (usb == null)) {

				if (companys.contains(allnotebook.get(i).getCompany()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((company == null) && (screeninch != null) && (weight == null) && (memory == null)
					&& (usb == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((company == null) && (screeninch == null) && (weight != null) && (memory == null)
					&& (usb == null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((company == null) && (screeninch == null) && (weight == null) && (memory != null)
					&& (usb == null)) {

				if (memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((company == null) && (screeninch == null) && (weight == null) && (memory == null)
					&& (usb != null)) {

				if (usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((company == null) && (screeninch == null) && (weight == null) && (memory == null)
					&& (usb == null) && (purpose != null)) {

				if (purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			// 1개씩끝==================================================================================

			else if ((company != null) && (screeninch != null) && (weight == null) && (memory == null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}

			}

			else if ((company != null) && (screeninch == null) && (weight != null) && (memory == null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((company != null) && (screeninch == null) && (weight == null) && (memory != null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())

						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((company != null) && (screeninch == null) && (weight == null) && (memory == null)
					&& (usb != null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany()) && usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((company != null) && (screeninch == null) && (weight == null) && (memory == null)
					&& (usb == null) && (purpose != null)) {

				if (companys.contains(allnotebook.get(i).getCompany()) 
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			// 컴퍼니 3개시작
			else if ((company != null) && (screeninch != null) && (weight != null) && (memory == null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			
			else if ((company != null) && (screeninch != null) && (weight == null) && (memory != null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((company != null) && (screeninch != null) && (weight == null) && (memory == null)
					&& (usb != null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((company != null) && (screeninch != null) && (weight == null) && (memory == null)
					&& (usb == null) && (purpose != null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			
			else if ((company != null) && (screeninch == null) && (weight != null) && (memory != null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&&  usbs.contains(allnotebook.get(i).getUsb())
						&&  memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			

			else if ((company != null) && (screeninch == null) && (weight != null) && (memory == null)
					&& (usb != null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((company != null) && (screeninch == null) && (weight != null) && (memory == null)
					&& (usb == null) && (purpose != null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((company != null) && (screeninch == null) && (weight == null) && (memory != null)
					&& (usb != null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((company != null) && (screeninch == null) && (weight == null) && (memory != null)
					&& (usb == null) && (purpose != null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((company != null) && (screeninch == null) && (weight == null) && (memory == null)
					&& (usb != null) && (purpose != null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			

			// ====================================================================================
			// screen 시작

			else if ((screeninch != null) && (company != null) && (weight == null) && (memory == null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}

			}

			else if ((screeninch != null) && (company == null) && (weight != null) && (memory == null)
					&& (usb == null) && (purpose == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((screeninch != null) && (company == null) && (weight == null) && (memory != null)
					&& (usb == null) && (purpose == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")

						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((screeninch != null) && (company == null) && (weight == null) && (memory == null)
					&& (usb != null) && (purpose == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((screeninch != null) && (company == null) && (weight == null) && (memory == null)
					&& (usb == null) && (purpose != null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			// 컴퍼니 3개시작
			else if ((screeninch != null) && (company != null) && (weight != null) && (memory == null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((screeninch != null) && (company != null) && (weight == null) && (memory != null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			else if ((screeninch != null) && (company != null) && (weight == null) && (memory == null)
					&& (usb != null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((screeninch != null) && (company != null) && (weight == null) && (memory == null)
					&& (usb == null) && (purpose != null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& purposes.contains(allnotebook.get(i).getPurpose())
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			

			else if ((screeninch != null) && (company == null) && (weight != null) && (memory != null)
					&& (usb == null) && (purpose == null) ) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((screeninch != null) && (company == null) && (weight != null) && (memory == null)
					&& (usb != null) && (purpose == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((screeninch != null) && (company == null) && (weight != null) && (memory == null)
					&& (usb == null) && (purpose != null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& purposes.contains(allnotebook.get(i).getPurpose() )
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((screeninch != null) && (company == null) && (weight == null) && (memory != null)
					&& (usb != null) && (purpose == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			else if ((screeninch != null) && (company == null) && (weight == null) && (memory != null)
					&& (usb == null) && (purpose != null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			
			else if ((screeninch != null) && (company == null) && (weight == null) && (memory == null)
					&& (usb != null) && (purpose != null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			//  weight시작 

			else if ((weight != null) && (company != null) && (screeninch == null) && (memory == null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}

			}

			else if ((weight != null) && (company == null) && (screeninch != null) && (memory == null)
					&& (usb == null) && (purpose == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((weight != null) && (company == null) && (screeninch == null) && (memory != null)
					&& (usb == null) && (purpose == null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")

						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((weight != null) && (company == null) && (screeninch == null) && (memory == null)
					&& (usb != null) && (purpose == null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((weight != null) && (company == null) && (screeninch == null) && (memory == null)
					&& (usb == null) && (purpose != null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			// 컴퍼니 3개시작
			else if ((weight != null) && (company != null) && (screeninch != null) && (memory == null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			
			else if ((weight != null) && (company != null) && (screeninch == null) && (memory != null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			else if ((weight != null) && (company != null) && (screeninch == null) && (memory == null)
					&& (usb != null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((weight != null) && (company != null) && (screeninch == null) && (memory == null)
					&& (usb == null) && (purpose != null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& purposes.contains(allnotebook.get(i).getPurpose())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			

			else if ((weight != null) && (company == null) && (screeninch != null) && (memory != null)
					&& (usb == null) && (purpose == null) ) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((weight != null) && (company == null) && (screeninch != null) && (memory == null)
					&& (usb != null) && (purpose == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((weight != null) && (company == null) && (screeninch != null) && (memory == null)
					&& (usb == null) && (purpose != null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& purposes.contains(allnotebook.get(i).getPurpose() )
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((weight != null) && (company == null) && (screeninch == null) && (memory != null)
					&& (usb != null) && (purpose == null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			else if ((weight != null) && (company == null) && (screeninch == null) && (memory != null)
					&& (usb == null) && (purpose != null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			
			else if ((weight != null) && (company == null) && (screeninch == null) && (memory == null)
					&& (usb != null) && (purpose != null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			//weight 끝
			
			else if ((memory != null) && (company != null) && (screeninch == null) && (weight == null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}

			}

			else if ((memory != null) && (company == null) && (screeninch != null) && (weight == null)
					&& (usb == null) && (purpose == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			else if ((memory != null) && (company == null) && (screeninch == null) && (weight != null)
					&& (usb == null) && (purpose == null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")

						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			

			else if ((memory != null) && (company == null) && (screeninch == null) && (weight == null)
					&& (usb != null) && (purpose == null)) {

				if (memorys.contains(allnotebook.get(i).getMemory())
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((memory != null) && (company == null) && (screeninch == null) && (weight == null)
					&& (usb == null) && (purpose != null)) {

				if (memorys.contains(allnotebook.get(i).getMemory())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			// 컴퍼니 3개시작
			else if ((memory != null) && (company != null) && (screeninch != null) && (weight == null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			
			else if ((memory != null) && (company != null) && (screeninch == null) && (weight != null)
					&& (usb == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			else if ((memory != null) && (company != null) && (screeninch == null) && (weight == null)
					&& (usb != null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((memory != null) && (company != null) && (screeninch == null) && (weight == null)
					&& (usb == null) && (purpose != null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& purposes.contains(allnotebook.get(i).getPurpose())
						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			

			else if ((memory != null) && (company == null) && (screeninch != null) && (weight != null)
					&& (usb == null) && (purpose == null) ) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((memory != null) && (company == null) && (screeninch != null) && (weight == null)
					&& (usb != null) && (purpose == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((memory != null) && (company == null) && (screeninch != null) && (weight == null)
					&& (usb == null) && (purpose != null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& purposes.contains(allnotebook.get(i).getPurpose() )
						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((memory != null) && (company == null) && (screeninch == null) && (weight != null)
					&& (usb != null) && (purpose == null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			else if ((memory != null) && (company == null) && (screeninch == null) && (weight != null)
					&& (usb == null) && (purpose != null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			
			else if ((memory != null) && (company == null) && (screeninch == null) && (weight == null)
					&& (usb != null) && (purpose != null)) {

				if (memorys.contains(allnotebook.get(i).getMemory())
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			//memory 끝 
			//usb 시작 
			
			else if ((usb != null) && (company != null) && (screeninch == null) && (weight == null)
					&& (memory == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}

			}

			else if ((usb != null) && (company == null) && (screeninch != null) && (weight == null)
					&& (memory == null) && (purpose == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((usb != null) && (company == null) && (screeninch == null) && (weight != null)
					&& (memory == null) && (purpose == null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")

						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			

			else if ((usb != null) && (company == null) && (screeninch == null) && (weight == null)
					&& (memory != null) && (purpose == null)) {

				if (memorys.contains(allnotebook.get(i).getMemory())
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			else if ((usb != null) && (company == null) && (screeninch == null) && (weight == null)
					&& (memory == null) && (purpose != null)) {

				if (usbs.contains(allnotebook.get(i).getUsb())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			// 컴퍼니 3개시작
			else if ((usb != null) && (company != null) && (screeninch != null) && (weight == null)
					&& (memory == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			
			else if ((usb != null) && (company != null) && (screeninch == null) && (weight != null)
					&& (memory == null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			else if ((usb != null) && (company != null) && (screeninch == null) && (weight == null)
					&& (memory != null) && (purpose == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((usb != null) && (company != null) && (screeninch == null) && (weight == null)
					&& (memory == null) && (purpose != null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& purposes.contains(allnotebook.get(i).getPurpose())
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			

			else if ((usb != null) && (company == null) && (screeninch != null) && (weight != null)
					&& (memory == null) && (purpose == null) ) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((usb != null) && (company == null) && (screeninch != null) && (weight == null)
					&& (memory != null) && (purpose == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((usb != null) && (company == null) && (screeninch != null) && (weight == null)
					&& (memory == null) && (purpose != null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& purposes.contains(allnotebook.get(i).getPurpose() )
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((usb != null) && (company == null) && (screeninch == null) && (weight != null)
					&& (memory != null) && (purpose == null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& memorys.contains(allnotebook.get(i).getMemory())
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			else if ((usb != null) && (company == null) && (screeninch == null) && (weight != null)
					&& (memory == null) && (purpose != null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			
			else if ((usb != null) && (company == null) && (screeninch == null) && (weight == null)
					&& (memory != null) && (purpose != null)) {

				if (memorys.contains(allnotebook.get(i).getMemory())
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			//usb 끝
			//purpose시작

			else if ((purpose != null) && (company != null) && (screeninch == null) && (weight == null)
					&& (memory == null) && (usb == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}

			}

			else if ((purpose != null) && (company == null) && (screeninch != null) && (weight == null)
					&& (memory == null) && (usb == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((purpose != null) && (company == null) && (screeninch == null) && (weight != null)
					&& (memory == null) && (usb == null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")

						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			

			else if ((purpose != null) && (company == null) && (screeninch == null) && (weight == null)
					&& (memory != null) && (usb == null)) {

				if (memorys.contains(allnotebook.get(i).getMemory())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			else if ((purpose != null) && (company == null) && (screeninch == null) && (weight == null)
					&& (memory == null) && (usb != null)) {

				if (usbs.contains(allnotebook.get(i).getUsb())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			// 컴퍼니 3개시작
			else if ((purpose != null) && (company != null) && (screeninch != null) && (weight == null)
					&& (memory == null) && (usb == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& purposes.contains(allnotebook.get(i).getPurpose())
						&& screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			
			else if ((purpose != null) && (company != null) && (screeninch == null) && (weight != null)
					&& (memory == null) && (usb == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& purposes.contains(allnotebook.get(i).getPurpose())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			else if ((purpose != null) && (company != null) && (screeninch == null) && (weight == null)
					&& (memory != null) && (usb == null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& purposes.contains(allnotebook.get(i).getPurpose())
						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			else if ((purpose != null) && (company != null) && (screeninch == null) && (weight == null)
					&& (memory == null) && (usb != null)) {

				if (companys.contains(allnotebook.get(i).getCompany())
						&& purposes.contains(allnotebook.get(i).getPurpose())
						&& usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			

			else if ((purpose != null) && (company == null) && (screeninch != null) && (weight != null)
					&& (memory == null) && (usb == null) ) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& purposes.contains(allnotebook.get(i).getPurpose())
						&& weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + ""))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((purpose != null) && (company == null) && (screeninch != null) && (weight == null)
					&& (memory != null) && (usb == null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&&  purposes.contains(allnotebook.get(i).getPurpose())
						&& memorys.contains(allnotebook.get(i).getMemory()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((purpose != null) && (company == null) && (screeninch != null) && (weight == null)
					&& (memory == null) && (usb != null)) {

				if (screeninchs.contains((int) (Float.parseFloat(allnotebook.get(i).getScreeninch())) + "")
						&& purposes.contains(allnotebook.get(i).getPurpose() )
						&&  usbs.contains(allnotebook.get(i).getUsb()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			

			else if ((purpose != null) && (company == null) && (screeninch == null) && (weight != null)
					&& (memory != null) && (usb == null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& memorys.contains(allnotebook.get(i).getMemory())
						&&  purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			else if ((purpose != null) && (company == null) && (screeninch == null) && (weight != null)
					&& (memory == null) && (usb != null)) {

				if (weights.contains((int) (Float.parseFloat(allnotebook.get(i).getWeight())) + "")
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}

			
			else if ((purpose != null) && (company == null) && (screeninch == null) && (weight == null)
					&& (memory != null) && (usb != null)) {

				if (memorys.contains(allnotebook.get(i).getMemory())
						&& usbs.contains(allnotebook.get(i).getUsb())
						&& purposes.contains(allnotebook.get(i).getPurpose()))

				{
					arrcompany.add(allnotebook.get(i));
				}
			}
			
			
			
			
			
		}
		
		
		
		
		 
		 
		if (arrcompany != null) {
			for (int i = 0; i < arrcompany.size(); i++) {
				set.add(arrcompany.get(i)); // 삼성인컴퓨터
			}
		}

		
	

		return set;

	}
	
	
	
	
	public NoteBookInfoBean OneNoteBook(String subject) {
		
		NoteBookInfoBean onenotebook = new NoteBookInfoBean();
		onenotebook  = noteBookDAO.OneNotebook(subject);
		
	   
		 
		 return onenotebook;
	}
	
	
	public  Mallinfo searchMall(NoteBookInfoBean bean ) {
	 Mallinfo info = noteBookDAO.searchMall(bean);
	 
	 return info;
	}
	
	public ArrayList<Mallinfo> oneMallInfo(Mallinfo bean) {
		ArrayList<Mallinfo> mallinfo =  noteBookDAO.mallinfo(bean);
		
		return mallinfo;
	}
	
	
	
	public int myOneNotebook(String subject , String email , HttpSession session ) {
		
	
		
		NoteBookInfoBean notebean = new NoteBookInfoBean();
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy년MM월dd일 HH시mm분");
		String time = format.format(new Date());
	     
		notebean = noteBookDAO.OneNotebook(subject); //노트북정보꺼내와서
	  
		Myitem item = new Myitem();  //item 빈에 셋해주고
		item.setEmail(email);
		item.setSubject(notebean.getSubject());
		item.setPrice(notebean.getPrice());
		item.setImg(notebean.getImg());
		item.setRegdate(time);
		
		
		          // 데이터베이스에 인설트
		return   myitemdao.insertMyItem(item);
	}
	

	
	
	public void deleteAllMyProduct(List<String> subjects) {
		noteBookDAO.deleteAllMyProduct(subjects);
	}
	
	
	
	public ArrayList<NoteBookInfoBean> getNoteBook(){
		 ArrayList<NoteBookInfoBean> notebook = new ArrayList<NoteBookInfoBean>();
		 notebook = noteBookDAO.getAllNoteBooks();
		
		return notebook;
	}
	
	
	public HashSet<NoteBookInfoBean> textSearch(String textSearch){
		 ArrayList<NoteBookInfoBean> notebook = new ArrayList<NoteBookInfoBean>();
		 HashSet<NoteBookInfoBean> textSearchNotebook = new HashSet<NoteBookInfoBean>();
		
		 
		 notebook = noteBookDAO.getAllNoteBooks();
		 for(int i = 0 ; i < notebook.size(); i++) {
			 if(StringUtils.containsIgnoreCase(notebook.get(i)+"", textSearch.replace(" ", ""))) {
				 textSearchNotebook.add(notebook.get(i));
			 }
		 }
		 if(textSearchNotebook.size() == 0) {
			 for(int k = 0 ; k < notebook.size(); k++) {
				 textSearchNotebook.add(notebook.get(k));
			 }
		 }
		 
		 return textSearchNotebook;
	}
	
	

}
