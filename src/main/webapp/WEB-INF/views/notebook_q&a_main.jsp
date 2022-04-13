<%@page import="java.util.List"%>
<%@page import="oracle.net.aso.b"%>
<%@page import="Danawa.Project1.Dao.BoardDAO"%>
<%@page import="Danawa.Project1.Dto.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/8f82cb2f38.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/resources/css/notebook_q&a_main.css">
</head>

 
<body>
<%@include file="./header.jsp"%>

<div id="board">
  <h1 id="title">Q&A노트북질문게시판</h1>


  <div id="board_area">
    <div id="board_bottom">
  <table  align="center" width="90%">
  <thead>
      <tr>
          <th>번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>작성일</th>
          <th>조회수</th>
        </tr>
    </thead>
    
 


<%
List<BoardBean> beans = (List<BoardBean>)request.getAttribute("currentList");
int  currentPage =  (int)request.getAttribute("currentPage");
int  currentBlock = (int)request.getAttribute("currentBlock");
int total =  (int) request.getAttribute("total");
int totalPage = (int) request.getAttribute("totalPage");
int totalBlock = (int)    request.getAttribute("totalBlock");
int  recordPerPage = (int)request.getAttribute("recordPerPage");
int pagePerBlock = (int)request.getAttribute("pagePerBlock");
int startPage = (int)request.getAttribute("startPage");
int endPage = (int)request.getAttribute("endPage"); 

 BoardBean bean =  new BoardBean();

%>

  
 <% for(int i = 0 ; i < beans.size(); i++){
	
	 bean = beans.get(i);
	
	
	
	%>
	
    <tbody align="center">
    <tr>
      
      <td>
      <%
      String url ="/board/inboard";
      if(!(bean.getPassword().equals("default"))){
    	  url = "/board/pwdcheck";
      }
      %>
      
      <%=bean.getNum()%>
      </td>
      <td><a href="<%=url%>?num=<%=bean.getNum()%>&nickname=<%=nickname%>" id ="clickinboard"> <!-- 제목을누르면 그게시물의 num 을 in 에 보내줌  -->
<%=bean.getSubject() %> <b id ="commentcolor"> &nbsp;<%= "[" + bean.getCommentcount() + "]" %></b>
       <%if(!bean.getPassword().equals("default")){ %>
        <i class="fa-solid fa-lock" id = "lock"></i>
  <%} %>
      </a>

      </td>
      <td><%= bean.getWriter() %></td>
      <td><%= bean.getReg_date() %></td>
      <td><%= bean.getReadcount()%></td>
    </tr>
     
    </tbody>



<% }%>

                                    <div id = "numbering">

                                        <%  	
                                 		 if(total  > 0){      //총개수   10         
                                  	
                                  	
                              	    	//시작 페이지 숫자를 설정
                              	    	if(endPage > totalPage) endPage = totalPage;

                              	        if(startPage > pagePerBlock){
                              	    	%>
										<a href="/member/myitem?pageNum=<%=startPage-5%>">[이전]</a>
										<%
                              	        }
                              	        //페이징처리
                              	       
                              	           
                              	        for(int i = startPage; i <= endPage ; i++){
                              	        	 
                              	        %>
										<a id="pagenum" href="/member/myitem?pageNum=<%=i%>">[<%=i%>]
										</a>


										<% 
                              	        }
                              	        
                              	        // 다음이라는 링크를 만들건지 파악
                              	        if(endPage < totalPage){
                              	        %>
										<a href="/member/myitem?pageNum=<%=startPage+5%>">[다음]</a>

										<%
                              	        }
                                      
                                  	}
                              				
                              				
                                   %>
	
</div>	


</table>
</div>
</div>


<div id="search" align="center">
       <form action="/board/searchbox">
       <select name ="selectbox" id = "selectbox">
       
       <option value="selectnum">번호</option>
       <option value="selectsubject">제목</option>
       <option value="selectwriter">작성자</option>
      
       </select>
      
      <input type="text" id="searchBox"  name="textsearch" placeholder="검색어를 입력해주세요."/>
      <input type="submit" id="searchBtn" value="검색">
      <input type="button" id="Allboardlist" value="전체보기" onclick="location.href='/board/listmain'">
      <label for="글쓰기button"></label>
       
        <%if(session.getAttribute("email")!=null) {%>
       <input id="글쓰기button" value="글쓰기" type="button" style="color: black; border-color: rgb(140, 119, 160);"
      onclick="location.href='/board/write?nickname=<%=nickname%>&email=<%=email%>'">
      <%} %>
       </form>
     

     
</div>  


<!-- 페이징 해야할곳 -->
   
</div>


        <div class="footerwrap">
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
            </div>

            <script>
             
            
    

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