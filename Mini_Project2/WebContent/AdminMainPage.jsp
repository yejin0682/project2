<%@page import="com.yg.dto.BoardDTO"%>
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
		width:100%;
		border:0;
		border-spacing:0;
		border-collapse:collapse;
	}
	
	thead{
		vetical-align:middle;
		font-size:11px;
	}
	
	.boardList th{
	    width: 80px;
		padding: 10px 0 10px 20px;
		border-top:1px solid #ccc;
		border-bottom:1px solid #ccc;
		font-weight:bold;
		text-align:center;
	}
	
	th{
		border:0;
		vertical-align:top;
	}
	
	.boardList td{
		text-align: center;
    	border-bottom: 1px solid #ccc;
    	border-left: none;
    	border-right: none;
    	padding: 10px 0px 10px 20px;
    	font-size: 13px;
	}
	
	.boardList a{
		list-style:none;
		text-decoration:none;
		color:black;
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
						<li style="color:black;">관리자	<li>
					</ul>
				</div>
			</div>
			
			<div class="boardList" style="margin-top: 35px;">
				<table border="1">
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">Subject</th>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><a href="Controller?command=admin_showmember">회원조회</a></td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="Controller?command=admin_showorder">회원주문조회</a></td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href="Admin_dateSales.jsp">날짜별 매출 조회</a></td>
						</tr>
						<tr>
							<td>4</td>
							<td><a href="Admin_sumsales.jsp">매출 합산</a></td>
						</tr>
						<tr>
							<td>5</td>
							<td><a href="Admin_CompareSales.jsp">매출 비교</a></td>
						</tr>
						<tr>
							<td>6</td>
							<td><a href="Admin_insertProduct.jsp">상품 추가</a></td>
						</tr>
						<tr>
							<td>7</td>
							<td><a href="showchart.jsp">월 차트</a></td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>


</div>
</body>
</html>