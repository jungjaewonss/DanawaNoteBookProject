package Crawling;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import Danawa.Project1.Dto.Mallinfo;
import Danawa.Project1.Dto.NoteBookInfoBean;

public class Crawling {
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver"; // 드라이버 ID
	public static final String WEB_DRIVER_PATH = "C:\\Users\\manoo\\OneDrive\\바탕 화면\\크\\chromedriver.exe"; // 드라이버 경로
	static Connection con;
	static PreparedStatement pstmt;
	static ResultSet rs;

	public static void main(String[] args) {


		crawling();


	}	
	
	
	public static void crawling() {
		try {
	         System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      ChromeOptions options = new ChromeOptions();
	      WebDriver driver = new ChromeDriver(options);
	      
	      String url = "http://prod.danawa.com/list/?cate=112758&searchOption=searchMaker=6792,702,1452,2869,2137,2904/innerSearchKeyword=";
	      driver.get(url);
	      
	      driver.findElement(By.className("qnt_selector")).click();
	      driver.findElement(By.xpath("//*[@id=\"productListArea\"]/div[2]/div[2]/div[2]/select/option[3]")).click();

	      try {Thread.sleep(3000);} catch(InterruptedException e) {}
	      
	      List<WebElement> ahref =  driver.findElements(By.cssSelector(".prod_name a"));
	      List<String> prodList = new ArrayList<>();
	      for(WebElement e : ahref) {
	         prodList.add(e.getAttribute("href"));
	      }

	      for(int i = 4; i < prodList.size(); i++) {
	         if(prodList.get(i).contains("pcode")) {
	            String prodUrl = prodList.get(i);
	            try {Thread.sleep(3000);} catch(InterruptedException e) {}
	            driver.get(prodUrl); //url 바꿔주기

	            WebElement nameEle = driver.findElement(By.className("prod_tit"));
	            String name = nameEle.getText(); //제품명
	            System.out.println(name);
	            if(name.contains("FX516PR-HN002")) continue;
	            
	            /* 가격정보 */
	            List<WebElement> priceEle = driver.findElements(By.cssSelector(".high_list .price .prc_t"));
	            List<String> priceList = new ArrayList<>();
	            for(WebElement e : priceEle) {
	               if (e.getText().contains(",")) {
	                  priceList.add(e.getText().replace(",", "")); //가격
	               }
	            }
	          //쇼핑몰 링크
	            List<WebElement> linkEle = driver.findElements(By.cssSelector(".high_list .logo_over a"));
	            List<String> linkList = new ArrayList<>();
	            for(WebElement e : linkEle) {
	               if(!(e.getAttribute("href").contains("ajax"))) {
	                  linkList.add(e.getAttribute("href")); 
	               }
	            }
               //로고이미지
	            List<String> logoList = new ArrayList<>();
	            List<String> siteNameList = new ArrayList<>();
	            List<WebElement> imgEle = driver.findElements(By.cssSelector(".high_list .logo_over img"));
	            for(WebElement e : imgEle) {
	               if(!e.getAttribute("src").contains("noImg")) {
	                  logoList.add(e.getAttribute("src"));
	                  siteNameList.add(e.getAttribute("alt"));
	               }
	            }
	            
	            //Mall이름
	            for(int j = 0; j < linkEle.size(); j++) {
	               if(linkEle.get(j).getText().length() > 1) {
	                  String siteName = linkEle.get(j).getText();
	                  if(j > siteNameList.size()) {
	                     siteNameList.add(siteName);
	                     logoList.add("X");
	                  }
	                  else {
	                     siteNameList.add(j, siteName);
	                     logoList.add(j, "X");
	                  }
	               }
	            }
	            
	               List<WebElement> shippingEle = driver.findElements(By.cssSelector("#blog_content > div.summary_info > div.detail_summary > div.summary_left > div.lowest_area > div.lowest_list > table > tbody.high_list span.stxt.deleveryBaseSection"));
	               List<String> shippingList = new ArrayList<>();
	               for (WebElement e : shippingEle) {
	                  shippingList.add(e.getText()); //배송비
	               }
				
				List<Mallinfo> mallInfos = new ArrayList<>(shippingList.size());		
				for(int k = 0; k < shippingList.size(); k++) {
					
					Mallinfo mallInfo = new Mallinfo();
					mallInfo.setModelnum(name);
					mallInfo.setLink(linkList.get(k));
					mallInfo.setLogo(logoList.get(k));
					mallInfo.setPrice(priceList.get(k));
					mallInfo.setShipping(shippingList.get(k));
					mallInfo.setMallname(siteNameList.get(k));
					
					mallInfos.add(mallInfo);
				}
				
			
				InsertMallInfoBean(mallInfos);
				
				
				
				
				
				List<WebElement> screeninchs = driver.findElements(By.cssSelector(".dsc a"));

				  ArrayList lists = new ArrayList();
				  String screeninch = "";
				  for(WebElement ele : screeninchs) {
					  lists.add(ele.getText());
				  }
				  
				  for(int j = 0 ; j < lists.size(); j++) {
					  if((lists.get(j)+"").contains("인치")){
					String [] str =(lists.get(j)+"").split("\\(");	
					for(int k = 0; k < str.length; k++) {
						if(!(str[k].contains("cm"))) {
							screeninch = (str[k]+"").replace(")", "").replace("인치", "");
						}
					}
					  }
				  }
				  
				  List<WebElement> weights = driver.findElements(By.cssSelector(".dsc a"));

					 
				  String weight = "";
				  for(WebElement ele : weights) {
					  lists.add(ele.getText());
				  }
				  
				  for(int k = 0 ; k < lists.size(); k++) {
					  if((lists.get(k)+"").contains("kg")){
						  weight =  (lists.get(k)+"").replace("kg", ""); break;
					  }
				  }
				  
				  
				  
				  WebElement elee =  driver.findElement(By.cssSelector(".maker_link"));
					String company = elee.getText();
				  
					
					
					String price = driver.findElement(By.cssSelector(".prc_c")).getText();
					String[] pricess = price.replace(",", "").split(" ");  
					// for 문돌며서 최저가검색
					int minprice = Integer.MAX_VALUE;
					for (int q = 0; q < pricess.length; q++) {

						if (Integer.parseInt(pricess[q]) < minprice) {
							minprice = Integer.parseInt(pricess[q]);
							
						}
					}
				String	minprices = minprice+"";
					
					
					
					WebElement imgss = driver.findElement(By.cssSelector("#baseImage"));
					String img = imgss.getAttribute("src");	
					
					
					
					
					List<WebElement> memorys = driver.findElements(By.cssSelector(".dsc a"));

					
					  String memory = "";
					  for(WebElement ele : memorys) {
						  lists.add(ele.getText());
					  }
					  
					  for(int l = 0 ; l < lists.size(); l++) {
						  if((lists.get(l)+"").contains("GB")){
							 memory = (lists.get(l)+"").replace("GB", ""); break;
						  }
					  }
					  
					  
					  
					  List<WebElement> usbs = driver.findElements(By.cssSelector(".dsc a"));

					  ArrayList listss = new ArrayList();
					  String usb = "";
					  for(WebElement ele : usbs) {
					  	  lists.add(ele.getText());
					  }

					  for(int m = 0 ; m < lists.size(); m++) {
					  	  if((lists.get(m)+"").contains("총")){
					  		  usb = (lists.get(m)+"").replace("총", "").replace("개", ""); break;
					  	  }
					  }
					  
					  
					  
					  List<WebElement> uses = driver.findElements(By.cssSelector(".tit"));

					  ArrayList listsss = new ArrayList();
					  String purpose = "";
					  for(WebElement ele : uses) {
					  	  lists.add(ele.getText());
					  }

					  for(int n = 0 ; n < lists.size(); n++) {
					  	  if((lists.get(n)+"").contains("게임") || (lists.get(n)+"").contains("사무") || (lists.get(n)+"").contains("인강") || (lists.get(n)+"").contains("그래픽")){
					  		  purpose = (lists.get(n)+""); break;
					  	  }
					  }
					  
					  
					  
					  List<WebElement> Thicknesss = driver.findElements(By.cssSelector(".dsc a"));

					  ArrayList listssss = new ArrayList();
					  String thickness = "";
					  for(WebElement ele : Thicknesss) {
					  	  lists.add(ele.getText());
					  }

					  for(int o = 0 ; o < lists.size(); o++) {
					  	  if((lists.get(o)+"").contains("mm")){
					  		  thickness = (lists.get(o)+"").replace("mm", ""); break;
					  	  }
					  }
					  
					  List<WebElement> els =	driver.findElements(By.cssSelector(".items a"));
						
						String allinfo = "";	
						for (WebElement element : els) {
							allinfo+=element.getText();
										
									}
				
					  
					  
					  NoteBookInfoBean bean = new NoteBookInfoBean(name,screeninch,weight,company,minprices,img,memory, usb,purpose,thickness,allinfo);
					  System.out.println(bean);
					  InsertNoteBook(bean);
					  
					
			}
		}
	

	


	}
		
		
	public static void InsertMallInfoBean(List<Mallinfo> bean) {
		   
		   try {
			   getCon();
			   String sql = "insert into mallinfo values(mallinfo_seq.nextval,?,?,?,?,?,?)";
			  
			   pstmt =  con.prepareStatement(sql);
			   for(int i = 0 ; i < bean.size(); i++) {
			
				   pstmt.setString(1, bean.get(i).getMallname());
				   pstmt.setString(2, bean.get(i).getModelnum());
				   pstmt.setString(3, bean.get(i).getPrice());
				   pstmt.setString(4, bean.get(i).getLink());
				   pstmt.setString(5, bean.get(i).getLogo());
				   pstmt.setString(6, bean.get(i).getShipping());
				   
				   pstmt.executeQuery();	  
			   } 	   
		   }catch (Exception e) {
			e.printStackTrace();
		}
		   try {
		   if(con != null) {
        	   con.close();
           }
           if(pstmt != null) {
        	   pstmt.close();
           }
           if(rs != null) {
        	   rs.close();
           }
		   } catch (SQLException e) {
			   e.printStackTrace();
 		}
	   }
	
	
	public static void InsertNoteBook(NoteBookInfoBean bean)  {
		try {
			getCon(); // 데이터베이스연결
			String sql = "insert into notebookinfo values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bean.getSubject().trim());
			pstmt.setString(2, bean.getScreeninch());
			pstmt.setString(3, bean.getWeight());
			pstmt.setString(4, bean.getCompany());
			pstmt.setString(5, bean.getPrice());	
			pstmt.setString(6, bean.getImg());
			pstmt.setString(7, bean.getMemory());
			pstmt.setString(8, bean.getUsb());
			pstmt.setString(9, bean.getPurpose());
			pstmt.setString(10, bean.getThickness());
			pstmt.setString(11, bean.getAllinfo());

			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		 if(con != null) {
      	   try {
			con.close();
			 if(pstmt != null) {
		      	   pstmt.close();
		         }
			 if(rs != null) {
		      	   rs.close();
		         }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         }
        
         
		

	}

	public static void getCon() throws SQLException {
		try {

			String driver = "oracle.jdbc.driver.OracleDriver";
			String user = "scott";
			String password = "tiger";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Class.forName(driver); // JDBC 드라이버 객체 생성
			con = DriverManager.getConnection(url, user, password);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
          
	}
		
	
		
	
				
	

}
