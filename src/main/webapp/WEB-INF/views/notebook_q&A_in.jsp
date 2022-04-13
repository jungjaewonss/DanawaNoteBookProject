<%@page import="Danawa.Project1.Dto.ReBoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Danawa.Project1.Dto.BoardBean"%>
<%@page import="Danawa.Project1.Dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style1.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
      <script src="slide.js"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
      <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Source+Sans+Pro&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/resources/css/notebook_q&A_in.css">

 

</head>

<body>
             <!--  -->
           <%@include file="./header.jsp"%>
            
           

  
  <section id="board">
   

    

<%
request.setCharacterEncoding("utf-8");
BoardBean oneBean = (BoardBean)session.getAttribute("bean");


 
 BoardBean countbean = new BoardBean();


%>  
  <input type = "hidden" id=num value="<%=oneBean.getNum()%>">
 
  

  <div id="board_area">
    <table  align="left" width="90%" style="padding-top: 3%;">
        <thead style="font-size: 25px;">
            <tr align = "left">
                <th><%=oneBean.getSubject() %></th>
              </tr>
          </thead>
          
          <tbody>
          <tr align="left" style="font-size: 15px; color: rgb(189, 157, 219);">
            <td colspan="2"  style="border-bottom: 1px solid lightgray ;">
                 <div id = "retitle">
                <b><%=oneBean.getWriter()%></b> 
                <b><%=oneBean.getReg_date() %></b>       
                <i class="fas fa-eye"><%=oneBean.getReadcount() %></i> <!--조회수  -->
                <i class="far fa-grin-hearts"></i>   <!--공감  -->
                 
             <!-- ======================================================== -->
               <div id = "updateDelete">
               
               
               <form action="/board/boardmodify" method = "post">  
                 <input type = "hidden" name = "writer" value = "<%=nickname %>" >
                 <input type = "hidden" name = "num" value = "<%=oneBean.getNum() %>" >
                 <input type = "hidden" name = "subject" value = "<%=oneBean.getSubject() %>" >
                 <input type = "hidden" name = "content" value = "<%=oneBean.getContent() %>" >
                 <input type = "hidden" name = "password" value = "<%=oneBean.getPassword()%>" >
               <%if(session.getAttribute("email").equals(oneBean.getEmail())){ %>
               <input id ="modify" type ="submit" value ="수정하기">
               <%} %>
               </form>
               
               
               
               
             
              
                <form action="/board/boardDel" method = "post">
                                                           <!--데이터베이스에들어가있는하나의정보  -->
                 <input type = "hidden" name = "num" value = "<%=oneBean.getNum() %>" >
                 <input type = "hidden" name = "subject" value = "<%=oneBean.getSubject() %>" >
                 <input type = "hidden" name = "content" value = "<%=oneBean.getContent() %>" >
                 <input type = "hidden" name = "password" value = "<%= oneBean.getPassword()%>">
                 <input type = "hidden" name = "writer" value =  "<%= nickname%>">
                 <%if(session.getAttribute("email").equals(oneBean.getEmail())){ %>
                 <input id = "modify" type = "submit" value = "삭제하기">
               <%} %>
               </form>
               
               
               </div>
               
           
              
              
               
            <!-- ======================================================== -->
               
                </div>
            </td>
            <!-- <td> 2022.02.04
                <i class="fas fa-heart">10</i>
                <i class="fas fa-heart">7</i>
                <i class="fas fa-heart">1</i>
            </td> -->
          </tr>

          

          <tr align="left" style="font-size: 15px; color: black;">
            <td colspan="2"><%=oneBean.getContent() %></td>
            
          </tr>
          </tbody>
    </table>

    

  </div>

  <div id="attention" align="center" style="padding-top: 10%; padding-bottom: 3%; border-bottom: 1px solid lightgray;">
    <p style="font-size: 15px;">공감/비공감을 눌러주세요</p>
     
    <a href="#"><i class="far fa-grin-hearts" style="font-size: 50px; color: rgb(189, 157, 219);" id = "clicklike" onclick=></i></a>
      
    
    <a href="#"><i class="far fa-frown" style="font-size: 50px; color: rgb(189, 157, 219); padding-left: 20px;" id = "clickdislike"></i></a>
  </div>


  <div style="padding-top: 2%; margin-left: 10%; padding-bottom: 3%">
   
   <!--댓글  -->
    <h3 id="review_1" >댓글</h3>
    <div id="review" align="center">
        
        <!-- ========================================================= -->
        
        
        
        
         <form action="/board/boardrewrite" method = "post">
      <table align="center"  style="width: 80%; border-collapse: collapse;">
  <thead align="left">
      <tr>
        </tr>
    </thead>
    
    <tbody align="left">
    <tr>

      <td rowspan="2" style="padding: 8px; border-top: 1px solid black; border-bottom: 1px solid rgb(228, 224, 224);"><i class="fas fa-camera" style="font-size: 50px; color: thistle;"></i>
      </td>
      <td colspan="2" style="padding: 8px; border-top: 1px solid black; border-bottom: 1px solid rgb(228, 224, 224);  border-left: 1px solid rgb(228, 224, 224);">
          <input type = "hidden" name = "num" value=<%=oneBean.getNum()%>>
          <input type = "hidden" name = "writer" value=<%=nickname%>>
         <textarea rows="10" cols="100" name = "content"></textarea> 
           <input type = "button" value = "목록보기" id = "rewritesubmit" onclick ="location.href='/board/returnlist?nickname=<%=nickname%>'">
          <input type = "submit" value = "답글쓰기" id = "rewritesubmit"  >
        
         </td>
          
         
      
    </tr>
    </tbody>
