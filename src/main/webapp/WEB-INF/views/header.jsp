<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="Danawa.Project1.Dto.Member"%>
<%@page import="org.springframework.ui.Model"%>
    <%@ page import = "Danawa.Project1.Dao.UserDAO"%>
    <%@ page import = "java.io.PrintWriter"%>
    <%@ page import = "Danawa.Project1.Dao.NoteBookDAO"%>
    <%@ page import = "Danawa.Project1.Dto.NoteBookInfoBean"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style >
#hiddensubmit{
 visibility: hidden;
}

#iconclick{
 display: none;
     border: 1px solid black;
     border-radius: 4px;
     position: absolute;
     width: 110px;
     background-color: white;
}


body{
     margin: 0px;
 padding: 0px;    
 font-family: 'Source Sans Pro', sans-serif
 
 }
 
 #hiddensubmit{
  visibility: hidden;
 }
 
 .Allmenu_menu{
     position: relative;
     
     bottom: -15px;
     padding-top: 18px;
     color:rgba(255, 255, 255, 0.466) ;
     font-size: 10px;
     
 }
 
 #Allmenu{
     display: flex;
     width: 1100px;
    
     justify-content: space-around;
     margin: 0 auto;
    
    
 }
 
 
 #Allmenuwrap{
     background-color:rgba(0, 0, 0, 0.774);
     height: 250px;
     margin-top: -30px;
     padding-top: 20px;
     visibility: hidden;
    
     
     
 }
 
 #Allmenuwrap:hover{
     visibility: hidden;
 }
 
 
 .svmenu{
     color: rgba(255, 255, 255, 0.863);
     font-weight: bold;
     font-size: 15px;
 }
 

 
 

 
 
  
 .buttons:hover{
     cursor: pointer;
 }
 

 
 #clicknotebook_1 span:hover , #iconclick span:hover , #clickimpo_1 span:hover{
     
    border-radius: 1px;
     text-decoration: 2px solid underline ;
     width: 100%;
     transition:  0.5s;
    
 
     
 }
 
 

 
 

 .menuborderbottom:hover{
     border-bottom: 5px solid rgba(255, 192, 203, 0.658);
     border-spacing: 50px;
     transition: 0.2s;
     border-radius: 2px;
 }
 
 
 
 
 
 

 
 
 #adslide{
     display: flex;
     
 }
 #fixs{
     position: sticky;
     left: 50px;
     top: 200px;
     margin: 0 auto;
 }
 
 
 .articlegoods{
     margin-top: 150px;
 }
 
 #navwrap{
     display: flex;
     width: 100%;
     margin-bottom: 30px;
    
 }

 
 #text{
     width: 500px;
    
    
     /* background-position: right; */
     
     height: 50px;
     /* border: 1px transparent; */ 
      border-left: 1px solid #c3f8a4;
     border-top: 1px solid #5df542;
     border-right: 1px solid #42f5f5;
     border-bottom: 1px solid #42e3f5;
     border-radius: 4px;
 
 
     /* border: 1px solid #c3f8a4 1px solid #5df542 1px solid #42f5f5 1px solid #42e3f5; */
 }
 header{
     width: 1200px;
     display: flex;
    margin: 0 auto;
     align-items: center;
     justify-content: space-between;
     font-family: 'Lato', sans-serif;
 font-family: 'Source Sans Pro', sans-serif
    
    
 }
 
 nav{
     width: 1200px;
     margin: 0 auto;
    
 }
 
 
 
 
 
 .icons i{
     padding: 10px;
     
 }
 .icons{
    
     display: flex;
 }
 
 .nav_ul{
     display: flex;
     justify-content: space-between;
     list-style: none;
     text-decoration: solid underline;
     
     
     
 }
 
 
 

 #iconclick div {
     padding-top : 10px;
     text-align: center;
 }
 
 .bestadd{
     text-align: end;
 }
 
 #clickimpo_1{
     border: 1px solid pink;
     display: none;
     border-radius: 4px;
     position: absolute;
     width: 140px;
     background-color: white;
     text-align: center;
     margin-left: -28px;
     
 }
 
 
 #clickimpo_1img{
     position: relative;
     top:  5px;
 }
 
 
 #clickimpo_1 div{
     padding: 10px;
    
     text-align: center;
 }
 
 #clicknotebook_1{
     display: none;
     border : 1px solid pink;
     border-radius: 5px;
     position: absolute;
     width: 142px;
     background-color: white;
     margin-left: -40px;
     transition: 0.5s;
     
     
 }
 #clicknotebook_1 div{
     padding: 10px;
     text-align: center;
 }
 
 #hambuger1 , #hambuger2{
     position: absolute;
     margin-top: 4px;
     margin-left: 3px;
 }
 
 

 
 


 
 

 
 .menu{
     width: 70px; height: 500px;
      position: fixed; 
     border: 1px solid gray;
     border-radius: 5px;
     background-color: rgba(0, 0, 0, 0.671);
     display: flex;
     flex-direction: column;
     justify-content: space-around;
     align-items: center;
     color: black;
 
     top: 400px;
     
 }



 
 #horizontal-underline{
      position: absolute;
      width: 100%;
      background-color: rgba(255, 255, 255, 0.473);
      top: 70px;
      left: 0px;
      height: 4px;
      transition: 0.5s;
      border-radius: 10px;     
 }
 
 
 
 


 
 .menublock{
     display: block;
     width: 100%;
     text-align: center;
 }
 
 
