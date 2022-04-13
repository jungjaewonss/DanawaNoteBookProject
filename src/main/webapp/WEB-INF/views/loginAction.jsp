<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ page import = "Danawa.Project1.Dao.UserDAO"%>
    <%@ page import = "java.io.PrintWriter"%>
    <% request.setCharacterEncoding("utf-8"); %>
    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/loginAction.css">
      <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <title>Document</title>
    
    
</head>
<body>
    <div id="wrap">
        <div id="container">
            <header>
                <a href="http://www.danawa.com" class="logo">
                    <img src="http://guide.danawa.com/pcweb/download/danawa_RGB.png" />
                </a>
            </header>
          
            <form action="/member/login" method="post" >
                <input type="text" id="id" name="email" placeholder="email" />
                <input type="password" id="pwd" name="pwd" placeholder="비밀번호" />
               
                <button  class="btn_login">로그인</button>
            </form>
         
         
            <div class="login_info">
                <a href="#" id="searchId">아이디 찾기</a> 
                <a href="#" id="searchPwd">비밀번호 찾기</a> 
                <a href="/member/clickinsert" id="joinMember">회원가입</a>
            </div>
            <a href="#">
                <div class="banner"> <img alt="광고" src="https://orange.contentsfeed.com/RealMedia/ads/Creatives/danawa/ESTRA_TV_109890/ESTLA_TV_800142_220302.jpg" id ="add"> </div>
            </a>
        </div>
    </div>
</body>
</html>