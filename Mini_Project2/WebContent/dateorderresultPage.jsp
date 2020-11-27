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
						<li style="color:black;">관리자 - 매출 합산<li>
					</ul>
				</div>
			</div>
			<div style="text-align:center;">
				<b><p style="margin-top: 100px; font-size:20px;"><%=request.getParameter("date1")%> ~ <%=request.getParameter("date2")%>&nbsp;&nbsp;매출액: <%=request.getAttribute("total")%></p></b>
				<a href="AdminMainPage.jsp"><button id="btn">Main</button></a>
			</div>
		</div>
	</div>

</div>
</body>
</html>