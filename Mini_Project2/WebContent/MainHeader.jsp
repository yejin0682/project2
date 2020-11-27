<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<style>
    #header {
       text-align:center;
       text-size:11px;
       font-family: 'Lora',sans-serif,Verdana,'Nanum Gothic' !important;
       font-weight: 400;
    }
    div {
       vertical-align:center;
    }
    html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre,
    code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
       margin: 0 auto;
    }
    * {
       box-sizing: border-box;
    }
    li {
       list-style:none;
    }
   .main_cate {
      	width: 52%;
       	text-align: left;
       	padding-top: 30px;
       	padding-left:4px;
       	display:inline-block;
   }
   .main_cate li {
       display: inline-block;
       margin-right: 1.5%;
       line-height: 30px;
       height: 33px;
       list-style:none;
   }
   
   .main_cate li a{
   		font-size:11px;
   		color:black;
   		text-transform: uppercase;
   		list-style: none;
   }
   
    .main_cate_sub {
    	padding-left: 20px;
      	list-style-type:none;
      	position:absolute;
      	opacity:0;
     	visibility:hidden;
     	background: rgb(243,226,211);
     	width:150px;
     	letter-spacing:0.06px;
   }
   .main_cate_sub li {
      float:left;
      float:left;
      width:150px;
   }
   .main_cate_sub > li > a {
      text-decoration:none;
      font-size:10px;
      text-align:center;
      width:100px;
   }
   #main_cate01 > li:hover .main_cate_sub {
      opacity:1;
      visibility:visible;
      z-index:1
   }
   
   
   .main_logo {
       position: fixed;
       right: 0.3%;
       top: 7%;
       z-index: 999;
       width: 15%;
   }
   .sb-search {
       position: absolute;
       width: 0%;
       top: 25px;
       min-width: 25px;
       overflow: hidden;
       transition: width 0.3s;
       right: 7%;
   }
   .header_left {
       position: fixed;
       top: 50%;
       left: 0;
       width: 15%;
       z-index: 999;
   }
   .header_right {
       top:5%;
       right:30%;
       width: 15%;
       list-style: none;
       display:inline-block;
   }
   .r_btn {
       position: fixed;
       right: 7%;
       bottom: 5%;
       z-index: 999;
       width: 20px;
   }
   .r_btn a {
      -webkit-writing-mode: vertical-rl;
      -epub-writing-mode: vertical-rl;
      color: #101010;
       margin-bottom: 1vw;
       font-size: 0.57vw;
   }
   a {
       text-decoration: none;
   }
</style>
<script>
		var value=document.getElementById('banner_action');

		function search(){
			 location.href="Controller?command=searchmain&search_main="+value;
		};
