<%@page import="com.yg.dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yg.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="MainHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/flexslider.css"><script src="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.6.4/jquery.flexslider.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.6.4/flexslider.min.css">
<script src="./css/jquery.flexslider.js"></script>
<style>
	div{
		display:block;
		vertical-align:baseline;
	}
	
	#content{
		width: 70%;
		margin: 0 auto;
		padding: 50px 0px 80px;
		vertical-align:baseline;
		box-sizing:border-box;
		font-size:11px;
		font-family: 'Lora',sans-serif,Verdana,'Nanum Gothic' !important;
    	font-weight: 400;
    	
	}
	
	#slide_main{
		width:97%;
		margin-top:1%;
		position:relative;
		margin-left:1%;
		margin:2% 0 5% 1%;
	}
	
	.swiper-container{
		margin-left:auto;
		margin-right:auto;
	}
	
	.swiper-wrapper{
		position:relative;
		width:100%;
		hegiht:100%;
		box-sizing:content-box;
	}

	.slides img {
	  width: 1023px;
	  height:525px;
	  counter-increment: gallery-cell;
	}
	
	#product-wrap{
		display:inline-block;
		width:100%;
		text-align:left !important;
	}
	
	.product-listmain{
		margin-bottom:5%;
		width:98.5%;
		margin-left:0.3%;
	}
	
	.prdList{
		display:table;
		width:100%;
		margin:0;
		padding-left:0px;
	}
	
	.prdList li{
		width:25%;
		padding: 0 0.75%;
		display: inline-block;
		margin:0 0 1.5% 0;
		color:#757575;
		vertical-align:top;
		list-style:none;
	}
	
	.box{
		width:100%;
		margin: 0 auto;
		font-size:12px;
		line-height:18px;
		text-align:left;
		position:relative;
	}
	
	.box a{
		display: block;
    	position: relative;
    	font-size:0;
    	list-style:none;
    	text-decoration:none;
    	color:black;
	}
	
	.thumb{
		width:100%;
		vertical-align:middle;
		max-width:100%;
		height:auto;
	}
	
	.table{
		margin-top: 3%;
		background-color: rgba(255,255,255,0.4);
    	width: 100%!important;
    	height: 100%!important;
    	position: relative!important;
	}
	
	.table a{
		text-align:left;
		list-style:none;
		text-decoration:none;
		color:black;
	}
	
	.name{
		font-size: 12px !important;
    	font-weight: normal !important;
    	color: #000 !important;
    	font-family: "Work Sans","HelveticaNeue",helvetica,Arial,sans-serif !important;
    	line-height: 18px;
    	text-align:left;
	}
	
	.name span{
		font-size: 12px !important;
    	font-weight: normal !important;
    	color: #000 !important;
    	font-family: "Work Sans","HelveticaNeue",helvetica,Arial,sans-serif !important;
    	line-height: 18px;
	}
	
	.price{
	    margin: 0.4vw 0;
    	font-family: "Work Sans","HelveticaNeue",helvetica,Arial,sans-serif !important;
    	font-size: 12px !important;
    	line-height: 18px;
	}
	
	.desc{
		color: #999 !important;
    	font-size: 11px !important;
    	line-height: 18px;
	}
</style>
<script>

	$(document).ready(function() {
		  $(".flexslider").flexslider({
		    animation: "slide",
		  });
		});
</script>
</head>
<body>
<div class="container">
	<div class="header">
		
	</div>
	<div id="content">
		<div id="cont-wrap">
			<div id="slide_main">
				<div class="swiper-container">
					<div class="flexslider">
						<ul class="slides">
   							<li>
      							<img src="https://app-storage-edge-005.cafe24.com/bannermanage2/nandaglobal/2020/09/02/1566abd9ba565201a1e44744558e81d4.gif" />
    						</li>
    						<li>
      							<img src="https://app-storage-edge-005.cafe24.com/bannermanage2/nandaglobal/2020/09/01/a69461476ce2ce07c9372023b93d5a04.jpg" />
    						</li>
    						<li>
      							<img src="https://app-storage-edge-005.cafe24.com/bannermanage2/nandaglobal/2020/09/01/421059f2d0ea62550aa0a2bf0b7fc661.jpg" />
    						</li>
    						<li>
      							<img src="https://app-storage-edge-005.cafe24.com/bannermanage2/nandaglobal/2020/09/04/3523daa89cc455b1fccfd20a3a0f8429.jpg" />
    						</li>
    						<li>
      							<img src="https://app-storage-edge-005.cafe24.com/bannermanage2/nandaglobal/2020/09/04/f4cb75c8f002cdcde9d99b185167bad9.jpg" />
    						</li>
  						</ul>
					</div>
				</div>
			</div>
			
			<div id="product-wrap">
				<div class="product-listmain">
			
					<ul class="prdList">
				<%
					ProductDAO pdao = ProductDAO.getinstance();
					ArrayList<ProductDTO> list = pdao.selectProductMain();
					
					for(ProductDTO pdto: list){
				%>
						<li>
							<div class="box">
								<a href="Controller?command=detail&pno=<%=pdto.getPno()%>"><img class="thumb" src="<%=pdto.getImage() %>"></a>
							</div>
							<div class="table">
								<a href="Controller?command=detail&pno=<%=pdto.getPno()%>">
									<p class="name"><span><%=pdto.getPname()%></span></p>
									<p class="price"><span><%=pdto.getPrice()%>원</span></p>
									<p class="desc"><%=pdto.getInform()%></p>
								</a>
							</div>
						</li>
				<%
					}
				%>
					</ul>
				</div>
			</div>
		</div>
		
	</div>
</div>
 <%@ include file="MainFooter.jsp" %>
</body>
</html>