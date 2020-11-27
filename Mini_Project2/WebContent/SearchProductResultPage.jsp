<%@page import="com.yg.dto.ProductDTO"%>
<%@page import="com.yg.dao.ProductDAO"%>
<%@page import="com.yg.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="MainHeader.jsp" %>    
    <link rel="stylesheet" hrefa="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		display:block;
		vertical-align:baseline;
	}
	
	#content{
		width: 70%;
		margin: 0 auto;
		padding: 70px 0px 80px;
		vertical-align:baseline;
		box-sizing:border-box;
		font-size:11px;
		font-family: 'Lora',sans-serif,Verdana,'Nanum Gothic' !important;
    	font-weight: 400;
	}
	
	#content-wrap{
		margin: 0 auto;
		box-sizing:border-box;
	}
	
	#parag{
		text-transform:uppercase;
		letter-spacing:0.2em;
		text-align:center;
		font-weight:800;
	}
	
	.path{
		font-size:16px;
		margin-top:0;
		padding: 0px 0px 40px;
		margin:0 auto;
		padding-bottom: 80px;
    	border-bottom: 2px solid #ccc;
    	margin-bottom: 23px;
	}
	
	ul{
		padding-left:0px;
	}
	
	li{
		list-style:none;
		display:inline-block; 
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
</head>
<body>
<div id="container">
	<div id="header">
	
	</div>
	
	<div id="content">
		<div id="content-wrap">
			<div id="parag">
				<div class="path">
					<ul>
						<li style="color:black;">SEARCH	<li>
					</ul>
				</div>
			</div>
			
			<div id="product-wrap">
				<div class="product-listmain">
			
					<ul class="prdList">
				<%
					ProductDAO pdao = ProductDAO.getinstance();
					ArrayList<ProductDTO> list = null;
					list= (ArrayList<ProductDTO>)session.getAttribute("searchlist");
					
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


</div>
<%@ include file="MainFooter.jsp" %>
</body>
</html>