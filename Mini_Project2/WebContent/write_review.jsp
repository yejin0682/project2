<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ include file="MainHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>후기 작성 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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
    	margin-bottom:100px;
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
		margin:0 auto;
		font-size: 14px;
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
		border : 1px sloid #ccc;
	    margin-top: 20px;
	    margin-right:0px;
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
	}
	#content img {
	    width: 200px;
	}
	#rcontent {
	    height: 400px;
	    width: -webkit-fill-available;
		border-bottom: 1px solid #ccc;
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
	}
	/*-- 스크롤바-- */
	::-webkit-scrollbar {
	    width: 18px;
	}
	::-webkit-scrollbar-button {
	    display: none;
	    height: 10px;
	    background: #d99f9d;
	}
	::-webkit-scrollbar-thumb {
	    height: 10px;
	    width: 10px;
	    background: #d99f9d;
	    -webkit-border-radius: 0px;
	    border-radius: 0px;
	}
</style>
</head>
<body>			<!--  https://coding-factory.tistory.com/34  -->
<div id="container">
	<div id="content">
		<div id="content-wrap">
			<div id="parag">
				<div class="path">
					<ul>
						<li style="color:black;">Review</li>
					</ul> 
				</div>
			</div>
			<div class="reviewdetailsize">
			<form action="Controller?command=write_review" method="post" enctype="multipart/form-data">
				<table>
					<tr style="border-top: 1px solid #ccc;">
						<td rowspan="3" style="text-align: center;"><img src="${dto.getImage() }"/></td>
						<td>구매상품</td><th colspan="6">${dto.getPname() }</th>
					</tr>
					<tr>
						<td>색상</td><th colspan="2">${dto.getColor()}</th>
						<td>사이즈</td><th colspan="3">${dto.getSize()}</th>
					</tr>
					<tr>
						<td>작성자</td><th colspan="6">${ID }</th>
					</tr>
					<tr style="border-bottom: 1px solid #ccc;">
							<td>제목</td><th colspan="6"><input type="text" id="rtitle" name="rtitle" style="width: 600px;"/></th>
					</tr>
					<tr style="border-bottom: 1px solid #ccc;">
						<td>파일첨부</td>
						<th colspan="6">
							<input type="file" id="image" name="fileName1" maxlength="2" accept="image/*" multiple/>
							<input type="file" id="image2" name="fileName2" accept="image/*" multiple/>
							<input type="text" id="info" value="이미지는 최대 2장만 첨부가능합니다." readonly="readonly"/>
						</th>
					</tr>
				</table>
				<p style='height: 400px;'><textarea id="rcontent" name="rcontent" cols="40" rows="8" autofocus></textarea></p>
		
				<input type="hidden" name="obno" value="${obno }"/>
				<input type="hidden" name="pno" value="${pno }"/>
				<input type="hidden" name="pageIs" value="2"/>
				<input type="submit" id="btn" class="btn btn-primary" value="등록"/>
			</form>

			</div>
		</div>
	</div>
</div>
<%@ include file="MainFooter.jsp" %>
</body>
<script>
	var upload = document.querySelector('#image');
	var upload2 = document.querySelector('#image2');
	
		 /* FileReader 객체 생성 */
		var reader = new FileReader();
		
		    /* reader 시작시 함수 구현 */
		reader.onload = (function () {
	
	    this.image = document.createElement('img');
	    var vm = this;
	    
	    return function (e) {
	        /* base64 인코딩 된 스트링 데이터 */
	        vm.image.src = e.target.result
	    }
	})()
	
	upload.addEventListener('change',function (e) {
	    var get_file = e.target.files;
	
	    if(get_file){
	        reader.readAsDataURL(get_file[0]);
	    }
	
	    preview.appendChild(image);
	})
</script>
</html>