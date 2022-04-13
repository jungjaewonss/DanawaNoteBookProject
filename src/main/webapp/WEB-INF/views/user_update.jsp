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
    <link rel="stylesheet" href="css/modifyMember.css">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

   <link rel="stylesheet" href="/resources/css/user_update.css">
     
     <script>
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
            <div id="header">
                <a href="http://www.danawa.com" class="logo">
                    <img src="http://guide.danawa.com/pcweb/download/danawa_RGB.png">
                </a>
                <h2 class="logo-txt">회원정보수정</h2>
            </div>

            <div class="modify_wrap">
                
                <form action="/member/modify" method = "post">
                <table>
                    <tbody>
                    
                     
                        <%
                        request.setCharacterEncoding("utf-8");
                       String email = (String)request.getAttribute("email");
                   
                     
                        %>
                            <input type="hidden"  name="email"  value = <%= email %>><br/>
                        </td>
                    </tr>
                    
                    <tr class="modify_row">
                        <td class="modify_title">새 비밀번호</td>
                        <td class="modify_cont">
                            <input type="password" id="pwd" name="pwd" placeholder="새 비밀번호"/><br/>
                               <div id="pwdresult"></div>
                        </td>
                    </tr>
                    <tr class="modify_row">
                        <td class="modify_title">비밀번호 확인</td>
                        <td class="modify_cont">
                            <input type="password" id="pwdcheck" name="pwdcheck" placeholder="비밀번호 확인"/><br/>
                              <div id="pwdcheckresult"></div>
                        </td>
                    </tr>

                    <tr class="modify_row">
                        <td class="modify_title">닉네임</td>
                        <td class="modify_cont">
                            <input type="text" id="nickname" name="nickname" placeholder="닉네임"/><br/>
                            <div id="nicknamecheckresult"></div>
                         </td>
                    </tr>
                    
                    </tbody>
                </table>

                <div class="bundle_btn">
                
                    <a href="/member/clickdelete?email=<%=email %>" class="leave_btn">탈퇴하기 <%
                    		HttpSession  se = request.getSession();
                          se.setAttribute("email", email);
                    %></a>
                </div>
            </div>

            <div class="btn_wrap">
                <a href="javascript:window.history.back();" class="btn_submit cancel">취소</a>
              <input type = "submit" id="danawa-member-modify-form-submit"  class="btn_submit accept" value = "확인">
            </div>
            
            </form>
        </div>
    </div>

    

</body>
</html>