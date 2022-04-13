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
<link rel="stylesheet" href="summernote-0.8.18-dist/summernote-lite.css">



<style>
  body{
    margin: 0px;
    padding: 0px;    
    font-family: 'Source Sans Pro', sans-serif
    
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

.menuborderbottom:hover{
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
footer{
    position: relative;
    z-index: 1;
    width: 1200px;
    display: flex;
    margin: 0 auto;
    align-items: center;
    justify-content: space-between;

    min-height: 300px;
    /*  */
    bottom: 10px;
    border-top: 1px solid #e0e0e0;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    padding-top: 20px;
   
}
.footerwrap{
background-color: #e0e0e01c;
}
main{
    position: relative;
    z-index: 1;
    width: 1200px;
    justify-content: space-around;
    margin: 0 auto;
    bottom: 200px;
}

#footer1{
    position: relative;
        z-index: 1;
        border: none;
        width: 1200px;
        display:block;
        margin: 0 auto;
        left: 2%;
        align-content: center;
        margin-bottom: 10px;

}
#submit {
    cursor:pointer;
    width: 10%;background-color: rgb(175, 169, 214); border:1px solid lightgray; color: black;
}
#submit:hover {background: #ddbee9;}
#submit:active {background: #ddbee9;} 
#reset{
    
    width: 10%;background-color: white; border:1px solid lightgray; color: black;
}
#reset:hover {background: #ddbee9;}
#reset:active {background: #ddbee9;} 


#allboard {
border: 1px solid #b9bec5;
    background: #fff;
    cursor: pointer;
}

#reset{
cursor: pointer;
}

</style>
</head>


 
<body>
         	<jsp:include page="./header.jsp" />
      
    <main role="main" class="container" >
      <div id="title_1" style="text-align: left; margin-bottom: 20px;">
        <h2 id="title">노트북 Q&A</h2>
      </div>

      <div id="subtitle" style="text-align: right;">
      </div>

      <div id="title_2" style="text-align: center; margin-bottom: 20px; margin-top: 30px; border-top: 1px solid lightgray;">
        <h4 id="title" style="margin-top: 30px;">비밀번호확인</h4>
      </div>
      
      <%
      request.setCharacterEncoding("utf-8");
      String nickname =   (String)session.getAttribute("usernick");
     int num =   (int)session.getAttribute("num");
      %>
      
      <!--=============================================================================  -->
      <form class="form_1" name="form" method="post" action="/board/pwdcheckok">
       
        <div class="pt-1" style="border:1px solid gainsboro ; width: 100%; height: 70px; display: flex; align-items: center; margin-bottom: 20px;">
          <label style="padding-right: 20px; padding-left: 10px;">비밀번호</label>
          <input type="password" name="password" placeholder="입력 안할 시 전체공개" style="border-radius: 5px; width: 30%; ">
          <input type="hidden" name="nickname"  value = <%=nickname %> >
          <input type="hidden" name="num"  value = <%=num %> >
      
        </div> 
        
        
          <button id="submit" type="submit" >확인</button>
      
           <button id="reset" type="reset" >전체지우기</button>
          <input type = "button" onclick ="location.href ='notebook_q&a_main.jsp" value = "전체게시글보기" id = "allboard"> 
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