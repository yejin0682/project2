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
	
	form{
		margin:0 auto;
		box-sizing:border-box;
		display:block;
		font-size:11px;
	}
	
	#member{
		width:100%;
		margin: 0px auto;
		padding:30px 0;
		color:black;
	}
	
	.findPW{
		width:360px;
		margin:0 auto;
	}
	
	fieldset{
		border:none;
		vertical-aline:middle;
		margin:0 auto;
		
	}
	
	.check{
		margin:30px 0;
	}
	
	#id_view, #name_view{
		margin:7px 0 0;
		width:400px;
		display:block;
	}
	
	.findPW strong{
		display:inline-block;
		margin:0 0 5px;
		padding: 0 0px 0 10px;
		width:110px;
		
	}
	
	#name, #id{
		width: 235px;
		height: 25px;
	}
	
	.findPW input{
		padding: 2px 2px 2px 3px;
		border: 1px solid #d9d9d9;
		color:black;
		font-size:100%;
		vertical-align:middle;
		margin:0 auto;
	}
	
	#email_view{
		margin:7px 0 0;
		width:400px;
	}
	
	#email{
		width:235px;
		height:25px;
	}
	
	#phone_view{
		margin:7px 0 0;
		width:400px;
	}
	
	#phone1, #phone2, #phone3{
		width:40px;
		height:25px;
	}
	
	.btn-wrap{
		padding:30px 0;
	}
	
	.btn-wrap a{
		list-style:none;
		text-decoration:none;
	}
	
	.btn01{
		text-align: center;
    	width: 367px;
    	height: 42px;
    	display: inline-block;
    	padding: 12px;
    	vertical-align: middle;
    	background: #ccc;
    	border: 1px solid #ccc;
	}
	
</style>
<script>
	function changeDisplay(){
		if(document.getElementById("check_method1").checked) {
			document.getElementById("email_view").style.display="block";
			document.getElementById("phone_view").style.display="none";
		} else {
			document.getElementById("email_view").style.display="none";
			document.getElementById("phone_view").style.display="block";
		}
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
						<li style="color:black;">ForGotten PassWord?</li>
					</ul> 
				</div>
			</div>
			<form action="Controller?command=findmemberpw" method="post" id="findPwForm" name="findPW">
				<div id="member">
					<div class="findPW">
						<fieldset>
							<p class="check">
								<input id="check_method1" type="radio" value="emailchk" checked="checked" name="check_method" onchange="changeDisplay()">
								<label for="check_method1">이메일</label>&nbsp
								<input id="check_method2" type="radio" value="phonechk" name="check_method" onchange="changeDisplay()">
								<label for="check_method2">휴대전화</label>
							</p>
							<p id="id_view" class="id">
								<strong id="id_label">아이디</strong>
								<input id="id" name="id" type="text">
							</p>
							<p id="name_view" class="name">
								<strong id="name_label">이름</strong>
								<input id="name" name="name" type="text">
							</p>
							<p id="email_view" class="email" style="display:block;">
								<strong id="email_label">이메일로 찾기</strong>
								<input id="email" name="email" type="text">
							</p>
							<p id="phone_view" class="phone" style="display:none;">
								<strong id="email_label">휴대폰 번호로 찾기</strong>
								<input id="phone1" name="phone1" maxlength="3" type="text">&nbsp-
								<input id="phone2" name="phone2" maxlength="4" type="text">&nbsp-
								<input id="phone3" name="phone3" maxlength="4" type="text">
							</p>
							<p class="btn-wrap">
								<input type="submit" value="OK" class="btn01" style="color:white">
							</p>
							<div style="text-align:center; margin-top:30px; margin-left: -28px;">
								<a href="FindID.jsp" style="text-decoration:none; color:black;">Forgotten ID?</a>
							</div>								
						</fieldset>
					</div>
				</div>
			</form>

		</div>
	</div>
</div>
<%@ include file="MainFooter.jsp" %>
</body>
</html>