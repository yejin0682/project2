<%@page import="com.yg.dto.OrderDTO"%>
<%@page import="com.yg.dto.BasketDTO"%>
<%@page import="com.yg.dao.ProductDAO"%>
<%@page import="com.yg.dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="MainHeader.jsp" %>
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
    	margin-bottom:100px;
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
	}
	
	ul{
		padding-left:0px;
	}
	
	li{
		list-style:none;
		display:inline-block; 
	}
	
	.finorder{
		font-size:22px;
		color: #d99f9d;
	}
	
	table{
		line-height:1.5;
		width:80%;
		border:0;
		border-spacing:0;
		border-collapse:collapse;
		margin:auto;
	}
	
	th{
		padding:10px;
		border:0;
		border-top:1px solid #ccc;
		border-bottom:1px solid #ccc;
		font-weight:normal;
		text-align:center;
		border-right:1px solid #ccc;
	}
	
	.btn-bottom{
		display:inline-block;
		width:70px;
		color:white;
		background:#ccc;
		padding:5px;
		border:none;
		margin:1px;
		font-size:10px;
		cursor: pointer;
		
	}
	
	tbody td{
		padding-left:20px;
		text-align:left;
		font-size:12px;
		border:0;
		border-top:1px solid #ccc;
		border-bottom:1px solid #ccc;
	}
	
	#btn {
	    margin-top: 80px;
	    height: 45px;
	    font-size: 13px!important;
	    font-weight: bold;
	    text-align: center;
	    width: 15%;
	    border: none;
	    color: #fff;
	    background-color: #d99f9d;
        cursor: pointer;
	}
</style>
</head>
<body>
<%
	OrderDTO odto =null;
	odto=(OrderDTO)request.getAttribute("odto");
%>
<div id="container">
	<div id="content">
		<div id="content-wrap">
			<div id="parag">
				<div class="path">
					<ul>
						<li style="color:black;">Order</li>
					</ul> 
				</div>
			</div>
			<div style="text-align:center; margin:30px;">
				<span class="finorder">주문이 완료되었습니다</span>
			</div>
			<div>
				<div style="text-align:center;">
					<table border="1">
						<tbody>
							<tr>
								<th style="width:120px;" scope="row">주문번호</th>
								<td><%=odto.getObno() %></td>
							</tr>
							<tr>	
								<th style="width:120px;" scope="row">주문접수일</th>
								<td><%=odto.getOrderdate().substring(0,4)%>년 <%=odto.getOrderdate().substring(5,7)%>월
								 <%=odto.getOrderdate().substring(8,10)%>일 <%=odto.getOrderdate().substring(11,13)%>시 
								 <%=odto.getOrderdate().substring(14,16)%>분</td>
							</tr>
							<tr>	
								<th style="width:120px;" scope="row">주문상태</th>
								<td>결제완료[카드결제]</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div style="text-align:center;">
				<a href="MainPage.jsp"><button id="btn">Main</button></a>	
			
			</div>
		</div>
	</div>
</div>
<%@ include file="MainFooter.jsp" %>
</body>
</html>