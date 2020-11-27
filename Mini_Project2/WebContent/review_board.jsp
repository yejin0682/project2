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
</style>
</head>
<body>
	<%
	ArrayList<ReviewDTO> list=null;
	
	list=(ArrayList<ReviewDTO>)request.getAttribute("list");
	int pageno=Integer.parseInt(request.getParameter("page"));
	int boardcount=(int)request.getAttribute("count");//수정
	int pno=(int)request.getAttribute("pno");
	
	int pagecount=-1;
	
	if(boardcount%10==0){
		pagecount=boardcount/10;
	} else{
		pagecount=boardcount/10+1;
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
						<li style="color:black;">Review<li>
					</ul>
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
						for(ReviewDTO dto : list){
							int level = dto.getLevel();
					%>
						<tr>
							<td><%=dto.getRbno()%></td>
							<%
								if(dto.getRtitle().equals("원글이 삭제되었습니다")){
							%>
									
							<td colspan='4' style="color: #ccc; text-align:left;padding:10px 0 10px 80px;"><%=dto.getRtitle()%></td>
							<%		
								continue;
								} else{
							%>
							<td style="text-align:left;padding:10px 0 10px 80px;">
							<a href="Controller?command=show_review&rbno=<%= dto.getRbno()%>&pno=<%=pno%>">
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
					%>			<%=dto.getRtitle()%></a></td>
							<td><%=dto.getID()%></td>
							<td><%=dto.getRwritedate().substring(0,10)%></td>
							<td><%=dto.getRhitcount()%></td>
						</tr>
					<%
		
						}
					%>
					</tbody>
				</table>
			</div>
			
			<div id="paging">
				<ul>
					<li <%if(pageno==1) {%>style="display:none"<%}%>><a href="Controller?command=review_board&pno=<%=pno%>&page=1">&lt&lt</a></li>
					<li <%if(pageno==1) {%>style="display:none"<%}%>><a href="Controller?command=review_board&pno=<%=pno%>&page=<%=pageno-1%>">&lt</a></li>
				
				<%
					if(pagecount<endpage) {
						endpage=pagecount;
					}
					for(int i=startpage;i<=endpage;i++){
						if(pageno==i){
						%>
						<li><a style="background:#efd6c0" href="Controller?command=review_board&pno=<%=pno%>&page=<%=i%>"><%=i%></a></li>
						<%
						} else{
						%>
						<li><a href="Controller?command=review_board&pno=<%=pno%>&page=<%=i%>"><%=i%></a></li>
						<%	
						}
					}
				%>
					<li <%if(pageno==pagecount) {%>style="display:none"<%}%>><a href="Controller?command=review_board&pno=<%=pno%>&page=<%=pageno+1%>">&gt</a></li>
					<li <%if(pageno==pagecount) {%>style="display:none"<%}%>><a href="Controller?command=review_board&pno=<%=pno%>&page=<%=pagecount%>">&gt&gt</a></li>
					
				</ul>
			</div>
		</div>
	</div>


</div>
<%@ include file="MainFooter.jsp" %>
</body>
</html>