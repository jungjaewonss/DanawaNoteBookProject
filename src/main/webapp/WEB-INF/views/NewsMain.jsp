<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="Danawa.Project1.Dto.Member"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "Danawa.Project1.Dao.UserDAO"%>
    <%@ page import = "java.io.PrintWriter"%>
    <%@ page import = "Danawa.Project1.Dao.NoteBookDAO"%>
    <%@ page import = "Danawa.Project1.Dto.NoteBookInfoBean"%>
<<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/뉴스.css">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Source+Sans+Pro&display=swap" rel="stylesheet">

<style>
   @charset "utf-8";

body {  
    margin: 0 auto  ;
    padding: 0;
    width: 100%;
    height: 0;
}
a{
    color: black;
    text-decoration: none;
}

#wrap{
    width: 100%;
    height: 100px;
    margin: 0 auto;
    padding: 0;
}

/* ------------------------------------- */
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
   position: relative;
    z-index: 2;
    
}

#Allmenuwrap:hover{
    visibility: hidden;

}


.svmenu{
    color: rgba(255, 255, 255, 0.863);
    font-weight: bold;
    font-size: 15px;
}

li{
    list-style: none;
  
}


a{
    text-decoration: none;
    font-weight: bold;
    color: black;
}






 
.buttons:hover{
    cursor: pointer;
    z-index: 2;
    position: relative;
}


/* #clicknotebook_1 div , #iconclick div , #clickimpo_1 div{
    border: 1px solid gray;
    border-radius: 3px;
    transition: all 0.5s;
    transition-timing-function: ease;
} */


#clicknotebook_1 span:hover , #iconclick span:hover , #clickimpo_1 span:hover{
    
   border-radius: 1px;
    /* border-bottom:  2px double rgba(0, 0, 0, 0.856); */
    text-decoration: 2px solid underline ;
    width: 100%;
    transition:  0.5s;
    position: relative;
    z-index: 1;
    
}




.menuborderbottom{
    border-bottom: 1px solid rgba(22, 7, 10, 0.658);
    transition: 0.5s;

}

.menuborderbottom:.{
    border-bottom: 5px solid rgba(255, 192, 203, 0.658);
    border-spacing: 50px;
    transition: 0.2s;
    border-radius: 2px;
}


#menu_1{
    position: relative;
    z-index: 1;
}







#navwrap{
    display: flex;
    width: 100%;
    border-bottom: solid 1px black;
    margin-bottom: 30px;
}


  

  

#text{
    width: 500px;
    background-image: url(/img/돋보기.png);
    background-repeat: no-repeat;
    /* background-position: right; */
    background-position: 450px;
    height: 50px;
    /* border: 1px transparent; */
    border-left: 1px solid #c3f8a4;
    border-top: 1px solid #5df542;
    border-right: 1px solid #42f5f5;
    border-bottom: 1px solid #42e3f5;
    border-radius: 4px;
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
    position: relative;
    z-index: 1;
}
.icons{
   
    display: flex;
    position: relative;
    z-index: 1;
}

.nav_ul{
    display: flex;
    justify-content: space-between;
    list-style: none;
    text-decoration: solid underline;
    position: relative;
}











#iconclick{
    display: none;
    border: 1px solid black;
    border-radius: 4px;
    position: absolute;
    width: 110px;
    background-color: white;
    z-index: 1;
}

#iconclick div {
    padding: 10px;
    text-align: center;
}



#clickimpo_1{
    display: none;
    border: 1px solid black;
    border-radius: 4px;
    position: absolute;
    width: 140px;
    background-color: white;
    text-align: center;
    margin-left: -28px;
    z-index: 2;
}


#clickimpo_1img{
    position: relative;
    top:  5px;
    z-index: 2;
}


#clickimpo_1 div{
    padding: 10px;
   
    text-align: center;
}

#clicknotebook_1{
    display: none;
    border: 1px solid black;
    border-radius: 4px;
    position: absolute;
    width: 142px;
    background-color: white;
    margin-left: -40px;
    transition: 0.5s;
    z-index: 2;
    
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

/* ----------------------------------- */



.news_imgs{
    padding: 0;
    margin: 0 auto;
}
.news_imgs #news_imgs_wrap{
    width: 1440px;
    padding: 0;
    margin: 0 auto;
}
#nesw_img_size{
    height: 0;
}
#nesw_img_position{
height: 0;
}
.news_imgs #news_text{
    position: relative;
    left: 150px;
    bottom: 250px;
}


