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
	
	textarea {
		resize: none; 
		border: 0; 
	}
	#rcontent {
	    height: 400px;
	    width: -webkit-fill-available;
	    border-bottom: 1px solid #ccc;
	}
	
	input:focus, textarea:focus {
		outline: none; 
	}
	input {
		border: 0; 
	}
	
	p {
		border-collapse: collapse;
		border : 1px sloid #ccc;
	    margin-top: 20px;
	    text-align:left;
	}
	#content img {
	    width: 200px;
	}
	#btn {
		margin-left:80px;
		float: left;
	    height: 42px;
	    font-size: 13px!important;
	    font-weight: bold;
	    text-align: center;
        width: 77px;
        border:none;
	    color: #fff;
	    background-color: #d99f9d;
	    cursor:pointer;
	}
	p {
		border-collapse: collapse;
		border : 1px sloid #afafaf;
	}
	#btns {
		float: right;
		margin-right:80px;
	}
	
	#btn-bottom{
		display:inline-block;
		width:70px;
		color:white;
		background:#ccc;
		padding:5px;
		border:none;
		cursor:pointer;
		float:right;
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
						<li style="color:black;">Review<li>
					</ul>
				</div>
			</div>
			<div class="reviewdetailsize">
				<form action="Controller?command=update_review&rbno=<%= request.getAttribute("rbno")%>" method="post">
					<table>
						<tr style="border-top: 1px solid #ccc;">
							<td rowspan="3" style="text-align: center;"><img src="${dto.getImage() }"/></td>
							<td>구매상품</td><th colspan="6">${dto.getPname() }</th>
						</tr>
						<tr>
							<td>작성자</td><th colspan="6">${dto.getID() }</th>
						</tr>
						<tr>
							<td>색상</td><th colspan="2">${dto.getColor()}</th>
							<td>사이즈</td><th colspan="3">${dto.getSize()}</th>
						</tr>
						<tr>
							<td>제목</td><th colspan="6"><input type="text" name="rtitle" value="${dto.getRtitle() }"  style="width: -webkit-fill-available;"/></th>
						</tr>
						<tr style="border:0">
							<td id="removeTd"><img src="resources/${getImg }"/></td>
							<td id="removeTd2"><img src="resources/${getImg2 }"/></td>
						</tr>
					</table>
					<p style='height: 400px;'><textarea id="rcontent" name="rcontent" cols="40" rows="8" autofocus="autofocus">${dto.getRcontent() }</textarea></p>

					<input type="hidden" name="pageIs" value="2"/>
					<input type="hidden" name="command" value="update_review"/>
					<input type="hidden" name="rbno" value="<%= request.getAttribute("rbno")%>"/>
					<input type="submit" id="btn-bottom" value="수정"/>
				</form>
			</div>
			<%
				String pno=(String)request.getAttribute("pno");
			  	request.setAttribute("pno",pno);	
			%>
			<a href="Controller?command=review_board&pno=<%=request.getAttribute("pno")%>&page=1"><input type="button" id="btn" value="목록"/></a>
		
		</div>
	</div>


</div>
<%@ include file="MainFooter.jsp" %>
</body>
<%	if(request.getAttribute("getImg").equals("(첨부된 파일 없음)")) {%>
		<script>
			$(function() {
				$("#removeTd").remove();
				});
		</script>
	<%}
%>
<%	if(request.getAttribute("getImg2").equals("(첨부된 파일 없음)")) {%>
		<script>
			$(function() {
				$("#removeTd2").remove();
				});
		</script>
	<%}
%>
</html>