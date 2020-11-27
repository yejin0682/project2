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
	
	.qa_contents{
		background: #eeeeee;
		padding:30px;
		margin_bottom;
		text-align:center;
	}
	
	.qa_tit{
		font-size: 15px;
    	background: #d99f9d;
    	width: 150px;
    	margin: auto;
    	color: white;
    	padding: 5px 15px;
    	border-radius: 10px;
    	font-weight: 800;
	}
	
	.qa_txt{
		font-size: 13px;
    	padding: 25px;
    	line-height: 24px;
	}


	table {
		width:100%;
		border:0;
		border-spacing:0;
		border-collapse:collapse;
	}
	
	thead{
		vetical-align:middle;
		font-size:11px;
	}
	
	.boardList th{
		padding: 10px 0 10px 20px;
		border-top:1px solid #ccc;
		border-bottom:1px solid #ccc;
		font-weight:normal;
		text-align:center;
	}
	
	th{
		border:0;
		vertical-align:top;
	}
	
	.boardList td{
		text-align: center;
    	border-bottom: 1px solid #ccc;
    	border-left: none;
    	border-right: none;
    	padding: 10px 0px 10px 20px;
    	font-size: 13px;
	}
	
	.boardList a{
		list-style:none;
		text-decoration:none;
		color:black;
	}
	
	.board-search{
		padding: 10px 0 20px;
		font-size: 12px;
		text-align:center;
		float:left;		
	}
	
	.board-search fieldset{
		border:none;
		display:block;
		margin:5px auto;
		padding:5px 0;
		text-align:center;
		vertical-align:middle;
	}
	
	#search{
		height:26px;
		width:162px;
		padding:3px;
		border: 1px solid #ccc;
		color:black;
		font-size:100%;
		vertical-align:middle; 
	}
	
	#search-btn{
		background: white;
    	border: 1px solid #ccc;
    	height: 26px;
    	width: 70px;
    	vertical-align: bottom;
	}
	
	#paging{
		padding: 80px 0;
		text-align:center;
		margin: 0 280px;
	}
	
	#paging p{
		display:inline-block;
		vertical-algin:top;
		border:1px solid #ccc;
		margin:0 auto;
		width: 36px;
    	height: 36px;
    	line-height: 3;
	}
	
	#paging p a{
		list-style:none;
		color:black;
		text-decoration:none;
		width:10px;
	}
	
	#paging ul{
		display:inline-block;
		margin:0 -4px 0 -5px;
		vertical-align:top;
		line-height:0;
		padding-left:0px;
	}
	
	#paging li:first-child{
		margin:0;
	}
	
	#paging li{
		display:inline-block;
		margin: 0 0 0 -4px;
		font-size:12px;
		color:black;
		vertical-align:top;
		border:1px solid #ccc;
		line-height:36px;
		height:37px;
		list-style:none;
	}
	
	#paging li a{
		display:block;
		width:33px;
		font-weight:bold;
		color:black;
		line-height:36px;
		list-style:none;
		text-decoration:none;
	}
	
	#search-key{
		font-size:100%;
		color:black;
		vertical-align:middle;
		background-size: 32px 27px;
		min-height:26px;
		min-width:80px;
		border: 1px solid #ccc;
		padding-left:5px;
	}
	
	.FAQ{
		text-align:center;
		font-size:15px;
		letter-spacing:0.2px;
		margin-bottom:40px;
	}
	
	.FAQ a{
		text-decoration:none;
	}
</style>
</head>
<body>
	<%
	ArrayList<BoardDTO> list=null;
	
	list=(ArrayList<BoardDTO>)request.getAttribute("list");
	int pageno=Integer.parseInt(request.getParameter("page"));
	int boardcount=(int)(request.getAttribute("boardcount"));
	
	int pagecount=-1;
	
	if(boardcount%20==0){
		pagecount=boardcount/20;
	} else{
		pagecount=boardcount/20+1;
	}
	
	int startpage=((pageno-1)/10)*10+1;
	int endpage=startpage+9;
	%>
	