.news_imgs #news_imgs_text1{
    position: relative;
    bottom: 49px;
    z-index: 1;
    background: rgba(255,255,255,0.8);
    width: 345px;
    opacity: 0.8;
    line-height: 31px;
    padding-left: 15px;
}

.news_imgs #news_imgs_text2{
    position: relative;
    bottom: 49px;
    z-index: 1;
    background: rgba(255,255,255,0.8);
    width: 345px;
    opacity: 0.8;
    line-height: 31px;
    padding-left: 15px;
}

.news_imgs #news_imgs_text3{
    position: relative;
    bottom: 49px;
    z-index: 1;
    background: rgba(255,255,255,0.8);
    width: 345px;
    opacity: 0.8;
    line-height: 31px;
    padding-left: 15px;
}

.news_imgs #news_imgs_text4{
    position: relative;
    bottom: 49px;
    z-index: 1;
    background: rgba(255,255,255,0.8);
    width: 345px;
    opacity: 0.8;
    line-height: 31px;
    padding-left: 15px;
}

.news_imgs #news_imgs_text5{
    position: relative;
    bottom: 49px;
    z-index: 1;
    background: rgba(255,255,255,0.8);
    width: 345px;
    opacity: 0.8;
    line-height: 31px;
    padding-left: 15px;
}

.news_imgs #news_imgs_text6{
    position: relative;
    bottom: 49px;
    z-index: 1;
    background: rgba(255,255,255,0.8);
    width: 345px;
    opacity: 0.8;
    line-height: 31px;
    padding-left: 15px;
}

.news_imgs #news_imgs_text:hover{
    background-color: blue;
}

.news_imgs #news_imgs_input1{
    position: relative;
    left: 170px;
    bottom:215px;
    width: 360px; height: 195px;
    
}

.news_imgs #news_imgs_input1:hover{
    background-color: blue;
    
}

.news_imgs #news_imgs_input2{
    position: relative;
    left: 570px;
    bottom:409px;
    width: 360px; height: 195px;
}

.news_imgs #news_imgs_input3{
    position: relative;
    left:970px;
    bottom:605px;
    width: 360px; height: 195px;
}

.news_imgs #news_imgs_input4{
    position: relative;
    left: 170px;
    bottom:580px;
    width: 360px; height: 195px;
}

.news_imgs #news_imgs_input5{
    position: relative;
    left: 570px;
    bottom: 775px;
    width: 360px; height: 195px;
}
.news_imgs #news_imgs_input6{
    position: relative;
    left:970px;
    bottom: 970px;
    width: 360px; height: 195px;
}

.news_imgs #backimg{
    background-color: rgb(241, 241, 241);
    width: 1194px;
    height: 460px;
    position: relative;
    bottom: 1407px;
    left: 153px;
    z-index: -1;
}


.news_text_1{
    padding: 0;
    margin: 0 auto;
    position: relative;
    bottom : 250px;
    height: 0;
}

.news_text_1 #news_text_1_warp{
    padding: 0;
    margin: 0 auto;
    /* background-color: rgb(241, 241, 241); */
    width: 1194px;
    height: 460px;
    position: relative;
    /* bottom: 1425px; */
    left: 30px;
    z-index: 1;
}

.news_text_1 #news_text_1_warp p{
    font-size: 14px;
    font-weight: bold;
    padding-left: 80px;
    padding-top: 2px;
}


#left_text{
    width: 597px;
    border-right: black 1px solid;
    position: relative;
    top:50px;
}

#right_text{
    padding: 0;
    margin: 0 auto;
    font-size: 14px;
    width: 597px;
    position: relative;
    left: 400px;
    bottom: 215px;
    z-index: 1;

}

#right_text p{
    padding-top: 2px;
}

.news_search{
    margin: 0 auto;
    padding: 0;
}


#news_search .news_search_input{
    text-align: left;
    margin: 0 auto;
    position: relative;
    width: 100px;
    top:620px;
    right: 150px;
}
#news_search .news_search_input_1{
    height: 32px;
    width: 130px;
    text-align: center;
}

#news_search .news_search_input_2{
    position: relative;

    left: 130px;
    bottom: 32px;
}

#news_search #search_input{
    font-size: 11px;
    padding-left: 10px;
    position: relative;
    width: 171px;
    height: 26px;
}

#search{
    background-color: black;
    color: white;
    height: 33px;
    position: relative;
    left: 317px;
    bottom: 65px;
}