</script>
</head>
<body>
   <div id="header">
      <!-- 상단 카테고리 -->
      <ul id="main_cate01" class="main_cate">
         <li><a href="#">New 8%</a></li>
         <li><a href="#">3CE</a>
            <ul class="main_cate_sub">
               <li><a href="#">에디션</a></li>
               <li><a href="#">페이스</a></li>
               <li><a href="#">아이</a></li>
               <li><a href="#">치크</a></li>
               <li><a href="#">립</a></li>
               <li><a href="#">네일</a></li>
               <li><a href="#">바디 & 헤어</a></li>
               <li><a href="#">툴</a></li>
               <li><a href="#">악세사리</a></li>
               <li><a href="#">키트</a></li>
            </ul>
         </li>
         <li><a href="nanda_made.jsp">NANDA MADE</a>
            <ul class="main_cate_sub">
               <li><a href="#">Stylenanda | Disney</a></li>
               <li><a href="#">아우터</a></li>
               <li><a href="#">탑</a></li>
               <li><a href="#">드레스</a></li>
               <li><a href="#">스커트</a></li>
               <li><a href="#">팬츠</a></li>
               <li><a href="#">가방</a></li>
               <li><a href="#">악세사리</a></li>
            </ul>
         </li>
         <li><a href="#">KKXX</a>
            <ul class="main_cate_sub">
               <li><a href="#">아우터</a></li>
               <li><a href="#">탑</a></li>
               <li><a href="#">스커트,팬츠</a></li>
               <li><a href="#">드레스</a></li>
            </ul>
         </li>
         <li><a href="#">SUMMER</a>
            <ul class="main_cate_sub">
               <li><a href="#">바디수트</a></li>
               <li><a href="#">비키니</a></li>
               <li><a href="#">의류</a></li>
               <li><a href="#">ACC</a></li>
               <li><a href="#">가방</a></li>
               <li><a href="#">슈즈</a></li>
            </ul>
         </li>
         <li><a href="#">기획상품</a></li>
         <li><a href="#">아우터</a>
            <ul class="main_cate_sub">
               <li><a href="#">코트</a></li>
               <li><a href="#">패딩</a></li>
               <li><a href="#">자켓</a></li>
               <li><a href="#">퍼자켓</a></li>
               <li><a href="#">가죽자켓</a></li>
               <li><a href="#">점퍼,야상,후드</a></li>
               <li><a href="#">가디건</a></li>
               <li><a href="#">베스트</a></li>
            </ul>
         </li>
         <li><a href="#">탑</a>
            <ul class="main_cate_sub">
               <li><a href="#">니트</a></li>
               <li><a href="#">긴팔</a></li>
               <li><a href="#">후드,맨투맨</a></li>
               <li><a href="#">블라우스</a></li>
               <li><a href="#">셔츠</a></li>
               <li><a href="#">뷔스티에</a></li>
               <li><a href="#">반팔</a></li>
               <li><a href="#">나시</a></li>
               <li><a href="#">조끼</a></li>
            </ul>
         </li>
         <li><a href="#">드레스</a>
            <ul class="main_cate_sub">
               <li><a href="#">미디,롱</a></li>
               <li><a href="#">미니</a></li>
            </ul>
         </li>
         <li><a href="#">스커트</a>
            <ul class="main_cate_sub">
               <li><a href="#">롱</a></li>
               <li><a href="#">미디</a></li>
               <li><a href="#">미니</a></li>
            </ul>
         </li>
         <li><a href="#">팬츠</a>
            <ul class="main_cate_sub">
               <li><a href="#">레깅스</a></li>
               <li><a href="#">롱팬츠</a></li>
               <li><a href="#">데님</a></li>
               <li><a href="#">트레이닝</a></li>
               <li><a href="#">점프수트</a></li>
               <li><a href="#">숏팬츠</a></li>
            </ul>
         </li>
         <li><a href="#">가방</a>
            <ul class="main_cate_sub">
               <li><a href="#">클러치</a></li>
               <li><a href="#">토트</a></li>
               <li><a href="#">숄더</a></li>
               <li><a href="#">크로스</a></li>
               <li><a href="#">캐주얼,백팩</a></li>
            </ul>
         </li>
         <li><a href="#">슈즈</a>
            <ul class="main_cate_sub">
               <li><a href="#">펌프스,힐</a></li>
               <li><a href="#">부츠,부티</a></li>
               <li><a href="#">플랫,로퍼</a></li>
               <li><a href="#">샌들,슬리퍼</a></li>
            </ul>
         </li>
         <li><a href="#">악세사리</a>
            <ul class="main_cate_sub">
               <li><a href="#">실버</a></li>
               <li><a href="#">귀걸이</a></li>
               <li><a href="#">목걸이</a></li>
               <li><a href="#">반지</a></li>
               <li><a href="#">팔찌</a></li>
               <li><a href="#">모자</a></li>
               <li><a href="#">헤어</a></li>
               <li><a href="#">스카프</a></li>
               <li><a href="#">머플러</a></li>
               <li><a href="#">장갑</a></li>
            </ul>
         </li>
         <li><a href="#">영상으로 보는 신상</a></li>
      </ul>
         <ul class="header_right">
            <div id="category">
               <div id="sb-search">
                  <form id="searchBarForm" action="Controller?command=searchmain" method="post">
                  <span style="display:flex;">
                     <input style="width:160px; height:25px; border:1px solid #ccc;" name="search_main" id="banner_action" type="search" placeholder="검색">
					 <button style="border:none; background-color:white;" onclick="search()"><i style="color:#a6a4a4;" class="fas fa-search"></i></button>                  
                  </span>
                  </form>
               </div>
            </div>
         </ul>

      <div class="header_fix">
         <div class="header_left">
            <div>
               <a href="Controller?command=showbasket" id="basket_count"><i style="color:#96918f;"class="fas fa-shopping-cart"></i></a>
            </div>
         </div>
      </div>
      <div class="main_logo">
         <a href="MainPage.jsp"> <img src="https://stylenanda.com/design1/kr/logo_kr.png">
         </a>
      </div>
      <div class="r_btn">
      <% String ID= (String)session.getAttribute("ID");
      	 
      		if(ID==null){	
      %>
         <a href="LoginPage.jsp" alt="로그인">LOGIN</a>
      <%
      		} else {
      %> 
      	<a href="Controller?command=memberlogout" alt="로그아웃">LOGOUT</a>
      <%
      		}
      %>     
         <br /> <br /> <a href="Controller?command=loginCheck&goto=mypage" onclick="마이페이지 팝업" alt="마이페이지">MY
            PAGE</a> <br /> <br />
         <div class="lan_button">
            <a href="랭귀지 페이지" onclick="랭귀지 팝업" alt="랭귀지">LANGUAGE<img src="https://stylenanda.com/design1/kr/lang_icon__.png" style="margin-right:3px;"></a>
         </div>
      </div>
   </div>
</body>
</html>