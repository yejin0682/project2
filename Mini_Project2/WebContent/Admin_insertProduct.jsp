<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div id="container">
	<div id="header">
	
	</div>
	
	<div id="content">
		<div id="content-wrap">
			<div id="parag">
				<div class="path">
					<ul>
						<li style="color:black;">관리자 -상품입력</li>
					</ul>
				</div>
			</div>
		<form action="Controller?command=insertproduct" method="post">
			<div id="join">
				<p class="required"><b>*</b> 필수입력사항</p>
				<div class="boardWrite">
					<table border="1" summary>
						<tbody>
							<tr>
								<th scope="row">상품명 <b>*</b></th>
								<td><input style="width:800px;" id="member_id" name="product_name" type="text"></td>
							</tr>
							<tr>
								<th scope="row">color<b>*</b></th>
								<td><input style="width:800px;" id="member_email" name="product_color" type="text"></td>
							</tr>
							<tr>
								<th scope="row">size<b>*</b></th>
								<td><input style="width:800px;" id="member_email" name="product_size" type="text"></td>
							</tr>
							<tr>
								<th scope="row">가격 <b>*</b></th>
								<td><input style="width:800px;" id="member_pw" name="product_price" type="text"></td>
							</tr>
							<tr>
								<th scope="row">이미지<b>*</b></th>
								<td><input style="width:800px;" id="member_name" name="product_image" type="text"></td>
							</tr>
							<tr>
								<th scope="row">inform <b>*</b></th>
								<td><input style="width:800px;" id="member_address" name="product_inform" type="text"></td>
							</tr>
							<tr>
								<th scope="row">product info</th>
								<td><input style="width:800px;" id="member_name" name="product_info" type="text"></td>
							</tr>
							<tr>
								<th scope="row">size info</th>
								<td><input style="width:800px;" id="member_email" name="size_info" type="text"></td>
							</tr>
							<tr>
								<th scope="row">category</th>
								<td><input style="width:800px;" id="member_email" name="category" type="text"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btn-wrap">
				<input type="submit" value="Insert">
				<a href="AdminMainPage.jsp"><span class="btn-cancel">Cancel</span></a>
			</div>
		</form>
		</div>
	</div>
</div>

</body>
</html>