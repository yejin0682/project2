<%@page import="com.yg.dto.ReviewDTO"%>
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
	}
	
	ul{
		padding-left:0px;
	}
	
	li{
		list-style:none;
		display:inline-block; 
	}
	
	.reviewdetailsize{
		width: 900px;
		margin: auto;
		font-size: 14px;
		text-align:left;
		letter-spacing:0.3px;
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
	p {
		border-collapse: collapse;
		border-bottom : 1px solid #ccc;
	    margin-top: 20px;
	}
	input:focus, textarea:focus {
		outline: none; 
	}
	input {
		border: 0; 
	}
	
	textarea {
		resize: none; 
		border: 0; 
	    font-size: 15px;
	}
	#btn {
		float: right;
	    height: 42px;
	    font-size: 13px!important;
	    font-weight: bold;
	    text-align: center;
	    width: 10%;
	    border: none;
	    color: #fff;
	    background-color: #d99f9d;
	    float:left;
	   	margin-top:50px;
	}
	
	.btn-bottom{
		display:inline-block;
		width:70px;
		color:white;
		background:#ccc;
		padding:5px;
		border:none;
		cursor:pointer;
		float:right;
		margin-top:50px;
	}
</style>
<script>
	function go_showreviewDetail(){
		history.back();
		}
</script>
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
						<li style="color:black;">Review<li>
					</ul>
				</div>
			</div>
			<div class="reviewdetailsize">
				<form action="Controller?command=write_Re_review" method="post">
					<table>
						<tr style="border-top: 1px solid #ccc;">
							<td>작성자</td><th style="text-align: left;"><%=session.getAttribute("ID") %></th>
						</tr>
						<tr style="border-bottom: 1px solid #ccc;">
							<td>제목</td><th><input type="text" id="title" name="title" style="width: -webkit-fill-available;"/></th>
						</tr>
					</table>
					<p><textarea id="content" name="content" cols="40" rows="8" autofocus></textarea></p>
			
					<input type="submit" class="btn-bottom" value="답글달기"/>
				</form>
				<button id="btn" onclick="go_showreviewDetail()">취소</button>
			</div>
		
		</div>
	</div>


</div>
<%@ include file="MainFooter.jsp" %>    
</html>