<div id="container">
	<div id="header">
	
	</div>
	
	<div id="content">
		<div id="content-wrap">
			<div id="parag">
				<div class="path">
					<ul>
						<li style="color:black;">Q & A	<li>
					</ul>
				</div>
			</div>
			<div class="FAQ">
				<span><a href="FAQPage.jsp">FAQ</a></span>
			</div>
			
			<div class="qa_contents">
				<div class="qa_tit">
					안내 및 유의사항
				</div>
				<div class="qa_txt">
					* 주문 이 후 배송전/후 상품 추가 및 타상품 교환은 불가합니다.<br/>
					* 상품 추가,변경(교환)을 원하신다면 취소/반품후 신규 주문 부탁드립니다.<br/>
					* 부분취소 불가 결제건(휴대폰/기프트카드결제) 이용 결제수단은 전체취소후 신규 주문 부탁드립니다.<br/>
					* 결제 취소시에는 결제하신 수단으로만 취소 가능하며, 개인결제 이용 결제방식은 불가능합니다.<br/>
					* 최초 카드결제 이후 할부 개월수 변경/ 결제카드 변경/ 결제수단 변경은 불가합니다.<br/>
					* 취소된 금액을 타 주문건에 금액대체는 불가합니다.<br/><br/>
					* 기본배송기간 : 5일~10일<br/>
					* 이벤트(세일)기간 내 주문의 경우에는 기본배송일 이상 소요되며, 이벤트 종료 이후 순차 배송됩니다.<br/>
					* 결제완료 순으로 배송되며, 한정수량 세일로 결제가 늦어질 경우 조기품절이 될 수 있습니다.<br/>	
				</div>
			</div>
			<div class="boardList" style="margin-top: 35px;">
				<table border="1">
					<thead>
						<tr>
							<th scope="col">No</th>
							<th style="width:500px;" scope="col">Subject</th>
							<th scope="col">Writer</th>
							<th scope="col">Date</th>
							<th scope="col">Read</th>
					</thead>
					<tbody>
					<%
						for(BoardDTO bdto: list){
							int level = bdto.getLevel();
							int ref=bdto.getRef();
					%>
						<tr>
							<td><%=bdto.getQbno()%></td>
							<%
								if(bdto.getQtitle().equals("원글이 삭제되었습니다")){
							%>
									
							<td colspan='4' style="color: #ccc; text-align:left;padding:10px 0 10px 80px;"><%=bdto.getQtitle()%></td>
							<%		
								continue;
								} else{
							%>
							<td style="text-align:left;padding:10px 0 10px 80px;">
							<a href="Controller?command=showcontent&qbno=<%=bdto.getQbno()%>&level=<%=level%>&ref=<%=ref%>">
							<%
								}
							%>
					<%
							for(int i=1; i<=level; i++) {
								out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
							}
							if(level>0) {
								%>
								<i style="color:#ccc;" class="fas fa-level-up-alt fa-rotate-90"></i>&nbsp;
								<%
							}
					%>			<%=bdto.getQtitle()%></a></td>
							<td><%=bdto.getID()%></td>
							<td><%=bdto.getQwritedate().substring(0,10)%></td>
							<td><%=bdto.getQhitcount()%></td>
						</tr>
					<%
		
						}
					%>
					</tbody>
				</table>
			</div>
			
			<form id="boardsearchform" action="Controller?command=searchboard&page=1" method="post">
				<div class="board-search">
					<fieldset>
						<p>
							<select id="search-key" name="search-key">
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="writer">글쓴이</option>
							</select>
							<input id="search" name="search" type="text">
							<input id="search-btn" type="submit" value="검색">
						</p>
					</fieldset>
				</div>
			</form>
			
			<div id="paging">
				<ul>
					<li <%if(pageno==1) {%>style="display:none"<%}%>><a href="Controller?command=showboard&page=1">&lt&lt</a></li>
					<li <%if(pageno==1) {%>style="display:none"<%}%>><a href="Controller?command=showboard&page=<%=pageno-1%>">&lt</a></li>
				
				<%
					if(pagecount<endpage) {
						endpage=pagecount;
					}
					for(int i=startpage;i<=endpage;i++){
						if(pageno==i){
						%>
						<li><a style="background:#efd6c0" href="Controller?command=showboard&page=<%=i%>"><%=i%></a></li>
						<%
						} else{
						%>
						<li><a href="Controller?command=showboard&page=<%=i%>"><%=i%></a></li>
						<%	
						}
					}
				%>
					<li <%if(pageno==pagecount) {%>style="display:none"<%}%>><a href="Controller?command=showboard&page=<%=pageno+1%>">&gt</a></li>
					<li <%if(pageno==pagecount) {%>style="display:none"<%}%>><a href="Controller?command=showboard&page=<%=pagecount%>">&gt&gt</a></li>
					
				</ul>
			</div>
		</div>
	</div>


</div>
<%@ include file="MainFooter.jsp" %>
</body>
</html>