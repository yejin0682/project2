<%@page import="com.yg.dto.MemberDTO"%>
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
		padding: 10px 0 10px 20px;
		border-top:2px solid #ccc;
		border-bottom:2px solid #ccc;
		font-weight:bold;
		font-size:13px;
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
	<%
	ArrayList<MemberDTO> list=null;
	
	list=(ArrayList<MemberDTO>)request.getAttribute("memberlist");
	%>
	

<div id="container">
	<div id="header">
	
	</div>
	
	<div id="content">
		<div id="content-wrap">
			<div id="parag">
				<div class="path">
					<ul>
						<li style="color:black;">관리자 - 회원조회	<li>
					</ul>
				</div>
			</div>
			
			<div class="boardList" style="margin-top: 35px;">
				<table border="1">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">PW</th>
							<th scope="col">name</th>
							<th scope="col">phone</th>
							<th scope="col">email</th>
							<th scope="col">address</th>
					</thead>
					<tbody>
					<%
						for(MemberDTO mdto: list){
					%>
						<tr>
							<td><%=mdto.getID()%></td>
							<td><%=mdto.getPW()%></td>
							<td><%=mdto.getName()%></td>
							<td><%=mdto.getPhone()%></td>
							<td><%=mdto.getEmail()%></td>
							<td><%=mdto.getAddress()%></td>
						</tr>
					<%
		
						}
					%>
					</tbody>
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