<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="Danawa.Project1.Dto.BoardBean"%>
<%@page import="java.util.*"%>
<%@page import="Danawa.Project1.Dao.BoardDAO"%>
<%@page import="Danawa.Project1.Dao.MyitemDAO"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Document</title>
<link rel="stylesheet" href="/resources/css/Mypage.css">
</head>


<%
/*  String nickname = (String)session.getAttribute("nickname");
 String email = (String)session.getAttribute("email"); */
 //ArrayList<BoardBean> boardbean = (ArrayList<BoardBean>)session.getAttribute("myWriteBean");
 String pageNum = (String)session.getAttribute("pageNum");
%>
<body>

	<%@include file="./header.jsp"%>


	<div id="wrap">
		<div id="container" clss="myPage_wrap">
			<div class="side_area">
				<div class="user_area">
					<div class="my_thumb">
						<span class="p_img"><img
							src="//img.danawa.com/icon/icon_default_01.gif" alt="닉네임"
							onerror="this.src='//img.danawa.com/icon/icon_default_01.gif'"></span>
					</div>
					<div class="my_info">
						<p class="p_nick">
							<strong><%=nickname %></strong>님
						</p>
						<p class="p_id"><%=email %></p>
					</div>
					<div class="my_btn">
						<a
							href="/member/checkingPwd?email=<%=email%>&nickname=<%=nickname%>"
" class="btn_profile">회원정보수정</a>
					</div>
				</div>
				<div class="menu_area">
					<dl class="menu_lst">
						<dt>
							<a id="link2" href="${ctx}/mypagewishlist.do">활동내역</a>
						</dt>
						<dd>
							<ul>
								<li><a id="link3" href="/member/myitem">관심상품</a></li>
							</ul>
						</dd>
						
					</dl>
				</div>
			</div>
			<%
                

   List<BoardBean> mywrite = (List<BoardBean>)request.getAttribute("currentList");
   int mywritesize = (int)request.getAttribute("mywritesize");
	NoteBookInfoBean notebean = new NoteBookInfoBean();
	int  currentPage =  (int)request.getAttribute("currentPage");
   int  currentBlock = (int)request.getAttribute("currentBlock");
   int total =  (int) request.getAttribute("total");
   int totalPage = (int) request.getAttribute("totalPage");
   int totalBlock = (int)    request.getAttribute("totalBlock");
   int  recordPerPage = (int)request.getAttribute("recordPerPage");
   int pagePerBlock = (int)request.getAttribute("pagePerBlock");
   int startPage = (int)request.getAttribute("startPage");
   int endPage = (int)request.getAttribute("endPage"); 
	
	          
			
	%>



			<div class="cont_area">
				<div class="main_area">
					<div class="box my_wish">
						<div class="head">
							<h2>내가 쓴 글</h2>
							<span class="b_count">(<strong><%=mywritesize %></strong>)
							</span>
						</div>

						<div class="cont" id="MyActUl">
							<div class="ctrl_box clear">
								<div class="left_a">
									<div class="chk">
										<input type="checkbox" id="select_all" name="mynotebook"
											value="selectAll" onclick="selectAll(this)" /> <span class=""
											tabindex="0">전체선택</span>
									</div>
									<button onclick="deleteMyProduct()" id="deleteBtn"
										class="btn_s">삭제</button>
										
										<button onclick="modifyMyProduct()" id="deleteBtn"
										class="btn_s">수정</button>
										
								</div>
							</div>


							<div id="boardArea">
								<table class="tbl act_tbl">
									<colgroup>
										<col class="title">
										<col class="date">
									</colgroup>
									<%String comment = "";
                                      BoardBean bean = new BoardBean(); 
                                    		
                                        		%>
									<%for(int i = 0 ; i < mywrite.size(); i++) {
                                           bean = mywrite.get(i);
                                    
                                        if(bean.getCommentcount() >  0){
                                      	  comment = "답변완료";
                                      	  
                                        } else {
                                        	comment = "";
                                        } 
                                    %>

									<thead class="th">
										<tr>
											<th scope="col" class="checkbox"><input type="checkbox"
												name="mynotebook" value='<%=bean.getNum()%>'
												id="SelectDelete" onclick="oneCheckBox()"></th>
											<th scope="col" class="check"><%=bean.getWriter() %></th>
											<th scope="col" class="title"><a
												href="/board/inboard?num=<%=bean.getNum()%>&nickname=<%=nickname%>"><%=bean.getSubject() + "[" +bean.getCommentcount() + "]" %></a></th>
											<th scope="col" class="date"><%=comment %></th>
											<th scope="col" class="date"><%=bean.getReg_date() %></th>
										</tr>
									</thead>
									<%} %>



								</table>

								<div class="co_paginate" id="pageNavigation">
									<ul class="clear">
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
									</ul>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

	<div id="danawa_footer"></div>

	<script>
    
	

	
	
	
	
    function deleteMyProduct(){
    	var checkednum = [];
    	$("input:checkbox[name='mynotebook']:checked").each(function(){
    		checkednum.push($(this).val()); //체크된것만 값으로 뽑아서 배열에 pust
    	})
    	
    	console.log(checkednum);
    	$.ajax({
    		type:"post",
    		url:"/board/deleteAllProduct",
    		data: JSON.stringify({
    	        'checkednum' : checkednum
    	    }),
    	    dataType : "text",    // 서버에서 데이터를 받을 때
    	    contentType : "application/json", // 서버에 데이터 보낼때
    	    
    		success : function(result){
    			
    			alert('정상적으로 삭제되었습니다.');
    			location.reload();
    		},
    		error : function(msg) {
    			console.log(msg);
    		}
    	})
    	
    }
    
    
    
    function selectAll(selectAll){
  	  const checkboxes = document.getElementsByName('mynotebook');
  	  
  	  
  	  checkboxes.forEach((checkbox) => {
  		  checkbox.checked = selectAll.checked;
  	  })
    }
    
    
       
        
        
       /*  let showmenu = document.getElementById('Allmenuwrap');
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
             
             
            
        }) */



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