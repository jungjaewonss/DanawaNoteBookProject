<%@page import="java.text.DecimalFormat"%>
<%@page import="Danawa.Project1.Dao.NoteBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Danawa.Project1.Dto.NoteBookInfoBean"%>
<%@ page import="java.util.*"%>
<%@ page import="Danawa.Project1.Dto.Mallinfo"%>
<%@page import="com.fasterxml.jackson.core.format.DataFormatDetector"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/노트북전체.css">
<title>Document</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="slide.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Lato&family=Source+Sans+Pro&display=swap">
<title>Document</title>

<link rel="stylesheet" href="/resources/css/NoteBookMain.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


</head>
<body>
	<%@include file="./header.jsp"%>



	


	<div id="wrap"></div>

	<!-- 왼쪽 상단 메뉴바 -->
	<aside class="container_aside">
		<div class="category_aside">

			<div class="aside_head">
				<h3 class="aside_head_main"></h3>
				<a
					href="http://white.contentsfeed.com/RealMedia/ads/click_lx.ads/www.danawa.com/new_main/L23/545845034/x71/danawa/Nvidia_NB_200237/Nvidia_NB_200237_1.html/7239386d336d48542f414d4143585638">
					<img
					src="http://orange.contentsfeed.com/RealMedia/ads/Creatives/danawa/Nvidia_NB_200237/Nvidia_NB_200237_1.jpg"
					id="topadd">
				</a>
				
				<a
					href="http://white.contentsfeed.com/RealMedia/ads/click_lx.ads/www.danawa.com/new_main/L23/545845034/x71/danawa/Nvidia_NB_200237/Nvidia_NB_200237_1.html/7239386d336d48542f414d4143585638">
					<img
					src="https://orange.contentsfeed.com/RealMedia/ads/Creatives/danawa/AMD_GAME_CPU_200237/AMD_GAME_CPU_200237.jpg"
					id="topadd" height="400px;" width="200px">
				</a>
			</div>

			<div class="aside_list_box">
				<ul class="aside_list">

					<li class="list_item"><a href="./notebook_main.html"
						class="aside_list_box_2" target="_blank" value="All"
						id="left_menu1"></a></li>

					<li class="list_item"><a href="./notebook_main.html"
						class="aside_list_box_2" target="_blank" value="Apple"
						id="left_menu2"></a></li>

					<li class="list_item"><a href="./notebook_main.html"
						class="aside_list_box_2" target="_blank" value="Lg"
						id="left_menu3"></a></li>

					<li class="list_item"><a href="./notebook_main.html"
						class="aside_list_box_2" target="_blank" value="Samsung"
						id="left_menu4"></a></li>

					<li class="list_item"><a href="./notebook_main.html"
						class="aside_list_box_2" target="_blank" value="Lenovo"
						id="left_menu5"></a></li>

				</ul>
			</div>
		</div>

		<!-- 왼쪽 상단 메뉴바 끝-->

		<!-- 상단 광고판 -->
		<div class="Commercial_1">

			<div class="Commercial">
				<a href="" target="_blank"> <img
					src="https://orange.contentsfeed.com/RealMedia/ads/Creatives/danawa/acer_nb_e_700142_1612/acer_nb_700142_220321.jpg"
					alt="광고" id="mainimg"></a>
			</div>
		</div>
	</aside>

	<!-- 상단 광고판 끝 -->


	<!-- 오른쪽 상단 노트북 광고판 -->

	<aside class="right_Commercial_1">
		<div class="right_Commercial">
			<a href="" target="_blank"> <img
				src="//img.danawa.com/prod_img/500000/686/957/img/12957686_1.jpg?shrink=330:330&_v=20210118112409"
				alt="노트북"></a>

		</div>
	</aside>

	<aside class="right_Commercial_1">
		<div class="right_Commercial">
			<a href="" target="_blank"> <img
				src="//img.danawa.com/prod_img/500000/058/621/img/13621058_1.jpg?shrink=330:330&_v=20220125170310"
				alt="노트북"></a>
		</div>
	</aside>

	<aside class="right_Commercial_1">
		<div class="right_Commercial">
			<a href="" target="_blank"> <img
				src="//img.danawa.com/prod_img/500000/218/522/img/15522218_1.jpg?shrink=330:330&_v=20220215193732"
				alt="노트북"></a>
		</div>
	</aside>

	<aside class="right_Commercial_1">
		<div class="right_Commercial">
			<a href="" target="_blank"> <img
				src="//img.danawa.com/prod_img/500000/458/178/img/14178458_1.jpg?shrink=330:330&_v=20220304095558"
				alt="노트북"></a>
		</div>
	</aside>

	<aside class="right_Commercial_1">
		<div class="right_Commercial">
			<a href="" target="_blank"> <img
				src="//img.danawa.com/prod_img/500000/300/112/img/16112300_1.jpg?shrink=330:330&_v=20220224112729"
				alt="노트북"></a>
		</div>
	</aside>

	<aside class="right_Commercial_1">
		<div class="right_Commercial">
			<a href="" target="_blank"> <img
				src="//img.danawa.com/prod_img/500000/622/726/img/13726622_1.jpg?shrink=330:330&_v=20211122133048"
				alt="노트북"></a>
		</div>
	</aside>

	<!-- 오른쪽 상단 노트북 광고판끝 -->
