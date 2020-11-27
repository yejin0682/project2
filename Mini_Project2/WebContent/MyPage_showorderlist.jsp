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
	
	table{
		line-height:1.5;
		width:100%;
		border:0;
		border-spacing:0;
		border-collapse:collapse;
	}
	
	th{
		padding:10px;
		border:0;
		border-top:1px solid #ccc;
		border-bottom:1px solid #ccc;
		font-weight:normal;
		text-align:center;
	}
	
	td img{
		margin:5px;
		width:120px;
	}
	
	.btn-bottom{
		display:inline-block;
		width:100px;
		color:white;
		background:#ccc;
		padding:5px;
		border:none;
		margin:1px;
		font-size:12px;
		cursor: pointer;
		
	}
	
	tbody td{
		text-align:center;
		font-size:12px;
		border:0;
		border-bottom:1px solid #ccc;
	}
</style>
<%
	ArrayList<OrderDTO> list=null;
	list=(ArrayList<OrderDTO>)request.getAttribute("mypageorderlist");

	ProductDAO pdao=ProductDAO.getinstance();
	ProductDTO pdto=null;
	String bnoAll="";
%>
</head>
<body>
<div id="container">
	<div id="content">
		<div id="content-wrap">
			<div id="parag">
				<div class="path">
					<ul>
						<li style="color:black;">MyPage - OrderList</li>
					</ul> 
				</div>
			</div>
			<div>
				<div>
					<table border="1">
						<thead>
							<tr>
								<th style="width:180px;">이미지</th>
								<th style="width:130px;">주문날짜</th>
								<th style="width:auto;">상품정보</th>
								<th style="width:130px;">판매가</th>
								<th style="width:40px;">수량</th>
								<th style="width:150px;">선택</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<%
								for(OrderDTO odto: list){
									int pnoii=odto.getPno();
									String pno=pnoii+"";
									pdto=pdao.selectProductDetail(pno);
							%>
								<td style="width:180px;"><a href="Controller?command=detail&pno=<%=pnoii%>"><img src="<%=pdto.getImage()%>"></a></td>
								<td style="width:130px;"><%=odto.getOrderdate().substring(0,10) %></td>
								<td style="width:auto;"><a href="Controller?command=detail&pno=<%=pnoii%>"><%=pdto.getPname()%></a><br/>[옵션:<%=odto.getColor() %>/<%=odto.getSize() %>]</td>
								<td style="width:130px;"><%=pdto.getPrice()%></td>
								<td style="width:40px;"><%=odto.getQty()%></td>
								<td style="width:150px;">
								<%
									if(odto.getReview()==1){
								%>
								<a href="Controller?command=goto_writeReview&obno=<%=odto.getObno()%>&pno=<%=pnoii%>"><button class="btn-bottom">후기 작성</button></a><br/>
								<%
									} else {
								%>
								<button class="btn-bottom">후기 작성 완료</button><br/>
								<%
									}
								%>
							</tr>
							<%
								}
							%>	
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="MainFooter.jsp" %>
</body>
</html>