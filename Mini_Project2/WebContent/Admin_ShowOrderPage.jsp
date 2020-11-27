<%@page import="com.yg.dto.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    
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
	}
	
	ul{
		padding-left:0px;
	}
	
	li{
		list-style:none;
		display:inline-block; 
	}
	

	table {
	    width: 100%;
	    border: 0;
	    border-spacing: 0;
	    border-collapse: collapse;
	    text-align:center;
	}
	
	table th, td {
		text-align:center;
	    padding: 10px 0 10px 20px;
	    border-top: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	}
	
	tr {
		font-size:14px;
        border-bottom: 1px solid #ccc;
    }
    
	th, td {
	    border: 0;
	    vertical-align: top;
	}
	
	form {
		margin-top: 40px;
    	float: left;
    	width: 300px;
	}
	a {
		color: black;
	}
	
	#btn {
	    margin-top: 80px;
	    height: 45px;
	    font-size: 13px!important;
	    font-weight: bold;
	    text-align: center;
	    width: 15%;
	    border: 1px solid #101010;
	    color: #fff;
	    background-color: #d99f9d;
        cursor: pointer;
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
						<li style="color:black;">관리자 - 주문조회	<li>
					</ul>
				</div>
			</div>
			
			<div class="boardList" style="margin-top: 35px;">
				<table>
					<tr>
						<th>번호</th>
						<th>상품번호</th>
						<th>수량</th>
						<th>컬러</th>
						<th>사이즈</th>
						<th>아이디</th>
						<th>주문날짜</th>
					</tr>
			<%
				ArrayList<OrderDTO> list = (ArrayList<OrderDTO>)request.getAttribute("orderlist");
				for(OrderDTO dto : list){	
			%>
					<tr>
						<td><%= dto.getObno() %></td>
						<td><a href="Controller?command=detail&pno=<%=dto.getPno() %>"><%= dto.getPno() %></a></td>
						<td><%= dto.getQty() %></td>
						<td><%= dto.getColor() %></td>
						<td><%= dto.getSize() %></td>
						<td><%= dto.getID() %></td>
						<td><%= dto.getOrderdate() %></td>
					</tr>
			<%} %>
				</table>
			</div>
			<div style="text-align:center;">
				<a href="AdminMainPage.jsp"><button id="btn">Main</button></a>	
			
			</div>
		</div>
	</div>


</div>
</body>
</html>