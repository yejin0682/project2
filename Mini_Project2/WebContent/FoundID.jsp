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
	
	.BigBox{
		width:500px;
		border: 1px solid #d9d9d9;
		diplay:block;
		margin:0px auto;
	}
	
	.smallBox1{
		padding: 16px 0;
	}
	
	.smallBox1 p{
		text-align:center;
		font-size:20px;
	}
	
	.smallBox2{
		margin: 0 auto;
    	margin-bottom: 16px;
    	width: 332px;
    	height: 60px;
    	background-color: #faf7f2;
	}
	
	.smallBox2 p{
		font-size:15px;
		text-align:center;
		line-height: 4;
		font-weight:600;
		color:#706a65;
	}
	
	.buttonbox{
	 	width:320px;
	 	margin: 0 auto;
	 	margin-top:40px;
	 	align:center;
	}
	
	.btn01{
		width: 320px;
	    height: 42px;
    	border: none;
    	background-color: #d99f9d;
	}
	
	.pwbox{
		margin: 0 auto;
		font-size:15px;
	}
	
	.pwbox a{
		text-decoration:none;
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
						<li style="color:black;">Found ID</li>
					</ul> 
				</div>
			</div>
			<div class="BigBox">
				<div class="smallBox1">
					<p>회원님의 아이디 찾기가 완료되었습니다</p>
				</div>
				<div class="smallBox2">
					<p>아이디&nbsp&nbsp:&nbsp&nbsp<b style="color:#e79a5e"><%=request.getParameter("ID")%></b></p>
				</div>
			</div>
			
			<div class="buttonbox">
				<a href="LoginPage.jsp"><button class="btn01">LogIn</button></a>
			</div>
			<div style="text-align:center; margin-top:30px;">
				<a href="FindPassWord.jsp" style="text-decoration:none; color:black;">Forgotten Password?</a>
			</div>

		</div>
	</div>
</div>
<%@ include file="MainFooter.jsp" %>
</body>
</html>