<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yg.dao.ProductDAO"%>
<%@page import="com.yg.dto.ProductDTO"%>
<%@ include file="MainHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nanda made list</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs="
   crossorigin="anonymous"></script>      <!-- jquery.cdn -->
<link rel="stylesheet" href="./../css/flexslider.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.6.4/jquery.flexslider.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.6.4/flexslider.min.css">
<script src="./../css/jquery.flexslider.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script><!-- 화살표 -->

<style>
   body {
      width: -webkit-fill-available;
        height: auto;
        text-align: center;
   }
   #graybox > ul {
      list-style: none;
      display: flex;
      padding: 0px;
      text-align: left;
   }
   #content {
   		width: 66.5%;
       display: inline-block;
        -webkit-box-pack: justify;
      flex-direction: row;
   }
   /*graybox */
   #graybox{
      width: -webkit-fill-available;
       margin: 0px;
      margin-top: 70px;
      margin-bottom: 10px;
   }
   #graybox img {
       height: 85px;
        width: 84px;
   }
   #graybox li {
       margin: 0;
   }
   /*대문*/
   .flexslider {
      width: 1012px;
      padding-bottom: 40px;
       border-bottom: 1px solid lightgray;
        margin-bottom: 0px;
   }
   .flex-control-nav, .flex-control-paging {
       position: relative;
       bottom: 33px;
   
   }

   .flexslider img {
     width: 1023px;
     height:525px;
     counter-increment: gallery-cell;
   }

   /*product*/
   a {
      color: black;
   }
   #leftLabel label:hover {
      cursor: pointer;
   }
   #rightLabel label:hover {
      cursor: pointer;
      text-decoration: underline;      
   }
   #product {
      padding-top: 40px;
   }
   #leftLabel {
      float: left;
       font-size: 13px;
       word-spacing: 4px;
   }   
   #rightLabel {
      float: right;
       font-size: 11px;
   }
   #rightLabel label {
       margin-right: 10px;
   }
   #items img {
      width: 237px;
       height: 330px;
   }
   #items {
      font-size: 13px;
      display: inline-flex;
        -webkit-box-pack: justify;
      flex-direction: row;
       flex-wrap: wrap;
       max-inline-size: fit-content;
        justify-content: space-between;
        margin-top: 5px;
   }
   #items div {
      margin: 0;
       margin-top: 10px;
       width: fit-content;
   }
   #items p {
      margin-top: 8px;
      margin-bottom: 30px;
   }
   #items ul {
      list-style: none;
      padding: 0px;
      text-align: left;
   }   
   
   /*-- 스크롤바-- */
   ::-webkit-scrollbar {
       width: 18px;
   }
   ::-webkit-scrollbar-button {
       display: none;
       height: 10px;
       background: #d99f9d;
   }
   ::-webkit-scrollbar-thumb {
       height: 10px;
       width: 10px;
       background: #d99f9d;
       -webkit-border-radius: 0px;
       border-radius: 0px;
   }
</style>
<script>
   $(function() {
       $("#graybox img").mouseover(function(){
             $(this).css("opacity", "0.4");
             $(this).css("cursor", "pointer");
           });
        $("#graybox img").mouseout(function() {
             $(this).css("opacity", "1.0");
           });
        $("img").mouseover(function() {
             $(this).css("cursor", "pointer");
           });

      });
   $(document).ready(function() {
        $(".flexslider").flexslider({
          animation: "slide",
        });
      });

</script>
</head>
<body>
<div id="content">
<div id="graybox">
	<ul>
	<%
		ProductDAO pDao = ProductDAO.getinstance();
	ArrayList<ProductDTO> list = pDao.selectListImgs();
	for(ProductDTO pDto : list) {
	%>
		<li>
			<img src="<%= pDto.getImage()%>">
		</li>
		<%} %>
	</ul>
</div>

<div class="flexslider">
  <ul class="slides">
	<%
		list = pDao.selectListImgs2();
		for(ProductDTO pDto : list) {
	%>
    <li>
      <img src="<%= pDto.getImage()%>" />
    </li>
    <%} %>
  </ul>
</div>

<div id="product">
   <div id="leftLabel">
      <label>HOME</label>
      <i class="fas fa-angle-right"></i>
      <label>Stylenanda</label>
      <i class="fas fa-angle-right"></i>
      <a href="nanda_made.jsp"><b>Nanda made</b></a>
   </div>
   <div id="rightLabel">
      <i class="far fa-square"></i>
      <label>신상품</label>
      <i class="far fa-square"></i>
      <label>낮은가격</label>
      <i class="far fa-square"></i>
      <label>높은가격</label>
      <i class="far fa-square"></i>
      <label style="margin: 0;">이름</label>
   </div>
   <div id="items">
   <%
   		list = pDao.selectProduct();
		for(ProductDTO pDto : list) {
   %>
      <div>
         <a href="Controller?command=detail&pno=<%=pDto.getPno() %>">
         <img src="<%=pDto.getImage() %>">
         </a>
         <ul>
            <li>
               <label><%=pDto.getPname() %></label>
            </li>
            <li>
               <p><%=(pDto.getPrice() / 1000) +",000"%>원</p>
            </li>
         </ul>
      </div>
      <%   } %>
   </div>
</div>

</div>
</body>
</html>
<%@ include file="MainFooter.jsp" %>