<%
                 

   List<NoteBookInfoBean> notebeans = (List<NoteBookInfoBean>)request.getAttribute("currentList");
	NoteBookInfoBean notebean = new NoteBookInfoBean();
	int  currentPage =  (int)request.getAttribute("currentPage");
   int  currentBlock = (int)request.getAttribute("currentBlock");
   int total =  (int) request.getAttribute("total");
   int totalPage = (int) request.getAttribute("totalPage");
   int totalBlock = (int)    request.getAttribute("totalBlock");
   int  recordPerPage = (int)request.getAttribute("recordPerPage");
   int pagePerBlock = (int)request.getAttribute("pagePerBlock");
   int startPage = (int)request.getAttribute("startPage");
   int endPage = (int)request.getAttribute("endPage");
	// 전체검색
	NoteBookDAO nodao = new NoteBookDAO(); // mallinfo select for one notebook
	Mallinfo info = new Mallinfo();
	DecimalFormat formats = new DecimalFormat("#,###");  
	          
			String check = "";
			if((String)session.getAttribute("check") != null){
			 check = (String)session.getAttribute("check");
	          }
	%>

	<!-- 상세검색 체크박스 -->




	<div class="detailed_search_1_1">
		<h4 id="detailed_search"></h4>
	</div>

	<div id="check_box_">
		<div class="search_check_box">


			<!--===============================노트북 분류 하기 ===========================================  -->
			<form id="classification" method="get" action="/notebook/classification?pageNum=<%=request.getAttribute("pageNum")%>">
				<table cellspacing="0" cellpadding="0" id="border_1">
					
					<ul>
						<div>

							<tr>
								<td class="check_bottom1">
									<li>
										<!--    제조사별 분류   -->
										<h5 id="check_1">제조사별</h5>
								</li>
								</td>
								<td class="check_bottom">
									<li class="check"><input type="checkbox"
										class="clickcheckbox" id="company" name="company" value="LG전자">
										LG전자</input></li>
								</td>
								<td class="check_bottom">
									<li class="check"><input type="checkbox" name="company"
										id="company" class="clickcheckbox" value="삼성전자"> 삼성전자</input></li>
								</td>
								<td class="check_bottom">
									<li class="check"><input type="checkbox" name="company"
										id="company" class="clickcheckbox" value="APPLE">
										APPLE</input></li>
								</td>
								<td class="check_bottom">
									<li class="check"><input type="checkbox" name="company"
										id="company" class="clickcheckbox" value="레노버"> 레노버</input></li>
								</td>


								<td class="check_bottom">
									<li class="check"><input type="checkbox" name="company"
										id="company" class=clickcheckbox value="ASUS">ASUS</input></li>
								</td>


								<td class="check_bottom"></td>
							</tr>
						</div>
					</ul>




					<!--    화면크기 분류   -->

					<ul>
						<tr>
							<td rowspan="2" class="check_bottom1">
								<li>
									<h5 id="check_2">화면인치</h5>
							</li>
							</td>
							<td>
								<li class="check2"><input type="checkbox" name="screeninch"
									class="clickcheckbox" value="13">13인치이하</input></li>
							</td>
							<td>
								<li class="check2" id="check2_2"><input type="checkbox"
									class="clickcheckbox" name="screeninch" value="14">
									14인치 </input></li>
							</td>
							<td>
								<li class="check2" id="check2_3"><input type="checkbox"
									class="clickcheckbox" name="screeninch" value="15">
									15인치</input></li>
							</td>
							<td>
								<li class="check2" id="check2_4"><input type="checkbox"
									class="clickcheckbox" name="screeninch" value="16">
									16인치</input></li>
							</td>
							<td>
								<li class="check2" id="check2_5"><input type="checkbox"
									class="clickcheckbox" name="screeninch" value="17">
									17인치이상</input></li>
							</td>
						</tr>
						<tr>
							<td class="check_bottom"></td>
							<td class="check_bottom"></td>
							<td class="check_bottom"></td>
							<td class="check_bottom"></td>
							<td class="check_bottom"></td>
						</tr>
					</ul>

					<tr>





						<!--   노트북 무게분류    -->
						<ul>
							<td class="check_bottom1">
								<li>
									<h5 id="check_3">무게</h5>
							</li>
							</td>
							<td class="check_bottom">
								<li class="check3"><input class="clickcheckbox"
									type="checkbox" name="weight" value="1.3">1.3kg이하</input></li>
							</td>

							<td class="check_bottom">
								<li class="check3"><input type="checkbox"
									class="clickcheckbox" name="weight" value="1.5">1.5kg이하</input></li>
							</td>

							<td class="check_bottom">
								<li class="check3"><input type="checkbox"
									class="clickcheckbox" name="weight" value="1.7">1.7kg이하</input></li>
							</td>

							<td class="check_bottom">
								<li class="check3"><input type="checkbox"
									class="clickcheckbox" name="weight" value="1.9">1.9kg이하</input></li>
							</td>

							<td class="check_bottom">
								<li class="check3"><input type="checkbox"
									class="clickcheckbox" name="weight" value="2">2kg이상</input></li>
							</td>





							<td class="check_bottom"></td>
							<td class="check_bottom"></td>
							<td class="check_bottom"></td>
						</ul>

					</tr>


					<!--   메모리 별 분류    -->
					<tr>
						<ul>
							<td class="check_bottom1">
								<li>
									<h5 id="check_5">메모리</h5>
							</li>
							</td>
							<td class="check_bottom">
								<li class="check5"><input type="checkbox"
									class="clickcheckbox" name="memory" value="32"> 32GB이상</input></li>
							</td>
							<td class="check_bottom">
								<li class="check5"><input type="checkbox"
									class="clickcheckbox" name="memory" value="16"> 16GB</input></li>
							</td>

							<td class="check_bottom">
								<li class="check5"><input type="checkbox"
									class="clickcheckbox" name="memory" value="8"> 8GB</input></li>
							</td>


							<td class="check_bottom">
								<li class="check5"><input type="checkbox"
									class="clickcheckbox" name="memory" value="4"> 4GB이하</input></li>
							</td>
						</ul>
					</tr>

					<!--   usb 분류    -->
					<tr>
						<ul>
							<td class="check_bottom2">
								<li>
									<h5 id="check_6">USB</h5>
							</li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="usb" value="3">2개 이하</input></li>
							</td>

							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="usb" value="3">3개</input></li>
							</td>

							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="usb" value="4">4개</input></li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="usb" value="5">5개이상</input></li>
							</td>
					</tr>




					<!--   용도별 분류    -->
					<tr>
						<ul>
							<td class="check_bottom2">
								<li>
									<h5 id="check_6">용도</h5>
							</li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="purpose" value="사무/인강용">사무/인강용</input></li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="purpose" value="게임용">게임용</input></li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="purpose" value="그래픽작업용">그래픽작업용</input></li>
							</td>
					</tr>




					<!--   두께별 분류     -->
					<tr>
						<ul>
							<td class="check_bottom2">
								<li>
									<h5 id="check_6">두께</h5>
							</li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="thickness" value="17">17mm미만</input></li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="thickness" value="18">18mm</input></li>
							</td>
							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="thickness" value="19">19mm</input></li>
							</td>

							<td>
								<li class="check6"><input type="checkbox"
									class="clickcheckbox" name="thickness" value="20">20mm이상</input></li>
							</td>
					</tr>
					</ul>
				</table>
				<input type="submit" id="classSubmitBtn" value="체크박스검색">
                 
			</form>
			<%
			
			%>
			<button id="allnotebook" onclick="location='/notebook/pagenum?allnotebook=<%="allnotebook"%>'">전체보기</button>
			
		</div>


		<!-- ===========================================분류 끝 끝 ================================================ -->

	</div>


	<!-- 상세검색 체크박스 끝 -->

	<!-- <!-- 가격비교 -->











	<!-- 1) 노트북 정보 -->
 



	<div id="numberringwrap">
		<div id="move">
	
			<% if(notebeans != null){
				 
				%>
			<%for(int i = 0 ; i < notebeans.size(); i++) {
				
	          notebean = notebeans.get(i); // 아이템 하나
	       
	               
	          
	        %>


			<div class="notobook_1">

				<div class="notebook_img">
					<a href="/notebook/onenotebook?img=<%=notebean.getImg() %>"
						target="_blank"> <img src="<%=notebean.getImg() %>"
						id="allnotebookimg" style="width: 130px; height: 130px;" alt="노트북"
						title="노트북">
					</a>
				</div>

				<div>
					<div class="notebook_title">
						<a
							href="/notebook/onenotebook?subject=<%=notebean.getSubject()%>&nickname=<%=nickname%>"
							target="_blank"> <%=notebean.getSubject() %>

						</a>
					</div>
					<div class="notebook_content">
						<p>
							<%=notebean.getAllinfo() %>
						</p>
					</div>
				</div>
				<%                      
				    	ArrayList<Mallinfo> mallinfo =  nodao.mallinfo1(notebean.getSubject());
				  String logo = "";
				    %>
				<div class="notebook_min">
                      
					<%for(int j = 0; j < mallinfo.size(); j++) { 
						
						if(j == 7) break;
							Mallinfo mall = mallinfo.get(j);
							
							
				
							
							  String mallprice =  formats.format(Integer.parseInt(mall.getPrice()));
						%>
					<div id="logoAndPrice">
						<a href="<%=mall.getLink() %>" target="_blank"> 
						<%if(!mall.getLogo().equals("X")){ %>
						<img src="<%=mall.getLogo()%>"> 
						<span id="pricefont"><%=mallprice + "원"%></span>
						<%} %>
						
						
						<%if(mall.getLogo().equals("X")){ %>
						<span id="mallname"><%=mall.getMallname()%></span>
						<span id="pricefont"><%=mallprice + "원"%></span>
						<%} %>
						
						</a>

					</div>
					<% } %>
				</div> 






			 <div class="item_data">
					

					<span class="item_data_1"> 
		          <%if(session.getAttribute("email") != null){ %>
		</span> <a onclick="addInterest(<%=i%>)"><span class="item_data_1" id="productOfInterest<%=i%>">
		<button id ="productbutton">관심상품</button></span></a>
				<%} %>
				
				
				
				</div>
			</div>

			<input type="hidden" id="subject<%=i%>" name="subject"
				value='<%=notebean.getSubject()%>'> <input type="hidden"
				id="email<%=i%>" name="email" value='<%=email %>'>


			<%} %>
			<%} %>






			<div id="numbering">
				<%
				
   		 if(total  > 0){      //총개수   10         
    	
    	
	    	//시작 페이지 숫자를 설정
	    
	    	
	    	
	    
	    	
	    	if(endPage > totalPage) endPage = totalPage;
	    	
	    	 
	        if(startPage > pagePerBlock){
	    	%>
					<a href="/notebook/pagenum?pageNum=<%=startPage-5%>" id ="prev">[이전]</a>
					<%
	        }
	        //페이징처리
	       
	            out.print(startPage);
	            out.print(endPage);
	        for(int i = startPage; i <= endPage ; i++){
	        	 
	        %>
					<a id="pagenum" href="/notebook/pagenum?pageNum=<%=i%>">[<%=i %>]
					</a>
	
	
					<% 
	        }
	        
	        // 다음이라는 링크를 만들건지 파악
	        if(endPage < totalPage){
	        %>
					<a href="/notebook/pagenum?pageNum=<%=startPage+5%>" id = "next">[다음]</a>
	
					<%
	        }
        
    	}
				
				
     %>





			</div>


		</div>
	</div>



	<!--  <section class="notebook"> -->

	<!-- 페이지 설정 끝 -->

	<!-- <div class="footerwrap">
        <footer>
            <div>
           <ul>
              <li>주소 (우) 07995 서울특별시 양천구 목동동로 233-1, 501 (목동, 드림타워)대표이사: 손윤환, 안징현</li>  
              <li>사업자번호: 117-81-40065통신판매업: 제2004-서울양천-00918호부가통신사업: 제003081호</li>
               <br>
               <br>
              <li style="font-weight: bold;">(주)다나와는 상품판매와 직접적인 관련이 없으며, 모든 상거래의 책임은 구매자와 판매자에게 있습니다.</li>
              <li>이에 대해 (주)다나와는 일체의 책임을 지지 않습니다.</li>     
              <li>본사에 등록된 모든 광고와 저작권 및 법적책임은 자료제공사 (또는 글쓴이)에게 있으므로 본사는 광고에 대한 책임을 지지 않습니다.</li>
               <br>
               <br>
              <li>Copyright © danawa Co., Ltd. All Rights Reserved.
           </li>
            </ul>
           </div>
        </footer>

    </div> -->
	</div>








	<script>
	

	
    
     function addInterest(i) {
		// $("#productOfInterest"+i).click(function(){ //버튼 1을 클릭하면 
			 const subject= $("#subject"+i).val(); //num 태그 입력하값
			 console.log(subject);
			 const email = $("#email"+i).val();
			 
			 const notebook = {"subject" : subject , "email" : email};
			 
			 
			 $.ajax({   //백그라운드로 실행 
				 type : "post",
				 url  : "/notebook/productOfInterest",
				 contentType: 'application/json;charset=UTF-8', // 넘길 데이터 형태
				 data: JSON.stringify(notebook),  // 넘길 데이터값
				 //dataType: String,
				 success : function(txt){  //콜백함수 성공시 실행 할것 (txt) 실행결과값을
				  
					 console.log(txt);
				 	 console.log(typeof(txt));
					  
				 	 
				 	 if(parseInt(txt) == 1){
				  		//$("#result").html(txt);  //아이디가 result 인곳을찾아서 거기 에 html 을넣어라
				  		alert('관심상품이 등록되었습니다.');
				  
				  	}
					 else if (parseInt(txt) == -1) {
						 alert('관심상품 등록이 실패하였습니다.');
					 }
					 
					 else if (parseInt(txt) == -2) {
						 alert('이미 등록된 상품입니다.');
					 }
				 },
				 
				 error: function(txt){
				     	console.log("실패");
				 }
				 
		 	});
		 //});
		
     }
	

        let showmenu = document.getElementById('Allmenuwrap');
       document.getElementById('allmenus').addEventListener('mouseover' , function(){
          
        showmenu.style.visibility = "visible";
           
       })
       
       
       
       
       
       
       
       let showmenu1 = document.getElementById('Allmenuwrap');
       document.getElementById('Allmenuwrap').addEventListener('mouseout' , function(){
          
        showmenu1.style.visibility = "hidden";
            
            
           
       })
       
       
       let showmenu2 = document.getElementById('Allmenuwrap');
       document.getElementById('Allmenuwrap').addEventListener('mouseover' , function(){
          
        showmenu2.style.visibility = "visible";
            
            
           
       })
       
       
       
       const placeholder = document.getElementById('text');
       
       placeholder.addEventListener('click', function(){
               this.placeholder = '검색어를 입력해주세요';
               
       })
       
       
       placeholder.addEventListener('blur' , function(){
           this.placeholder = "♥♥♥♥ 2022년 새복많이 받으세요.♥♥♥♥";
       })
       
       
       document.querySelector('#clicknotebook').addEventListener('mouseover' , function(){
          
          $('#clicknotebook_1').show();
              // 노트북메뉴에 마우스 호버시 숨겨져있던 보조메뉴 호출 
              $('#hambuger1').hide();
       })
       
       
       document.querySelector('#clicknotebook').addEventListener('mouseout' , function(){
         
          $('#clicknotebook_1').hide();
           // 노트북메뉴에서 마우스 나갈시 보조메뉴숨김
           $('#hambuger1').show();
       })
       
       
         
       document.querySelector('#clicknotebook_1').addEventListener('mouseover' , function(){
          
          $('#clicknotebook_1 ').show();
            
            // 노트북메뉴에 마우스 호버시 숨겨져있던 보조메뉴 호출 
            $('#hambuger1').hide();
       })
       
       
       
       document.querySelector('#clicknotebook_1').addEventListener('mouseout' , function(){
         
          $('#clicknotebook_1 ').hide();
         // 보조메뉴에서 마우스가 나갈시 보조메뉴숨김
         $('#hambuger1').show();
       })
       
       document.querySelector('#clickimpo').addEventListener('mouseover' , function(){
         
         $('#clickimpo_1').show();
        // 정보메뉴에 마우스 호버시 숨겨져있던 보조메뉴 호출
        $('#hambuger2').hide();
        
       })
       
       
       document.querySelector('#clickimpo').addEventListener('mouseout' , function(){
        
         $('#clickimpo_1').hide();
           // 정보메뉴에 마우스 가 나가면 보조메뉴 숨기기
           $('#hambuger2').show();
       })
       
       
       
       document.querySelector('#clickimpo_1').addEventListener('mouseover' , function(){
        
         $('#clickimpo_1 ').show();
           // 정보메뉴 보조메뉴에 마우스 호버시 보조메뉴 계속유지
           $('#hambuger2').hide();
       })
       
       
       
       document.querySelector('#clickimpo_1').addEventListener('mouseout' , function(){
        
         $('#clickimpo_1 ').hide();
          // 보조메뉴에서 마우스가 나갈시 보조메뉴숨김
          $('#hambuger2').show();
       })  
       
       document.querySelector('#menu_1').addEventListener('mouseover' , function(){
         
         $('#iconclick').show();
         $('#hambuger2').hide();
        
       
       })   // 로그인아이콘에 마우스를갖다대면 숨겨져있던 보조메뉴호출 
       
       document.querySelector('#iconclick').addEventListener('mouseover' , function(){
         
         $('#iconclick').show();
         $('#hambuger2').hide();
        
       
       })  //마우스를 보조매뉴에 갖다대고있으면 없어지지않고 보조메뉴 계속유지
       
       document.querySelector('#iconclick').addEventListener('mouseout' , function(){
        
         $('#iconclick').hide();
        
         // 로그인 아이콘에서 마우스가 나갈시 보조메뉴숨김 
         $('#hambuger2').show();
       })  
       
       
       
       document.querySelector('#menu_1').addEventListener('mouseout' , function(){
         $('#iconclick').hide();
         // 보조메뉴에서 마우스가 나갈시 보조메뉴숨김
         $('#hambuger2').show();
       })
       

	
       
       </script>
</body>

</html>
</body>
</html>