footer{
    width: 1200px;
    display: flex;
    margin: 0 auto;
    align-items: center;
    justify-content: space-between;

    min-height: 300px;
    padding-bottom: 10px;
    border-top: 1px solid #e0e0e0;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    padding-top: 20px;
   
}
.footerwrap{
    position: relative;
    top:650px;
background-color: #e0e0e01c;
}
</style>
</head>
<body>
    
            	<jsp:include page="./header.jsp" />

            <div id="wrap">

                <section class="news_imgs">
                    <div id="news_imgs_wrap">
                    <div id="news_text" style="font-weight: bold; font-size: 24px;"> 뉴스룸 </div>
                    <div id="nesw_img_size">
                        <div id="nesw_img_position">
                    <div id="news_imgs_input1">
                        <a href="./news_in.html"><img src="https://img.danawa.com/images/attachFiles/newsRoom/20220127/1643268477181.jpeg" alt=""
                        style="width: 360px; height: 195px;">
                        <p id="news_imgs_text1" style="font-size: 15px; font-weight: bold;">가벼운 게이밍 노트북 찾으세요?</p></a>
                    </div>

                        <div id="news_imgs_input2">
                            <a href="./news_in.html"><img src="https://img.danawa.com/images/attachFiles/newsRoom/20220210/1644462080199.jpeg" alt=""
                            style="width: 360px; height: 195px;">
                            <p id="news_imgs_text2" style="font-size: 15px; font-weight: bold;">비즈니스용 2in1 노트북이 90만원대?</p> </a> 
                        </div>

                            <div id="news_imgs_input3">
                                <a href="./news_in.html"><img src="https://img.danawa.com/images/attachFiles/newsRoom/20220210/1644454734486.jpeg" alt=""
                                style="width: 360px; height: 195px;">
                                <p id="news_imgs_text3" style="font-size: 15px; font-weight: bold;">갤럭시 언팩 요약! 예언 적중</p></a>
                            </div>

                                <div id="news_imgs_input4">
                                    <a href="./news_in.html"><img src="https://img.danawa.com/images/attachFiles/newsRoom/20220207/1644215765340.jpeg" alt=""
                                    style="width: 360px; height: 195px;">
                                    <p id="news_imgs_text4" style="font-size: 15px; font-weight: bold;">연습도 장비빨! 4K 게이밍 모니터</p></a>
                                </div>

                                    <div id="news_imgs_input5">
                                        <a href="./news_in.html"><img src="https://img.danawa.com/images/attachFiles/newsRoom/20220207/1644192267762.jpeg" alt=""
                                        style="width: 360px; height: 195px;">
                                        <p id="news_imgs_text5" style="font-size: 15px; font-weight: bold;">X박스, 게임계 넷플릭스 될까?</p></a>
                                    </div>

                                        <div id="news_imgs_input6">
                                            <a href="./news_in.html"><img src="https://img.danawa.com/images/attachFiles/newsRoom/20220207/1644225947680.jpeg" alt=""
                                            style="width: 360px; height: 195px;">
                                            <p id="news_imgs_text6" style="font-size: 15px; font-weight: bold;">그래픽카드 포함 1.1kg 노트북?!</p></a>
                                            </div>
                                </div>
    
                                </div>

                                <div id="backimg"></div>

                </div>
                </section>
                

                <section class ="news_text_1">
                    <div id="news_text_1_warp">
                        <div id="left_text">
                        <p><a href="./news_in.html" id="left_text1">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                        <p><a href="./news_in.html" id="left_text2">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                        <p><a href="./news_in.html" id="left_text3">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                        <p><a href="./news_in.html" id="left_text4">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                        <p><a href="./news_in.html" id="left_text5">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                        <p><a href="./news_in.html" id="left_text6">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                        <p><a href="./news_in.html" id="left_text7">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                        <p><a href="./news_in.html" id="left_text8">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                        <p><a href="./news_in.html" id="left_text9">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                        <p><a href="./news_in.html" id="left_text10">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                        </div>

                </div>
                </section>
                <div id="right_text">
                    <p><a href="" id="right_text1">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                    <p><a href="" id="right_text2">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                    <p><a href="" id="right_text3">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                    <p><a href="" id="right_text4">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                    <p><a href="" id="right_text5">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                    <p><a href="" id="right_text6">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                    <p><a href="" id="right_text7">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                    <p><a href="" id="right_text8">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                    <p><a href="" id="right_text9">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                    <p><a href="" id="right_text10">프랑스 워치 브랜드 Gc, 독특하면서도 세련된 무드의 '쿠션 쉐입 ...</p></a>
                    </div>
                </div>


                <section id="news_search">
                   <div>
                     <div class="news_search_input">
                        <form action="#">
                            <select class="news_search_input_1" name="menu">
                                <option value="best" value="title_content" method="get" selected>제목 + 내용</option>
                                <option value="sinsang" value="title" method="get">제목</option>
                                <option value="down" value="content" method="get">내용</option>
                            </select>

                            <div class="news_search_input_2">
                              <input type="text" id="search_input" name="search" method="get"
                                      placeholder="검색어를 입력하세요." /> </a> 
                          </div>
                          <input type="button" id="search" value="검색" method="get"></input>
                        </form>


                    </div>


                   </div>
                </section>


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

        
        //   이미지 마우스 갖다되면 텍스트란 배경및 폰트색 밑줄 변경
               $("#news_imgs_input1").mouseover(()=> {
               $("#news_imgs_text1").css("background-color" , "blue");
               $("#news_imgs_text1").css("color" , "white");
               $("#news_imgs_text1").css("text-decoration" , "underline");
            });


            $("#news_imgs_input1").mouseout(()=> {
               $("#news_imgs_text1").css("background-color" , "rgb(241, 241, 241)");
               $("#news_imgs_text1").css("color" , "black");
               $("#news_imgs_text1").css("text-decoration" , "none");
            });

            $("#news_imgs_input2").mouseover(()=> {
               $("#news_imgs_text2").css("background-color" , "blue");
               $("#news_imgs_text2").css("color" , "white");
               $("#news_imgs_text2").css("text-decoration" , "underline");
            });


            $("#news_imgs_input2").mouseout(()=> {
               $("#news_imgs_text2").css("background-color" , "rgb(241, 241, 241)");
               $("#news_imgs_text2").css("color" , "black");
               $("#news_imgs_text2").css("text-decoration" , "none");
            });

            $("#news_imgs_input3").mouseover(()=> {
               $("#news_imgs_text3").css("background-color" , "blue");
               $("#news_imgs_text3").css("color" , "white");
               $("#news_imgs_text3").css("text-decoration" , "underline");
            });


            $("#news_imgs_input3").mouseout(()=> {
               $("#news_imgs_text3").css("background-color" , "rgb(241, 241, 241)");
               $("#news_imgs_text3").css("color" , "black");
               $("#news_imgs_text3").css("text-decoration" , "none");
            });

            $("#news_imgs_input4").mouseover(()=> {
               $("#news_imgs_text4").css("background-color" , "blue");
               $("#news_imgs_text4").css("color" , "white");
               $("#news_imgs_text4").css("text-decoration" , "underline");
            });


            $("#news_imgs_input4").mouseout(()=> {
               $("#news_imgs_text4").css("background-color" , "rgb(241, 241, 241)");
               $("#news_imgs_text4").css("color" , "black");
               $("#news_imgs_text4").css("text-decoration" , "none");
            });

            $("#news_imgs_input5").mouseover(()=> {
               $("#news_imgs_text5").css("background-color" , "blue");
               $("#news_imgs_text5").css("color" , "white");
               $("#news_imgs_text5").css("text-decoration" , "underline");
            });


            $("#news_imgs_input5").mouseout(()=> {
               $("#news_imgs_text5").css("background-color" , "rgb(241, 241, 241)");
               $("#news_imgs_text5").css("color" , "black");
               $("#news_imgs_text5").css("text-decoration" , "none");
            });

            $("#news_imgs_input6").mouseover(()=> {
               $("#news_imgs_text6").css("background-color" , "blue");
               $("#news_imgs_text6").css("color" , "white");
               $("#news_imgs_text6").css("text-decoration" , "underline");
            });


            $("#news_imgs_input6").mouseout(()=> {
               $("#news_imgs_text6").css("background-color" , "rgb(241, 241, 241)");
               $("#news_imgs_text6").css("color" , "black");
               $("#news_imgs_text6").css("text-decoration" , "none");
            });
            // 끝

            // 마우스 갖다되면 밑줄생김
            $("#left_text1").mouseover(()=> {
               $("#left_text1").css("text-decoration" , "underline");
               $("#left_text1").mouseout(()=> {
               $("#left_text1").css("text-decoration" , "none");
            });
            });


            // $("#left_text1").mouseout(()=> {
            //    $("#left_text1").css("text-decoration" , "none");
            // });

            $("#left_text2").mouseover(()=> {
               $("#left_text2").css("text-decoration" , "underline");
            });


            $("#left_text2").mouseout(()=> {
               $("#left_text2").css("text-decoration" , "none");
            });

            $("#left_text3").mouseover(()=> {
               $("#left_text3").css("text-decoration" , "underline");
            });


            $("#left_text3").mouseout(()=> {
               $("#left_text3").css("text-decoration" , "none");
            });

            $("#left_text4").mouseover(()=> {
               $("#left_text4").css("text-decoration" , "underline");
            });


            $("#left_text4").mouseout(()=> {
               $("#left_text4").css("text-decoration" , "none");
            });

            $("#left_text5").mouseover(()=> {
               $("#left_text5").css("text-decoration" , "underline");
            });


            $("#left_text5").mouseout(()=> {
               $("#left_text5").css("text-decoration" , "none");
            });

            $("#left_text6").mouseover(()=> {
               $("#left_text6").css("text-decoration" , "underline");
            });


            $("#left_text6").mouseout(()=> {
               $("#left_text6").css("text-decoration" , "none");
            });

            $("#left_text7").mouseover(()=> {
               $("#left_text7").css("text-decoration" , "underline");
            });


            $("#left_text7").mouseout(()=> {
               $("#left_text7").css("text-decoration" , "none");
            });

            $("#left_text8").mouseover(()=> {
               $("#left_text8").css("text-decoration" , "underline");
            });


            $("#left_text8").mouseout(()=> {
               $("#left_text8").css("text-decoration" , "none");
            });

            $("#left_text9").mouseover(()=> {
               $("#left_text9").css("text-decoration" , "underline");
            });


            $("#left_text9").mouseout(()=> {
               $("#left_text9").css("text-decoration" , "none");
            });

            $("#left_text10").mouseover(()=> {
               $("#left_text10").css("text-decoration" , "underline");
            });


            $("#left_text10").mouseout(()=> {
               $("#left_text10").css("text-decoration" , "none");
            });

            $("#right_text1").mouseover(()=> {
               $("#right_text1").css("text-decoration" , "underline");
            });


            $("#right_text1").mouseout(()=> {
               $("#right_text1").css("text-decoration" , "none");
            });

            $("#right_text2").mouseover(()=> {
               $("#right_text2").css("text-decoration" , "underline");
            });


            $("#right_text2").mouseout(()=> {
               $("#right_text2").css("text-decoration" , "none");
            });

            $("#right_text3").mouseover(()=> {
               $("#right_text3").css("text-decoration" , "underline");
            });


            $("#right_text3").mouseout(()=> {
               $("#right_text3").css("text-decoration" , "none");
            });

            $("#right_text4").mouseover(()=> {
               $("#right_text4").css("text-decoration" , "underline");
            });


            $("#right_text4").mouseout(()=> {
               $("#right_text4").css("text-decoration" , "none");
            });

            $("#right_text5").mouseover(()=> {
               $("#right_text5").css("text-decoration" , "underline");
            });


            $("#right_text5").mouseout(()=> {
               $("#right_text5").css("text-decoration" , "none");
            });

            $("#right_text6").mouseover(()=> {
               $("#right_text6").css("text-decoration" , "underline");
            });


            $("#right_text6").mouseout(()=> {
               $("#right_text6").css("text-decoration" , "none");
            });

            $("#right_text7").mouseover(()=> {
               $("#right_text7").css("text-decoration" , "underline");
            });


            $("#right_text7").mouseout(()=> {
               $("#right_text7").css("text-decoration" , "none");
            });

            $("#right_text8").mouseover(()=> {
               $("#right_text8").css("text-decoration" , "underline");
            });


            $("#right_text8").mouseout(()=> {
               $("#right_text8").css("text-decoration" , "none");
            });

            $("#right_text9").mouseover(()=> {
               $("#right_text9").css("text-decoration" , "underline");
            });


            $("#right_text9").mouseout(()=> {
               $("#right_text9").css("text-decoration" , "none");
            });

            $("#right_text10").mouseover(()=> {
               $("#right_text10").css("text-decoration" , "underline");
            });


            $("#right_text10").mouseout(()=> {
               $("#right_text10").css("text-decoration" , "none");
            });

               
               
               </script>        
</body>
</html>