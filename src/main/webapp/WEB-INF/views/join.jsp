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
    <link rel="stylesheet" href="/resources/css/join.css">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />


 




   
    <script>
    $(function(){ //자동실행
   	 $("#email").focusout(function(){ //버튼 1을 클릭하면 
   		 var email=$("#email").val(); //num 태그 입력하값
   		 $.ajax({   //백그라운드로 실행 
   			 type : "post",
   			 url  : "/member/ajaxlogin",
   			 data: {"email" : email}, //넘길 데이터값
   			 success : function(txt){  //콜백함수 성공시 실행 할것 (txt) 실행결과값을
   				 $("#emailresult").html(txt);  //아이디가 result 인곳을찾아서 거기 에 html 을넣어라
   			 }
   		 })
   	 })
    })
    
    
    
      $(function(){ //자동실행
   	 $("#pwd").focusout(function(){ //버튼 1을 클릭하면 
   		 var pwd=$("#pwd").val(); //num 태그 입력하값
   		 $.ajax({   //백그라운드로 실행 
   			 type : "post",
   			 url  : "/member/ajaxpwd",
   			 data: {"pwd" : pwd}, //넘길 데이터값
   			 success : function(txt){  //콜백함수 성공시 실행 할것 (txt) 실행결과값을
   				 $("#pwdresult").html(txt);  //아이디가 result 인곳을찾아서 거기 에 html 을넣어라
   			 }
   		 })
   	 })
    })
    
      $(function(){ //자동실행
   	 $("#pwdcheck").focusout(function(){ //버튼 1을 클릭하면 
   		 var pwdcheck=$("#pwdcheck").val(); //num 태그 입력하값
   		 var pwd =$("#pwd").val();
   		 $.ajax({   //백그라운드로 실행 
   			 type : "post",
   			 url  : "/member/ajaxcheckpwd",
   			 data: {"pwdcheck" : pwdcheck , "pwd" : pwd}, //넘길 데이터값
   			 success : function(txt){  //콜백함수 성공시 실행 할것 (txt) 실행결과값을
   				 $("#pwdcheckresult").html(txt);  //아이디가 result 인곳을찾아서 거기 에 html 을넣어라
   			 }
   		 })
   	 })
    })
  
    
    
     $(function(){ //자동실행
   	 $("#nickname").focusout(function(){ //버튼 1을 클릭하면 
   		 var nickname=$("#nickname").val(); //num 태그 입력하값
   		 $.ajax({   //백그라운드로 실행 
   			 type : "post",
   			 url  : "/member/ajaxchecknickname",
   			 data: {"nickname" : nickname}, //넘길 데이터값
   			 success : function(txt){  //콜백함수 성공시 실행 할것 (txt) 실행결과값을
   				 $("#nicknamecheckresult").html(txt);  //아이디가 result 인곳을찾아서 거기 에 html 을넣어라
   			 }
   		 })
   	 })
    })
    
    
    
    </script>
    
</head>


<body>
    <div id="wrap">
        <div id="container">
            <header>
                <a href="http://www.danawa.com" class="logo">
                    <img src="http://guide.danawa.com/pcweb/download/danawa_RGB.png">
                </a>
                <h2 class="logo_txt">회원가입</h2>
            </header>
            
            <div class="join_notice">
                <p>아래 항목을 모두 필수로 입력해주세요.</p>
            </div>
            <script >
       
           
            var joinFormSubmitDone = false;
            
            function joinFormSubmit(form){
            	if(joinFormSubmitDone) {
            		alert('처리중입니다');
            		return;
            	}
            	
               form.email.value = form.email.value.trim();
            	
            	if(form.email.value.length == 0){
            	  alert('이메일형식에맞게 입력해주세요')
            	  form.email.focus();
            	  return;
              }
            	
            	 form.pwd.value = form.pwd.value.trim();
             	
             	if((form.pwd.value.length  < 8 ||  form.pwd.value.length > 20) ){
             	  alert('비밀번호 형식에 맞게 입력해주세요')
             	  form.pwd.focus();
             	  return;
               }
             	
             	if(form.pwd.value != form.pwdcheck.value){
             		  alert('비밀번호확인이 일치하지않습니다.')
                 	  form.pwdcheck.focus();
                 	  return;
             	}
             	
             	
             	 form.name.value = form.name.value.trim();
              	
              	if(form.name.value.length == 0){
              	  alert('이름을 입력해주세요')
              	  form.name.focus();
              	  return;
                }
              	
              	 form.nickname.value = form.nickname.value.trim();
               	
               	if(form.nickname.value.length  > 8 || form.nickname.value.length > 16){
               	  alert('8자 ~ 16자 닉네임을 입력해주세요')
               	  form.nickname.focus();
               	  return;
                 }
               	
               	
 form.phone.value = form.phone.value.trim();
               	
               	if(form.phone.value.length  < 8 || form.phone.value.length > 20  ){
               	  alert('8자리 ~ 20자리 의 전화번호를 입력해주세요')
               	  form.phone.focus();
               	  return;
                 }
            	form.submit();
            	joinFormSubmitDone = true;
               	
            }
            
        
            </script>
            
             <form method="post" action="/member/insert" onsubmit = "joinFormSubmit(this); return false;">
                <label for="email">이메일 주소</label><br/>
                <input type="email" id="email" name="email" placeholder="이메일 주소 입력"/><br/>
                 <b> <div id="emailresult" ></div></b>
            
                <label for="pw">비밀번호</label><br/>
                <input type="password" id="pwd" name="pwd" placeholder="숫자, 영문, 특수문자 포함 8자 이상"/><br/>
               <b> <div id="pwdresult"></div></b>
                
                
                <label for="pw-check">비밀번호 확인</label><br/>
                <input type="password" id="pwdcheck" name="pwdcheck" placeholder="숫자, 영문, 특수문자 포함 8자 이상"/><br/>
               <b> <div id="pwdcheckresult"></div></b>
               
                <label for="name">이름</label><br/>
                <input type="text" id="name" name="name" placeholder="이름 입력"/><br/>
               
               
                <label for="nickname">닉네임</label><br/>
                <input type="text" id="nickname" name="nickname" placeholder="1~ 10자 입력해주세요"/><br/>
                 <b> <div id="nicknamecheckresult"></div></b>
                 
                 <label for="phone">핸드폰번호</label><br/>
                <input type="text" id="phone" name="phone" placeholder="숫자만 입력해주세요"/><br/>
                 <button class = "btn_join" >회원가입</button>
             </form>
        </div>
    </div>
    
    
    <script>
    
    
    </script>
   
    
    
</body>
</html>