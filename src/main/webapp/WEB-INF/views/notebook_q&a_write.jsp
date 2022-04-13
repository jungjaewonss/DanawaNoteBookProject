<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style2.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
      <script src="slide.js"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

      <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Source+Sans+Pro&display=swap"  rel="stylesheet">


<script src="./summernote-0.8.18-dist/summernote-lite.js"></script> 
<script src="./summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script> 
  <link rel="stylesheet" href="/resources/css/notebook_q&a_write.css">



</head>


 
<body>
	 <%@include file="./header.jsp"%>
           
         
      
    <main role="main" class="container" >
      <div id="title_1" style="text-align: left; margin-bottom: 20px;">
        <h2 id="title">노트북 Q&A</h2>
      </div>

      <div id="subtitle" style="text-align: right;">
        <a href="./notebook_q&a_main.html" style="color: slateblue; text-decoration: underline;">노트북 Q&A</a>
        <i class="fas fa-angle-right"></i>
        <a href="./notebook_q&a_write.html" style="color: slateblue; text-decoration: underline;">글쓰기</a>
      </div>

      <div id="title_2" style="text-align: center; margin-bottom: 20px; margin-top: 30px; border-top: 1px solid lightgray;">
        <h4 id="title" style="margin-top: 30px;">글쓰기</h4>
      </div>
      
     
      
      <!--=============================================================================  -->
     
     
      <form class="form_1" name="form" method="post" action="/board/writeok">
        <div class="pt-1" style="border:1px solid gainsboro ; width: 100%; height: 70px; display: flex; align-items: center;">
          <label style="padding-right: 20px; padding-left: 10px;">제목</label>
          <input type="text" name="subject" placeholder="제목을 입력하세요" style="border-radius: 5px; width: 93%; ">
        </div>
        
        <div class="pt-1" style="border:1px solid gainsboro ; width: 100%; height: 150px; display: flex; align-items: center;">
          <label style="padding-right: 20px; padding-left: 10px;">내용</label>
            <textarea rows="8" cols="145" name ="content"></textarea>
        </div>
        
  

        <div class="pt-1" style="border:1px solid gainsboro ; width: 100%; height: 70px; display: flex; align-items: center; margin-bottom: 20px;">
          <label style="padding-right: 20px; padding-left: 10px;">비밀번호</label>
          <input type="password" name="password" placeholder="입력 안할 시 전체공개" style="border-radius: 5px; width: 30%; ">
        </div> 
        
        <%
       String writer = nickname; //writer 는없고 //현재로그인중인사람의 닉네임정보  
        %>
        
        
            <input type = "hidden" name ="writer" value = <%=writer%> >
            <input type = "hidden" name ="email" value = <%=email%>>
          <button id="submit" type="submit" >등록</button>
      
           <button id="reset" type="reset" >전체지우기</button>
          <input type = "button" onclick ="location.href ='notebook_q&a_main.jsp" value = "전체게시글보기" id = ""> 
      </form>
      <!--=============================================================================  -->
  <div align="center" style="margin-bottom: 20px; " >
         
         
          
        </div>
    </main>



        <div class="footerwrap">
            <footer>
                <div>
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

    
            $(document).ready(function() { 	
            //여기 아래 부분 	
            $('#summernote').summernote({ 		 
            height: 400, // 에디터 높이 		 
            minHeight: null, // 최소 높이 		 
            maxHeight: null, // 최대 높이 		 
            focus: true, // 에디터 로딩후 포커스를 맞출지 여부 		 
            lang: "ko-KR",					// 한글 설정 		 
            placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정 	
            }); });

            
            
            
            
            
            
            
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