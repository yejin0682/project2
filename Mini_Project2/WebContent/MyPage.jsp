<%@page import="com.yg.dto.ReviewDTO"%>
<%@page import="com.yg.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="MainHeader.jsp" %>    
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    
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
	
	.welcome{
		font-size:15px;
		color: #787573;
		text-align: center;
		margin-bottom:50px;
	}
	
	.box1{
		margin:0 auto;
		text-align:center;
	}
	
	table {
	    width: 50%;
	    border: 0;
	    border-spacing: 0;
	    border-collapse: collapse;
	    margin:0 auto;
	}
	
	table td {
		padding:15px;
	    border: 1px solid #ccc;
	    width:33%;
	}
	
	.box-font{
		font-size:12px;
	}
	
	.removemember{
		background:white;
		border:none;
	}
	
	
</style>
<script>
function removeCheck() {
	 if (confirm("정말 삭제하시겠습니까??") == true){    
	 	location.href="Controller?command=memberdelete";
	 }else{   
	     return false;
	 }

	}
</script>
</head>
<body>

<div id="container">
	<div id="content">
		<div id="content-wrap">
			<div id="parag">
				<div class="path">
					<ul>
						<li style="color:black;">MyPage<li>
					</ul>
				</div>
			</div>
				<div class="welcome">
					<p><b style="color:black; font-size:20px;"><%=session.getAttribute("ID")%></b>&nbsp;님 환영합니다</p>
				</div>
				
				<div class="box1">
					<table>
						<td><a href="Controller?command=showorderlist"><i style="color:#787573;" class="far fa-list-alt fa-4x"></i></a><br/><br/>
							<span class="box-font">주문내역조회</span>
						</td>
						<td><a href="Controller?command=memberinfoselect"><i style="color:#787573;" class="fas fa-user fa-4x"></i></a><br/><br/>
							<span class="box-font">회원정보 수정</span>
						</td>
						<td><button class="removemember" onclick="removeCheck()"><i style="color:#787573;" class="fas fa-cog fa-4x"></i></button><br/><br/>
							<span class="box-font">회원탈퇴</span>
						</td>
					</table>
				</div>
		
		</div>
	</div>


</div>
<%@ include file="MainFooter.jsp" %>    
</html>