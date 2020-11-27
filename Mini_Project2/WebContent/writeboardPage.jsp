<%@page import="com.yg.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="MainHeader.jsp" %>
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
	
	.boardView{
		margin:0 auto;
		border-bottom:1px solid #ccc;
	}
	
	table{
		table-layout:fixed;
		border:0;
		border-top:1px solid #ccc;
		color:black;
		font-size:12px;
	}
	
	th{
		text-align: left;
    	width: 110px;
    	padding: 10px 45px 8px 20px;
	    font-weight: normal;
	    border:none;
	    border-right: 1px solid #ccc;
	    border-bottom:1px solid #ccc;
	}
	
	td{
		padding: 10px 0 8px 10px;
    	width: 100%;
    	border:none;
    	border-bottom:1px solid #ccc;
	}
	
	.btn-mini{
		margin:10px auto;
		padding:5px 0;
		text-align:center;
	}
	
	.left{
		float:left;
	}
	
	.left a{
		list-style:none;
		text-decoration:none;
		color:black;
	}
	
	.btn-bottom{
		display:inline-block;
		width:70px;
		color:white;
		background:#ccc;
		padding:5px;
		border:none;
	}
	
	.right{
		float:right;
	}
	
	.titlebox{
		width: 600px;
    	border: 1px solid #ccc;
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
						<li style="color:black;">Q & A	<li>
					</ul>
				</div>
			</div>
			<form action="Controller?command=writeboard" method="post">
			<div class="boardView">
				<table border="1">
					<tbody>
						<tr>
							<th scope="row">Subject</th>
							<td><input class="titlebox" type="text" name="qtitle"></td>
						</tr>
						<tr>
							<th scope="row">Name</th>
							<td><%=session.getAttribute("ID")%></td>
						</tr>
						<tr>
							<td style="padding:10px 10px"colspan="2"><textarea rows="20" style="width:100%; border:1px solid #ccc;" name="qcontent"></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btn-mini">
				<span class="left">
					<a href="Controller?command=showboard&page=1"><span class="btn-bottom">목록</span></a>				
				</span>
				
				<span class="right">
					<input class="btn-bottom" type="submit" value="작성 완료">
				</span>
			</div>
			</form>
		</div>
	</div>


</div>
<%@ include file="MainFooter.jsp" %>
</body>
</html>