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
	
	#member-wrap{
		text-align:center;
		display:block;
		box-sizing:border-box;
	}
	
	#member-form{
		display:inline-block;
		vertical-align:top;
		margin:0 auto;
		box-sizing:border-box;
		text-align:center;
	}
	
	#member{
		width:535px;
		margin:0 auto;
		box-sizing:border-box;
		text-align:center;
	}
	
	.log-wrap{
		margin:10px;
		background:#faf7f2;
	}
	
	.login{
		border: 1px solid black;
		padding: 50px 0;
		min-height:400px;
	}
	
	fieldset{
		border:none;
		vertical-aling:middle;
		margin:0 auto;
		box-sizing:border-box;
	}	
	
	.id{
		display:block;
		width:385px;
		margin:15px auto;
		border: 1px solid black;
		border-radius:0;
		margin-bottom:0;
	}
	
	.id span{
		text-align:left;
		float:left;
		width:73px;
		height:50px;
		line-height:50px;
		color:black;
		padding-left:10px;
		background:white;
	}
	
	#member_id{
		padding-left:10px !important;
		border:1px solid white !important;
		width:318px;
		height:50px;
		color:black;
		padding: 3px 0 0 9px;
		font-size:100%;
		vertical-align:middle;
		margin:0 auto;
		box-sizing:border-box;
		margin-left:-8px;
	}
	
	.password{
		display:block;
		width:385px;
		margin:15px auto;
		border: 1px solid black;
		border-radius:0;
		margin-bottom:0;
	}
	
	.password span{
		text-align:left;
		float:left;
		width:73px;
		height:50px;
		line-height:50px;
		color:black;
		padding-left:10px;
		background:white;
	}
	
	#member_pw{
		padding-left:10px !important;
		border:1px solid white !important;
		width:318px;
		height:50px;
		color:black;
		padding: 3px 0 0 9px;
		font-size:100%;
		vertical-align:middle;
		margin:0 auto;
		box-sizing:border-box;
		margin-left:-8px;
	}
	
	.btn-wrap{
		margin:0;
		text-align:center;
		padding: 30px 0;
		box-sizing:border-box;
	}
	
	.btn-wrap a{
		height:50px;
		line-height:50px;
		list-style:none;
		text-decoration:none;
		color:black;
	}
	
	.btn-wrap .log{
		background-color:#d99f9d;
		color:black;
		padding:0;
		font-size:12px;
	}
	
	fieldset .btn{
		display:inline-block;
		width:385px;
		height: 50px;
		border: 1px solid black;
	}
	
	.find{
		font-size: 11px;
    	line-height: 18px;
    	margin: 0 auto;
    	padding: 0px;
	}
	
	.find a{
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
						<li style="color:black;">Login</li>
					</ul>
				</div>
			</div>
			<div id="member-wrap">
				<form action="Controller?command=memberlogin" method="post" id="member-form">
					
					
					<div id="member">
						<div class="log-wrap">
							<div class="login">
								<fieldset>
									<label class="id">
										<span>ID</span>
										<input id="member_id" name="member_id" type="text">
									</label>
									<label class="password">
										<span>Password</span>
										<input id="member_pw" name="member_pw" type="password">
									</label>
									
									<div class="btn-wrap">
										<div>
											<input type="submit" class="log btn" value="로그인">
										</div>
										<div style="color:rgb(16,16,16); margin:10px 0px;">X</div>
										<div>
											<a href="MemberJoinPage.jsp"><span class="btn">회원가입</span></a>
										</div>
									</div>
								</fieldset>
								<div class="find">
									<a href="FindID.jsp">아이디 찾기</a><br/>
									<a href="FindPassWord.jsp">비밀번호 찾기</a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="MainFooter.jsp" %>
</body>
</html>