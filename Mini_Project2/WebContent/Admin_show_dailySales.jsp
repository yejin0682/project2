<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yg.dto.OrderDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일별 매출액</title>
<style>
	#container {
		font-size: 14px;
	    text-align: center;
	    width: 70%;
	    margin: 0 auto;
        margin-top: 100px;
	}
	h2 {
		font-weight: bold;
	    font-family: emoji;
	    margin-bottom: 30px;
	}
	table {
	    width: 100%;
	    border: 0;
	    border-spacing: 0;
	    border-collapse: collapse;
	}
	table th, td {
	    padding: 10px 0 10px 20px;
	    border-top: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	}
	tr {
        border-bottom: 1px solid #ccc;
    }
	th, td {
	    border: 0;
	    vertical-align: top;
	}
	a {
		color: black;
	}
	form {
		margin-top: 40px;
    	float: left;
	}
	#btn {
	    margin-top: 300px;
	    margin-right:15px;
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
	<h2>${date } 매출액:  ${dailySales }원</h2>
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
		ArrayList<OrderDTO> list = (ArrayList<OrderDTO>)request.getAttribute("list");
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
	<a href="Admin_dateSales.jsp"><button id="btn">뒤로가기</button></a>
	<a href="AdminMainPage.jsp"><button id="btn">Main</button></a>	
</div>
</body>
</html>