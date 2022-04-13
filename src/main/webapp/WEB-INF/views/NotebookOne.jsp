<%@page import="com.fasterxml.jackson.core.format.DataFormatDetector"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Danawa.Project1.Dto.NoteBookInfoBean"%>
<%@ page import="Danawa.Project1.Dto.Mallinfo"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="slide.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lato&family=Source+Sans+Pro&display=swap"
	rel="stylesheet">
 <link rel="stylesheet" href="/resources/css/NotebookOne.css">


</head>

<body>
	<!--  -->
		<%@include file="./header.jsp"%>

	<!--  -->

	<%
         NoteBookInfoBean onenotebook =  (NoteBookInfoBean)session.getAttribute("onenotebook");
	       ArrayList<Mallinfo> mallinfo = (ArrayList<Mallinfo>)session.getAttribute("mallinfo");
	       Mallinfo info = new Mallinfo();
	       String price = "";
	       
	         for(int i = 0 ; i < onenotebook.getPrice().length();  i++){
	        	 if((i+1) % 3 == 0){
	        		   price += ",";
	        	   }
	        	 price+= onenotebook.getPrice().charAt(i);
	        	   
	         }
	       // String subjects = 
	         
           %>

	<!-- 맨위 상단 노트북 설명 -->
	
	<section class="content">
		<div>
			<!-- 노트북 이름 -->
			<div class="content_title">
				<h2 id ="subject"><%=onenotebook.getSubject() %></h2>
			</div>

			<!-- 노트북 상세정보 -->
			<div class="content_content">
				<p><%=onenotebook.getAllinfo() %></p>
			</div>

			<!-- 관심상품 -->
			<div class="disinterest">
				<a href="./wishList.html">
					<p id="font"></p> </a>
			</div>
			<div id="content_siez"></div>
		</div>
	</section>


	<!-- 노트북 최저가 비교  -->
	<div id="allwrap">
	<section class="Information">
	

			<div id = "onenotebookwrap">

				<!-- 노트북 이미지 -->
				<div class="note_img_size">
					<a href="<%=onenotebook.getUrl() %>" target="_blank"> <img
						src="<%=onenotebook.getImg() %>" width="429px" height="400px"
						alt="노트북"></a>
				</div>
				
				
				<!-- 노트북 최저가 사이트 -->
				<%
				 DecimalFormat formats = new DecimalFormat("#,###");  
			        String minprice =  formats.format(Integer.parseInt(mallinfo.get(0).getPrice()));
				%>
				
				<div id = "pricwrap">
				<div id="lowest_price">
					<span id="low" style="font-size: 17px; font-weight: bold;">최저가</span>
					
						
					 <%if(session.getAttribute("email") != null){ %>	
					<a href="<%=mallinfo.get(0).getLink()%>"><span id="minprice"
						style="color: blue; font-size: 26px; font-weight: bold;"><%=minprice%></span>
					<button	id="low_button"	style= "background-color: black; color: white;  height:43px; font-weight: bold;">
					 최저가구매하기
					</button>
					</a>
					
					 <button id ="allnotebookList" onclick="location='/notebook/pagenum'">전체리스트</button>
					 <button id ="productOfInterest">관심상품등록</button>
					 <%} %>
					 
					 
					  <%if(session.getAttribute("email") == null){ %>	
					<a href="<%=mallinfo.get(0).getLink()%>"><span id="minprice"
						style="color: blue; font-size: 26px; font-weight: bold;"><%=minprice%></span>
					<button	id="low_button"	style= "background-color: black; color: white;  height:43px; font-weight: bold;">
					 최저가구매하기
					</button>
					</a>
					 <button id ="allnotebookList" onclick="location='/notebook/pagenum'">전체리스트</button>
					
					 <%} %>
					 
					 
					 
					 
					 </div>
					 <input type = "hidden" id = "email" value = <%=email %>>
					 
					  <%
                String mallprice = "";
                DecimalFormat format = new DecimalFormat("#,###");              
                for(int i = 0 ; i < mallinfo.size() ; i++ ) {
                	if(i == 10) break;
                	info = mallinfo.get(i);

                mallprice = format.format(Integer.parseInt(info.getPrice()));
                  
                	 
                
                
                	 if(info.getLogo().equals("http://img.danawa.com/new/noData/img/noImg_80.gif"))continue;
                %>
				<div id="low_price">
					<span> <a href="<%=info.getLink()%>"><img id="low_price_img_2"
							src="<%=info.getLogo() %>"
							alt="<%=info.getMallname() %>" width="52px" height="24px"></span>
					
					<span class="low_price_font" id="low_price_font_1"style="font-size: 14px;">
					<%=mallprice+"원"%> </a>
					</span> 
					
					<span class="low_price_font" id="low_price_font_1"
						style="font-size: 13px;"><%=info.getShipping() %></span>
						
				    <span class="low_price_font"
						id="low_price_font_1" style="font-size: 13px;"></span>
				
				</div>
                 <%} %>
                 
			</div>		
				</div>

                   
               
	</section>


	<section id="table">
		<div class="table_size">
			<table cellspacing="0" cellpadding="0" id="table_1">
				<tr>
					<td class="table_1_1">제조회사</td>
					<td class="table2"><%=onenotebook.getCompany() %></td>
					<td class="table_1_1">등록년월</td>
					<td class="table2">2022년 03월</td>
				</tr>
				<tr>
					<td class="table_1_1">화면크기</td>
					<td class="table2"><%=onenotebook.getScreeninch() + "인치" %></td>
					<td class="table_1_1">메모리</td>
					<td class="table2"><%=onenotebook.getMemory() + "GB" %></td>
				</tr>
				<tr>
					<td class="table_1_1">용도</td>
					<td class="table2"><%=onenotebook.getPurpose() %></td>
					<td class="table_1_1">노트북두께</td>
					<td class="table2"><%=onenotebook.getThickness() + "mm" %></td>
				</tr>
				<tr>
					<td class="table_1_1">USB 개수</td>
					<td class="table2"><%=onenotebook.getUsb() + "개" %></td>
					<td class="table_1_1">코어 수</td>
					<td class="table2">쿼드코어</td>
				</tr>
				<tr>
					<td class="table_1_1">제조사및모델명</td>
					<td class="table2"><%=onenotebook.getSubject() %></td>
					<td class="table_1_1"></td>
					<td class="table2"></td>
				</tr>
				<tr>
					<td class="table2" colspan="4" style="font-weight: bold;">디스플레이</td>

				</tr>

				<tr>
					<td class="table_1_1">화면 비율</td>
					<td class="table2">16:10</td>
					<td class="table_1_1">해상도</td>
					<td class="table2">2560x1600(WQXGA)</td>
				</tr>

				<tr>
					<td class="table_1_1">DCI-P3</td>
					<td class="table2">99%</td>
					<td class="table_1_1">패널 종류</td>
					<td class="table2">IPS</td>
				</tr>

				
                
				

			</table>
		</div>
	</section>
