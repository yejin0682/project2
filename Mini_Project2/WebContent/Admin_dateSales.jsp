<%@page import="com.yg.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs="
	crossorigin="anonymous"></script>		<!-- jquery.cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>	<!-- 달력 -->

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
	
	.boardList{
		text-align:center;
		font-size:19px;
	}
	
	#btn {
	    height: 33px;
	    font-size: 11px!important;
	    font-weight: bold;
	    text-align: center;
	    width: 15%;
	    border:none;
	    color: #fff;
	    background-color: #d99f9d;
	    cursor: pointer;
	}
	
	#datepicker1, #datepicker2 {
		height:25px;	
		border: 1px solid #ccc;
	}
	
</style>
<script>
    $(function() {
		$("#datepicker1").flatpickr();
	});

</script>
</head>
<body>

<div id="container">
	
	<div id="content">
		<div id="content-wrap">
			<div id="parag">
				<div class="path">
					<ul>
						<li style="color:black;">관리자 - 날짜별 매출 보기<li>
					</ul>
				</div>
			</div>
			
			<div class="boardList" style="margin-top: 135px;">
				<form action="Controller?command=show_dateSales" method="post">
					<p>Date : &nbsp;
						<input type="text" id="datepicker1" name="date"/>
						<input type="submit" id="btn" value="View"/>
					</p>
				</form>
			
			</div>
			
		</div>
	</div>


</div>
</body>
</html>