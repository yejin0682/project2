<%@page import="com.yg.dto.MemberDTO"%>
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
		text-align:center;
		font-size:12px;
		border:0;
		border-bottom:1px solid #ccc;
	}
	
	#btn {
		margin-top: 40px;
	    height: 33px;
	    font-size: 11px!important;
	    font-weight: bold;
	    text-align: center;
	    width: 15%;
	    border:none;
	    color: #fff;
	    background-color: #d99f9d;
	    cursor: pointer;
	    float:right;
	}
	
	tfoot{
		background: #f7f7f7;
		text-align:right;
	}
	
	tfoot td{
		letter-spacing:0.1px;
		padding:10px;
		border-top:1px solid #ccc;
		border-bottom:1px solid #ccc;
	}
	
	.totalprice{
		font-size:18px;
		color:#d99f9d;
	}
	
	.boardWrite{
		table-layout:fixed;
		border-bottom: 1px solid #ccc;
		line-height: 180%;
		margin-top: 100px;
	}
	
	.boardWrite table{
		width:100%;
		border:0;
		border-spacing:0;
		border-collapse:collapse;
	}
	
	.boardWrite thead th{
		text-align:center;
		border-top:none;
		font-size:20px;
	}
	
	.boardWrite tbody{
		display:table-row-group;
		vertical-align:middle;
		border-color:inherit;
	}
	
	.boardWrite tr{
		display: table-row;
    	vertical-align: inherit;
    	border-color: inherit;
	}
	
	.boardWrite th{
		borde:0;
		width:130px;
		padding:10px 0 8px 20px;
		text-align:left;
		font-weight:normal;
		vertical-align:middle;
		border-bottom: 1px solid #ccc;
	}
	
	.boardWrite th b{
		color: #d99f9d;
		font-size:12px;
	}	
	
	.boardWrite td{
		border:0;
		width:auto;
		padding:10px 0 8px 40px;
		text-align:left;
		vertical-align:top;
		border-left: 1px solid white;
		border-bottom: 1px solid #ccc;
	}
</style>
<%
	ArrayList<BasketDTO> list=null;
	list=(ArrayList<BasketDTO>)request.getAttribute("basketorder");

	ProductDAO pdao=ProductDAO.getinstance();
	ProductDTO pdto=null;
	String bnoAll="";
	
	MemberDTO mdto=null;
	mdto=(MemberDTO)request.getAttribute("mdto");
	
	int totalprice=0;
%>
</head>
<body>
<div id="container">
	<div id="content">
		<div id="content-wrap">
			<div id="parag">
				<div class="path">
					<ul>
						<li style="color:black;">Order Form</li>
					</ul> 
				</div>
			</div>
			<div>
				<div>
					<table border="1">
						<thead>
							<tr>
								<th style="width:180px;">이미지</th>
								<th style="width:auto;">상품정보</th>
								<th style="width:130px;">판매가</th>
								<th style="width:130px;">배송구분</th>
								<th style="width:130px;">배송비</th>
								<th style="width:40px;">수량</th>
								<th style="width:120px;">합계</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<%
								for(BasketDTO bdto: list){
									int pnoii=bdto.getPno();
									String pno=pnoii+"";
									pdto=pdao.selectProductDetail(pno);
									int sum=bdto.getQty()*pdto.getPrice();
							%>
								<td style="width:180px;"><a href="Controller?command=detail&pno=<%=pnoii%>"><img src="<%=pdto.getImage()%>"></a></td>
								<td style="width:auto;"><a href="Controller?command=detail&pno=<%=pnoii%>"><%=pdto.getPname()%></a><br/>[옵션:<%=bdto.getColor() %>/<%=bdto.getSize() %>]</td>
								<td style="width:130px;"><%=pdto.getPrice()%></td>
								<td style="width:130px;">기본배송</td>
								<td style="width:130px;">[무료]</td>
								<td style="width:40px;"><%=bdto.getQty()%></td>
								<td style="width:120px;"><%=sum%></td>
							</tr>
							<%
									bnoAll=bnoAll+bdto.getBasketno()+",";
									totalprice=totalprice+sum;
								}
							%>	
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7">상품구매금액 <%=totalprice%> + 배송비 0 (무료) = 합계 : <strong class="totalprice"><%=totalprice %></strong></td>
							</tr>
						</tfoot>
					</table>
				</div>
								
				<div class="boardWrite">
				<form>
					<table border="1" summary>
						<thead>
							<tr>
								<th colspan="2">Payment Info</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<td><%=mdto.getName()%></td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td><input style="width:400px;" id="member_address" name="member_address" type="text" value="<%=mdto.getAddress()%>"></td>
							</tr>
							<tr>
								<th scope="row">휴대전화</th>
								<td>
								<%=mdto.getPhone().substring(0,3)%>&nbsp-<%=mdto.getPhone().substring(3,7)%>&nbsp-<%=mdto.getPhone().substring(7,11)%>
								</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td><input id="member_email" name="member_email" type="text" value=<%=mdto.getEmail()%>></td>
							</tr>
							<tr>
								<th scope="row">배송메시지</th>
								<td><textarea row="2" style="width:400px;"></textarea></td>
						</tbody>
						<tfoot>
							<tr>
								<th>Credit Card Number </th>
								<td><input type="text" name="creditcardnumber"></td>
							</tr>
							<tr>
								<th>Credit Card Password</th>
								<td><input type="text" name="creditcardpassword"></td>
							</tr>	
						</tfoot>
					</table>
				</form>	
				</div>
				
				<div>
					<a href="Controller?command=insertorder&bno=<%=bnoAll%>"><button id="btn">구매하기</button></a>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="MainFooter.jsp" %>
</body>
</html>