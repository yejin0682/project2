<%@page import="com.yg.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="ie=edge"> 
<title>부트스트랩 차트그리기</title> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
<!-- 차트 링크 --> 
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> 
<style>
	div{
		display:block;
		vertical-align:baseline;
	}
	
	#content{
		width: 100%;
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
	
	#btn {
		margin-top: 40px;
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
	
</style>
</head> 
<body> 
<%
	String[] month=new String[9];
	ArrayList<Integer> monthly_sales =new ArrayList<Integer>();

	for(int i=1;i<=9;i++) {
		month[i-1]="2020-0"+i;
	}

	OrderDAO odao=OrderDAO.getinstance();

	int sum=0;
	
	for(int i=0;i<9;i++) {
		sum=odao.showchart(month[i]);
		monthly_sales.add(sum);
	}
%>
	<div class="container"> 
		<div id="content">
			<div id="content-wrap">
				<div id="parag">
					<div class="path">
						<ul>
							<li style="color:black;">관리자 - 월 차트<li>
						</ul>
					</div>
				</div>
			
			</div> 
		<canvas id="myChart">
		</canvas> 
	<!-- 부트스트랩 --> 
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
	<!-- 차트 --> 
	<script> 
		var ctx = document.getElementById('myChart').getContext('2d'); 
		var chart = new Chart(ctx, { 
			// 챠트 종류를 선택
			 type: 'line', 
			// 챠트를 그릴 데이타
			 data:{ 
				 labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September'], 
				 datasets: [{ 
					 label: '월 매출', 
					 backgroundColor: 'transparent', 
					 borderColor: '#163eab', 
					 data: [
					<%
						for(int i=0;i<9;i++){
					%>		<%=monthly_sales.get(i)%>,<%
						}
					%>
						 ]
				 }] 
		 }, 
		 // 옵션
		  options: {} 
		  }); 
	</script>
			<div style="text-align:center;">
				<a href="AdminMainPage.jsp"><button id="btn">Main</button></a>
			</div> 
		</div>
	</div>
</body>

</html>