</table>

</form>
<%-- <%} %> --%>
        <!-- ========================================================= -->

  </div>


        
</div>

 <!--================================================================================================ 로그인정보다시받아와야함  -->
<div id="table2" style="padding-bottom: 10%;">


<% 
   int renum = oneBean.getNum();
 BoardDAO dao = new BoardDAO();
ArrayList<ReBoardBean> rebean = dao.getAllReBoard(renum); //데이터베이스에들어가있는 정보를 뿌려주는 역활


%>

<% 
for(int i = 0; i < rebean.size(); i++){ 
    ReBoardBean rebeans = rebean.get(i);
    %>

<table align="center"  style="width: 80%; border-collapse: collapse;">
  <thead align="left">
      <tr>
          <th style="color: black; background-color: rgb(241, 227, 227); border-bottom: 1px solid white;"></th>
          <th style="color: black; background-color: rgb(241, 227, 227); border-bottom: 1px solid white;"><i class="fas fa-id-card" style="color: lightsteelblue;"></i> : <%= rebeans.getWriter() %>   </th>
          <th style="color: black; background-color: rgb(241, 227, 227); border-bottom: 1px solid white;"><i class="far fa-calendar-alt" style="color: lightsteelblue;"> </i> : <%=rebeans.getReg_date() %></th>
          <th style="background-color: rgb(241, 227, 227);"> </th>
        </tr>
    </thead>
    
    <tbody align="left">
    <tr>
                   
      <td rowspan="2" style="padding: 8px; border-top: 1px solid black; border-bottom: 1px solid rgb(228, 224, 224);"><i class="fas fa-camera" style="font-size: 50px; color: thistle;"></i>
      </td>
      <td colspan="2" style="padding: 8px; border-top: 1px solid black; border-bottom: 1px solid rgb(228, 224, 224);  border-left: 1px solid rgb(228, 224, 224);">
         <%= rebeans.getContent() %></td> 
      <td align="center" style="border-left: 1px solid rgb(228, 224, 224); border-bottom: 1px solid rgb(228, 224, 224);" > 
        <a href="#"><i class="far fa-grin-hearts" style="font-size: 30px; color: rgb(189, 157, 219);"></i></a>
        <a href="#"><i class="far fa-frown" style="font-size: 30px; color: rgb(189, 157, 219); margin-top: 2px;"></i></a>
      </td>
    </tr>
    </tbody>
</table>

 <% } %>




</div>
</div>

</section>





  <div class="footerwrap" >
    <footer>
        <div  >
       <ul id="footer1">
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

    let clicklike = document.getElementById('clicklike');
    document.getElementById('clicklike').addEventListener('click', function(){
    	clicklike.style.color = "red";
   	 dislike.style.color = "#ddbee9";
    })
    
   let dislike = document.getElementById('clickdislike');
    document.getElementById('clickdislike').addEventListener('click', function(){
   	 dislike.style.color = "blue";
   	clicklike.style.color = "#ddbee9";
    })

    
  
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