#iconclick{
 width: 140px;
 text-align: left;
 border: 1px solid pink;

}
 
 #menulogout{
  position: relative;
  right: 8px; 
 }

#menumodify{
position: relative;
  right: 8px; 
}

#login , #join{
position: relative;
right: 10px;
}



</style>
</head>
<body>
 
    <div class="content1">
      <div class="headerwrap">
        <header >
       
        <div class="logo">
            <%if(session.getAttribute("email") != null){ %>
            <a href="/member/getlogin"><img src="http://img.danawa.com/new/danawa_main/v1/img/ciLogger_20220118_03_23_31.jpg"
           alt="logo"></a>
           <%} %>
           
            <%if(session.getAttribute("email") == null){ %>
            <a href="/"><img src="http://img.danawa.com/new/danawa_main/v1/img/ciLogger_20220118_03_23_31.jpg"
           alt="logo"></a>
           <%} %>
           
         
        </div>


        <div class="input">
             <form action="/notebook/textsearch">
             
            <input type="text" id="text" name="textSearch"  placeholder="♥♥♥♥ 2022년 새복많이 받으세요.♥♥♥♥" style="text-align: center;">
            <input type = "submit" value = "검색" id = "hiddensubmit">
            </form>
        </div>

        <div class="icons">
        <%
          
        	String email = (String)session.getAttribute("email");
        	String nickname =(String)session.getAttribute("nickname");
        %>
        
             <%if(email != null){ %>
            <i class="fas fa-user"> <%=nickname%></i>
           <a href="/member/myitem"> <i class="fas fa-heart">관심상품</i></a>
           <div>
           <a href="/logout/main" id="menu_1"><i class="fa-solid fa-door-open"></i> 로그아웃</i></a>
                                              
         
           <div id="iconclick" >
          <a href="/logout/main"> <div><span class="menuborder" id = "menulogout"><i class="fa-solid fa-door-open"></i>로그아웃</span></div></a>
          <a href="/member/checkingPwd?email=<%=email%>&nickname=<%=nickname%>"> <div><span  class="menuborder" id="menumodify"><i class="fa-solid fa-file-pen"></i>정보수정</span></div>
           <a href="/member/mypage?nickname=<%=nickname%>&email=<%=email%>"> <div><span  class="menuborder"><i class="fa-solid fa-basket-shopping" ></i>마이페이지</span></div></a>
          
          </a>
        </div>
        </div>
        
    </div>
    </header>
</div>
</div>
    <%} %>
    
    <%if(email == null){ 
         nickname="손님";
         email = "";
    %>
     <i class="fas fa-user"> <%=nickname%></i>
           <div>
           <a href="/member/clicklogin" id="menu_1"><i class="fa-solid fa-door-closed"></i>로그인</i></a>
                                              
         
           <div id="iconclick" >
          <a href="/member/clicklogin"> <div><span class="menuborder" id="login"><i class="fa-solid fa-door-closed"></i>로그인 </span></div></a>          
          <a href="/member/clickinsert"> <div><span class="menuborder" id="join"><i class="fa-solid fa-feather-pointed"></i>회원가입</span></div></a>          
          </a>         
        </div>
        </div>
        
    </div>
    </header>
</div>
</div>
    <%} %>
    
    
    
    
    <div id="navwrap">
    <nav>
        <ul class="nav_ul">

            <a href="#"><li class="menuborderbottom" id="allmenus">전체메뉴보기</li></a>



             <div id="clicknotebook">
            <a href="/notebook/pagenum?nickname=<%=nickname%>"><li><span class="menuborderbottom"> 노트북</span> <i class="fas fa-bars" id="hambuger1"></i> </i></i></li> </a>
        
            <br>
            <div id="clicknotebook_1">
               
                <a href="/notebook/pagenum?nickname=<%=nickname%>"><div> <span class="menuborder"> <i class="fas fa-laptop"></i> 노트북전체 </span> </div></a>
                <a href="/notebook/classification?purpose=<%="게임용"%>"><div> <span class="menuborder"> <i class="fas fa-gamepad"></i> 게이밍노트북 </span> </div></a>
                <a href="/notebook/classification?purpose=<%="사무/인강용"%>"><div ><span  class="menuborder"> <i class="fa-solid fa-file"></i> 사무용노트북 </span></div></a>    
                <a href="/notebook/classification?company=<%="APPLE"%>"><div > <span  class="menuborder"> <i class="fab fa-apple" style="color: rgba(255, 0, 0, 0.767);"></i> 애플 맥북 </span></div></a>
            </div>
        </div>
            
            
          
             
            
            <a href="/board/mainlist"><li class="menuborderbottom">노트북 Q&A</li></a>
            <a href="/member/newsmain"><li class="menuborderbottom">뉴스</li></a>
           
           
          
                <div id="clickimpo">
                <a href="#"><li> <span class="menuborderbottom"> 정보공유</span> <i class="fas fa-bars" id="hambuger2"></i> <br></li></a>
                <br>
             
                <div id="clickimpo_1">
                    <a href="/board/mainlist?nickname=<%=nickname%>&email=<%=email%>"> <div><span class="menuborder"><img src="/img/게시판이미지.png" alt="" style="width: 25px;" id="clickimpo_1img"> 자유게시판 </span></div></a>
                    <a href="#"> <div><span class="menuborder"><img src="/img/게시판이미지.png" alt="" style="width: 25px;" id="clickimpo_1img">   영상게시판 </span></div></a>

                 </div>
                </div>
        </ul>
    </nav>
