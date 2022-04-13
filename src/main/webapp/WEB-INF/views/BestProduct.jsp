<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <script src="slide.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato&family=Source+Sans+Pro&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/video.css">

<style>
    /* ------------------------------------- */
body{
    margin: 0px;
   padding: 0px;

}


p{
    margin-left: 10px;
    padding-bottom: 10px;
    font-weight: bold;
    position: relative;
    bottom: 10px ;
}

p:hover{
    cursor: pointer;
}

.pageNum{
    width: 1200px;
    margin: 0 auto;
   
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 50px;
    margin-bottom: 50px;
   
}
.pageNum span {
    position: relative;
    bottom: 3px;
   
    transition: 0.3s;
}
.pageNum span:hover{
   border-bottom: 2px solid gray;
 
   
   font-size: 30px;
   transition: 0.5s;
   
}

.imgborder img {
    transform: scale(1.0);
    transition: 0.5s;
   
}

.imgborder img:hover{
   
    padding: 40px;
    transform: scale(1.5);
    transition: 0.5s;
  
   
}




.slide4:hover{
    box-sizing: border-box;
 
}
.textborder:hover{
    border-bottom: 1px solid gray;
}

.pageNum a {
    padding-left: 30px;
}

#slideleft , #slideright {
   font-size: 20px;
   color: rgb(211, 211, 211);
   font-weight: bold;
}

#slideright {
    margin-left: 20px;
}
#slideleft{
  position: relative;
  left: 10px;
}



#mainslidewrapFirst{
    background-color: rgba(211, 211, 211, 0.267);
}

.imgtext{
    text-align: start;
    margin-left: 20px;
    transition: 0.5s;
  
}
#article1{
    width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    margin-top: 100px;

}



#newvideo1 , #newvideo2 , #newvideo3{
    display: flex;
    transition: 0.5s;
}


#newvideo {
  transition: 0.5s;
   
}

.mainslidewrap{
    width: 1080px;
    overflow-x: hidden;
    justify-content: center;
    margin: 0 auto;
    
    margin-bottom: 100px;
    margin-top: -270px;
    padding-top: 30px;
 
   
 }
 
 .mainbutton{
     text-align: center;
     position: relative;
     bottom: 40px;
     
 }
 
#button1:hover , #button2:hover , #button3:hover{
    cursor: pointer;
}

 .mainslide {
     
     width: 3220px;
    transition: 1s ;
      display: flex; 
      justify-content: start;
      position: relative;
      
      
    
  }
 
 



.button1 input{
    border: 3px solid rgba(255, 255, 255, 0.842);
}

 .button1{
     text-align: center;
     position: relative;
 }


 
.buttons:hover{
    cursor: pointer;
}


.mainslide img{
    padding-left: 10px;
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
.headerwrap ,#navwrap{
    background-color: white;
}

header{
    background-color: white;
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


footer{
    width: 1300px;
    margin: 0 auto;

}

footer{
    min-height: 300px;
    padding-bottom: 10px;
    border-top: 1px solid #e0e0e0;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    padding-top: 20px;
   
}
.footerwrap{
background-color: #e0e0e01c;
}

/* ----------------------------------- *
</style>

</head>
	<jsp:include page="./header.jsp" />

   <div id="mainslidewrapFirst">
      <div class="mainslidewrap">
     <h3>추천상품</h3>
     <div class="mainslide">
    
       
    <a href="#"><img src="http://placehold.it/350x200" alt=""  class="slide3" ></a>
    <a href="#"><img src="http://placehold.it/350x200" alt=""  class="slide3" ></a>
    <a href="#"><img src="http://placehold.it/350x200" alt=""  class="slide3" ></a>

    
   
    <a href="#"><img src="http://placehold.it/350x200" alt=""  class="slide3" ></a>
    <a href="#"><img src="http://placehold.it/350x200" alt=""  class="slide3" ></a>
    <a href="#"><img src="http://placehold.it/350x200" alt=""  class="slide3" ></a>


   
    <a href="#"><img src="http://placehold.it/350x200" alt=""  class="slide3" ></a>
    <a href="#"><img src="http://placehold.it/350x200" alt=""  class="slide3" ></a>
    <a href="#"><img src="http://placehold.it/350x200" alt=""  class="slide3" ></a>
   

    
      </div>
</div>
      <div class="mainbutton">
        <input type="radio" name="button" id="button1" checked>
        <input type="radio" name="button" id="button2">
        <input type="radio" name="button" id="button3"> 
       </div>
    </div>


    
    <div id="articlewrap">
 <article id="article1">

 <div id="newvideo" >
    <h3>추천상품</h3>
     <div id="newvideo1">
          
        <div class="imgtext">
            <div>
       <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span class="imgborder"></p>
       </div>
    </div>

    <div  class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>

    <div  class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>

    <div  class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>

    <div  class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>

</div>

<div id="newvideo2">
    <div class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
        <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>
    <div class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>
    <div class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>
    <div class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>
    <div class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>
</div>

<div id="newvideo3">
    <div  class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>
    <div  class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>
    <div  class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>
    <div  class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>
    <div  class="imgtext">
        <a href=""> <span class="imgborder"><img src="http://placehold.it/200x150" alt=""  class="slide4" ></span ></a>
       <p style="font-size: 12px; "> <span class="textborder">다나와 추천! best <br />상품 지금아니면 못살걸? <br />구매 가즈아~!!!!</span></p>
    </div>
</div>
 </div>
</div>



 </article>
 <div class="pageNum">
    
    <label for=""> <i class="fas fa-angle-left"  id="slideleft"></i></label>
    <a href="#"><span>1</span></a>
    <a href="#"><span>2</span></a>
    <a href="#"><span>3</span></a>
    <a href="#"><span>4</span></a>
    <a href="#"><span>5</span></a>
    <a href="#"><span>6</span></a>
    <a href="#"><span>7</span></a>
    <a href="#"><span>8</span></a>
    <a href="#"><span>9</span></a>
    <a href="#"><span>10</span></a>
    <label for=""><i class="fas fa-angle-right"  id="slideright"></i></label> 
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



document.querySelector(' #button1').addEventListener('click',function(){
     document.querySelector('.mainslide').style.transform = ' translateX(0)';
     
 })
  // 디폴트값에서 첫번째버튼을 누루면 0만큼이동
  
 document.querySelector('#button2').addEventListener('click',function(){
     document.querySelector('.mainslide').style.transform = ' translateX(-1085px)';
    
 })  // 디폴트값에서 두번째버튼을 누루면 -700만큼이동

 document.querySelector('#button3').addEventListener('click',function(){
     document.querySelector('.mainslide').style.transform = 'translateX(-2160px)';
    
 })  // 디폴트값에서 세번째버튼을 누루면 -1400만큼이동
    



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

document.querySelector('#clicknotebook').addEventListener('mouseover' , function(){
    $('#Allmenuwrap').style.visibility = "hidden";
  // 보조메뉴에서 마우스가 나갈시 보조메뉴숨김
  
})


</script>

</body>
</html>


</body>
</html>