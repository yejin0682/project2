<%@page import="com.yg.dto.MemberDTO"%>
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
		margin-top:-70px;
		box-sizing:border-box;
		display:block;
	}
	
	#join{
		margin-top:50px;
	}

	h4{
		clear:both;
		padding:50px 0 20px 20px;
		font-size:13px;
		margin: 0 auto;
	}
	
	.required{
		font-size:12px;
		margin: -25px 0 10px;
		color:black;
		text-align:right;
	}
	
	.required b{
		color: #d99f9d;
		font-size:12px;
	}
	
	.boardWrite{
		table-layout:fixed;
		border-top: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
		line-height: 180%;
	}
	
	table{
		width:100%;
		border:0;
		border-spacing:0;
		border-collapse:collapse;
	}
	
	tbody{
		display:table-row-group;
		vertical-align:middle;
		border-color:inherit;
	}
	
	tr{
		display: table-row;
    	vertical-align: inherit;
    	border-color: inherit;
	}
	
	th{
		borde:0;
		width:130px;
		padding:10px 0 8px 20px;
		text-align:left;
		font-weight:normal;
		vertical-align:middle;
				border-bottom: 1px solid #ccc;
	}
	
	th b{
		color: #d99f9d;
		font-size:12px;
	}	
	
	td{
		border:0;
		width:auto;
		padding:10px 0 8px 40px;
		text-align:left;
		vertical-align:top;
		border-left: 1px solid white;
		border-bottom: 1px solid #ccc;
	}
	
	#join input{
		padding:4px;
		border: 1px solid #d9d9d9;
		height:15px;
		color:black;
		font-size:12px;
		vertical-align:middle;
		margin:0 auto;
		text-transform:none;
	}
	
	.btn-wrap{
		text-align: right;
    	margin: 30px auto;
    	padding: 30px 0;
	}
	
	.btn-wrap input{
		text-align: center;
    	width: 120px;
    	display: inline-block;
    	padding: 12px;
    	vertical-align: middle;
    	background: #d99f9d;
    	color: #fff;
    	border: 1px solid #d99f9d;
    	cursor:pointer;
	}
	
	.btn-wrap a{
		list-style:none;
		text-decoration:none;
		cursor: pointer;
	}
	
	.btn-wrap span{
		text-align: center;
    	width: 95px;
    	display: inline-block;
    	padding: 12px;
    	vertical-align: middle;
    	background: #ccc;
    	color: #fff;
    	border: 1px solid #ccc;
	}
</style>
</head>
<body>
<%
	MemberDTO mdto=(MemberDTO)request.getAttribute("memberinfo");
%>
<div id="container">
	<div id="header">
	
	</div>
	
	<div id="content">
		<div id="content-wrap">
			<div id="parag">
				<div class="path">
					<ul>
						<li style="color:black;">Info Update</li>
					</ul>
				</div>
			</div>
		<form action="Controller?command=memberinfoupdate" method="post">
			<div id="join">
				<h4>기본정보</h4>
				<p class="required"><b>*</b> 필수입력사항</p>
				<div class="boardWrite">
					<table border="1" summary>
						<tbody>
							<tr>
								<th scope="row">아이디 <b>*</b></th>
								<td><%=session.getAttribute("ID")%></td>
							</tr>
							<tr>
								<th scope="row">비밀번호 <b>*</b></th>
								<td><input id="member_pw" name="member_pw" type="password" value=<%=mdto.getPW()%>></td>
							</tr>
							<tr>
								<th scope="row">이름 <b>*</b></th>
								<td><input id="member_name" name="member_name" type="text" value=<%=mdto.getName()%>></td>
							</tr>
							<tr>
								<th scope="row">주소 <b>*</b></th>
								<td><input style="width:400px;" id="member_address" name="member_address" type="text" value="<%=mdto.getAddress()%>"></td>
							</tr>
							<tr>
								<th scope="row">휴대전화</th>
								<td>
								<input style="width:40px;" id="member_phonenum1" name="member_phonenum1" maxlength="3" type="text" value=<%=mdto.getPhone().substring(0,3)%>>&nbsp-
								<input style="width:40px;" id="member_phonenum2" name="member_phonenum2" maxlength="4" type="text" value=<%=mdto.getPhone().substring(3,7)%>>&nbsp-
								<input style="width:40px;" id="member_phonenum3" name="member_phonenum3" maxlength="4" type="text" value=<%=mdto.getPhone().substring(7,11)%>>
								</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td><input id="member_email" name="member_email" type="text" value=<%=mdto.getEmail()%>></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btn-wrap">
				<input type="submit" value="Update">
				<a href="MyPage.jsp"><span class="btn-cancel">Cancel</span></a>
			</div>
		</form>
		</div>
	</div>
</div>
 <%@ include file="MainFooter.jsp" %>
</body>
</html>