</div>


<div id="Allmenuwrap">
<div id="Allmenu">
 <div>
  
   
    <a href="/notebook/pagenum"><div class="svmenu"> 노트북</div></a>
<a href="/notebook/pagenum"><li class="Allmenu_menu"><i class="fas fa-laptop"></i> 노트북전체</li></a>
<a href="/notebook/classification?purpose=<%="게임용"%>"><li  class="Allmenu_menu"> <i class ="fas fa-gamepad"></i> 게이밍노트북 </li></a>
<a href="/notebook/classification?purpose=<%="사무/인강용"%>"><li  class="Allmenu_menu"> <i class="fa-solid fa-file"></i> 사무용노트북</li></a>
<a href="/notebook/classification?company=<%="APPLE"%>"><li  class="Allmenu_menu"><i class="fab fa-apple" style="color: rgba(255, 0, 0, 0.767);"></i> 애플 맥북</li></a>
</div>
 

<div>
  
    
    <a href="/board/mainlist"><div class="svmenu"> 노트북 Q&A </div></a>
<a href="/board/mainlist"><li  class="Allmenu_menu"></i> Q&A게시판</li></a>

</div>
 
<div>
 
   
    <a href="#"><div class="svmenu"> 다나와굿즈(오픈예정) </div></a>
<a href="#"><li  class="Allmenu_menu"> 굿즈구매하기(오픈예정)</li></a>
<a href="#"><li  class="Allmenu_menu"> NEW  신규굿즈(오픈예정)</li></a>
<a href="#"><li  class="Allmenu_menu"> Best 인기굿즈(오픈예정)</li></a>
</div>

<div>
   
   <div class="svmenu">정보공유 </div>
 <a href="/board/mainlist?nickname=<%=nickname%>&email=<%=email%>"><li  class="Allmenu_menu"> <img src="/img/게시판이미지.png" alt="" style="width: 25px;" id="clickimpo_1img">자유게시판</li></a>
 <a href="#"><li  class="Allmenu_menu">영상게시판</li></a>
</div>
<div id="bottombackground">

</div>

</div>
</div>

</body>
</html>