</div>

	

		<div class="footerwrap">
			<footer>
				<div>
					<ul>
						<li>주소 (우) 07995 서울특별시 양천구 목동동로 233-1, 501 (목동, 드림타워)대표이사:
							손윤환, 안징현</li>
						<li>사업자번호: 117-81-40065통신판매업: 제2004-서울양천-00918호부가통신사업:
							제003081호</li>
						<br>
						<br>
						<li style="font-weight: bold;">(주)다나와는 상품판매와 직접적인 관련이 없으며, 모든
							상거래의 책임은 구매자와 판매자에게 있습니다.</li>
						<li>이에 대해 (주)다나와는 일체의 책임을 지지 않습니다.</li>
						<li>본사에 등록된 모든 광고와 저작권 및 법적책임은 자료제공사 (또는 글쓴이)에게 있으므로 본사는 광고에
							대한 책임을 지지 않습니다.</li>
						<br>
						<br>
						<li>Copyright © danawa Co., Ltd. All Rights Reserved.</li>
					</ul>
				</div>
			</footer>
		</div>
	</div>

<input type = "hidden" id = "result" value = "" >```  
	</div>
	<script>

    
	
	

		 $("#productOfInterest").click(function(){ //버튼 1을 클릭하면 
			 const subject= $("#subject").text(); //num 태그 입력하값
			 const email = $("#email").val();
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
		 });

	
	
	
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