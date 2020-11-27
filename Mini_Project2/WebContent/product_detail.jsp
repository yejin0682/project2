<%@page import="com.yg.dto.ProductDTO"%>
<%@page import="com.yg.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="MainHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_detail</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script><!-- 화살표 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs="
	crossorigin="anonymous"></script>		<!-- jquery.cdn -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- qty -->
<style>
	body {
	    text-align: center;
	}
	#content {
	    width: min-content;
        height: fit-content;
        margin: 0 auto;
	    margin-top: 50px;
	    display: flex;
        -webkit-box-pack: justify;
		flex-direction: row;
		text-align: center;
	    padding-bottom: 100px;
	    border-bottom: 1px solid lightgray;
	}
	#leftLabel {
		float: left;
	    font-size: 15px;
	    word-spacing: 4px;
	    margin-bottom: 10px;
	}
	#leftLabel label{
		cursor: pointer;
	}
	#leftLabel svg {
	    color: darkgray;
	}
	#leftLabel a {
		color: black;
		text-decoration: none;
	}
	#leftSight {
	    width: min-content;
	    height: min-content;
	}
	#image {
	    width: 600px;
	}
	<!---->
	#rightSight {
        height: fit-content;
	    padding-left: 66px;
	    margin-top: 28px;
	}
	#rightSight label {
	    float: left;
	}
	#inform {
	    font-size: 13px;
	    line-height: 22px;
	    margin-top: 30px;
        margin-bottom: 30px;
	    color: gray;
	    text-align: justify;
	}
	#labels{
	    width: fit-content;
        display: inline-block;
        float: left;
        text-align: left;
	}
	#labelNames label {
        margin-bottom: 19px;
	    margin-right: 40px;
    	font-size: 13px;
	}
	
	#labelValues label {
	    margin-right: 40px;
        margin-bottom: 18px;
    	font-size: 13px;
	}
	#labelValues select {
		margin-bottom: 15px;
	    width: 100px;
	}
	#labelValues span {
	    height: 26px;
	    width: 100px;
	}
	#labels div {
	    display: inline-grid;
	}
	<!-- -->
	#productInfo {
	    width: fit-content;
	    line-height: 25px;
	    word-spacing: 2px;
	    letter-spacing: 0px;
	    font-size: 13px;
        display: block;
        color: dimgray;
        word-break: break-all;
        word-wrap: break-word;
	}
	#sizeInfo {
        color: dimgray;
	    line-height: 25px;
	    word-spacing: 2px;
	    letter-spacing: 0px;
	    font-size: 13px;
	}
	#info{
        overflow: auto;
	    width: 386px;
        position: relative;
	    margin: 0 auto;
	    padding-bottom: 44px;
        border-bottom: 1px solid lightgray;
	}
	#info2 {
	    display: none;
        overflow: auto;
	    width: 386px;
        position: relative;
	    margin: 0 auto;
	    padding-bottom: 44px;
        border-bottom: 1px solid lightgray;
	}
	#show {
		position: relative;
	    margin-top: 320px;
	}
	#show p {
		float: left; 
		font-size: 15px;
	    margin-bottom: 20px;
        margin-right: 40px;
	}
	#pi{
		text-decoration: underline;
	}	
	#pi:hover, #si:hover {
		cursor: pointer;
		text-decoration: underline;
	}
	
	#btns a {
	    width: 33.3%;
	    height: 42px;
	    text-align: center;
	    float: left;
	}
	.first_l{
		height: 42px;
	    line-height: 40px;
	    font-size: 11px!important;
	    font-weight: bold;
	    text-align: center;
	    width: 100%;
	    border: 1px solid #101010;
	    width: 95%;
	    color: #fff;
	    background-color: #d99f9d;
	}
	
	.second_l, .third_l {
		height: 42px;
	    line-height: 40px;
	    color: #000;
	    font-size: 15px!important;
	    font-weight: bold;
	    width: 95%;
	    border: 1px solid #000;
	    font-size: 11px !important;
	}
	.second_l:hover, .third_l:hover {
	    color: #fff;
	    background-color: #d99f9d;
	}
	#qty, #total {
		border: 0; 
	    text-align: right;
	}
	#total {
	    width: 60px;
	}
	#qty {
	    width: 15px;
	}
	#btns {
	    display: flex;
	    margin-top: 83px !important;
	}
	#btns label {
		cursor: pointer;
	}
	/*-- add table  --*/
	tr {
	    color: gray;
    	font-size: 13px;
	}
	td {
	    border-bottom: 1px solid lightgray;
	    width: 381px;
	}
	td span {
		height: fit-content;
	    font-size: 13px;
	}
	td svg {
		padding-left: 5px;
	}
	input:focus {
	    outline: none; 
	}
	table input {
		font-size: 13px;
		width: 25px;
	}
	#leftDiv {
	    float: left;
        text-align: left;
        padding-left: 8px;
	}
	#rightDiv {
		float: right;
	    display: grid;
        text-align: right;
        padding-right: 8px;
	}
	/*-- 네이버 페이-- */
	#naverpay {
		margin-top: 40px;
	    border-top: 2px solid;
	    width: inherit;
	}
	#left {
	    width: fit-content;
	    text-align: left;
	    display: grid;
	    font-family: system-ui;
	    letter-spacing: -1px;
	}
	#left img {
	    width: 65px;
	}
	#left label {
		font-size: 11px;
		font-weight: bold;
	}
	#right {
	    width: fit-content;
	    color: #1fc003;
		font-size: 14px;
		font-family: system-ui;
	}
	#right img {
	    width: 20px;
	}
	#npay {
	    padding: 11px 65px;
        margin-right: 5px;
	    width: max-content;
        border: 1px solid lightgray;
        background-color: #fcfcfc;	
	}
	#zzim {
	    background-color: #fcfcfc;
	    border: 1px solid lightgray;
		padding: 14px 18px;
	    width: max-content;
	}
	#top {
	    display: flex;
        justify-content: space-between;
        padding: 10px 5px;
	}
	#ani {
		width: -webkit-fill-available;
		font-size: 13px;
	    float: left;
	    padding: 5px;
	    border-top: 1px solid lightgray;
	}
	#ani label {
	    color: #1fc003;
	    margin-right: 5px;
	}
	#ani a {
	    float: left;
	}
	#nbank {
		display: none;
	}
	#arrows {
		float: right;
	}
	#arrows svg {
		padding: 3px 5px;
	    border: 1px solid lightgray;
	    color: gray;
        width: auto;
	}
	
	#npay:hover, #zzim:hover, #ani a:hover, svg:hover {
		cursor: pointer;
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
<script>
	function piClick() {
	  	$("#info2").hide( "fade", "fast" );
	  	$("#si").css( "text-decoration", "none" );
	  	$("#info").show( "fade", "fast" );
	  	$("#pi").css( "text-decoration", "underline" );
	}
	
	function siClick() {
	  	$("#info").hide( "fade", "fast" );
	  	$("#pi").css( "text-decoration", "none" );
	  	$("#info2").show( "fade", "fast" );
	  	$("#si").css( "text-decoration", "underline" );
	}

	//컬러.사이즈.수량
	$( "#color" ).selectmenu();
	$( "#size" ).selectmenu();

</script>
</head>
<body>
<div id="content">
	<div id="leftSight">
		<div id="leftLabel">
			<label>HOME</label>
			<i class="fas fa-angle-right"></i>
			<label>Stylenanda</label>
			<i class="fas fa-angle-right"></i>
			<a href="Controller?command=nanda_made_Page"><b>Nanda made</b></a>
		</div>
		<img id="image" src="${dto.getImage() }"/>
	</div>

	<div id="rightSight">
		<label><b>${dto.getPname() }</b></label><br/>
		<label id="inform">${dto.getInform() }</label><br/>
		<div id="labels">
			<div id="labelNames">
				<label>Price</label>
				<label>Code</label>
				<label>Point</label>
				<label>Color</label>
				<label>Size</label>
			</div>
			<div id="labelValues">
				<label>${price}원</label>
				<label>${dto.getPno() }</label>
				<label>${point }원(1%)</label>
				<select name="color" id="color">
				      <option disabled selected="selected">color</option>
		 <%
		 	String[] color = (String[])request.getAttribute("color");
			for(int i=0; i<color.length; i++){	%>
				      <option><%= color[i]%></option>
		 <%	} %>
			    </select>
				
				<select name="size" id="size" onchange="append()">
				      <option disabled selected="selected">size</option>
		 <%
		 	String[] size = (String[])request.getAttribute("size");
			for(int i=0; i<size.length; i++){	%>
				      <option><%= size[i]%></option>
		 <%	} %>
			    </select>
			</div>
		</div>
		<br/><br/>
		<div id="show">
		<p>
			<a id="pi" style="margin-right: 20px" onclick="piClick()"><b>Product info</b></a>
			<a id="si" onclick="siClick()"><b>Size info</b></a>
		</p>
			<div id="info">
				<label id="productInfo">${dto.getProductInfo() }</label>
			</div>
			<div id="info2">
				<label id="sizeInfo">${dto.getSizeInfo() }</label>
			</div>
		</div>
		<table>
			<tbody></tbody>
		</table>
		<label style="padding-top: 30px; font-size: 15px;"><b>TOTAL</b> (QUANTITY) : <b><input type="text" id="total" value="0" readonly="readonly" style="font-weight: bold"/>원</b> <a>(<input type="text" id="qty" value="0" readonly="readonly" style="font-weight: bold"/>개)</a></label>
		
		<div id="btns" style="margin-top: 85px;">
		<a>
			<label class="first_l" onclick="gotoBasket()">장바구니</label>
		</a>	
		<a>
			<label class="second_l" onclick="likey()">관심상품</label>
		</a>	
		<a>
			<label class="third_l" onclick="buying()">구매하기</label>
		</a>	
		</div>
		
		
		<div id="naverpay">
			<div id="top">
				<div id="left">
					<img src="https://platum.kr/wp-content/uploads/2016/01/naver2.png"/>
					<label>네이버 ID로 간편구매</label>
					<label>네이버페이</label>
				</div>
				<div id="right">
					<label id="npay" onclick="window.open('https://nid.naver.com/nidlogin.login?svctype=1&url=https%3A%2F%2Forder.pay.naver.com%2Fcustomer%2Forder.nhn%3FORDER_ID%3D724201866%26SHOP_ID%3Dstylenanda%26TOTAL_PRICE%3D40800')">
						<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT0lGu19gW3N8JoeLIPkTjQKjmXoLMRZ403Fw&usqp=CAU"/>
						<b>Pay 구매</b>
					</label>
					<label id="zzim" onclick="window.open('https://pay.naver.com/customer/wishlistPopup.nhn?SHOP_ID=stylenanda&ITEM_ID=1206918903','상품 찜하기','width=430,height=500,location=no,status=no,scrollbars=yes');"><b>찜</b></label>
				</div>
			</div>
			<div id="ani">
				<div id="membership">
					<label>멤버십</label>
					<a onclick="window.open('https://nid.naver.com/membership/join')">첫달 무료가입하고 추가 4%!</a>
				</div>
				<div id="nbank">
					<label>네이버통장</label>
					<a>지금 바로 만들어보세요!</a>
				</div>
				<div id="arrows">
					<i class="fas fa-chevron-left"></i>
					<i class="fas fa-chevron-right"></i>
				</div>
			</div>
		</div>
	
	</div>
</div>


	<a href="Controller?command=review_board&pno=<%=request.getAttribute("pno")%>&page=1">후기</a> <!-- 주문조회.  -->
	
	<%@ include file="MainFooter.jsp"%>
	
</body>

<script>
   var code = ${dto.getPno() };
   var color="";
   var size="";
    var colorE = 0;
    var sizeE = 0;
    
   function append(){   //행 추가
         color = $("#color").val();
         size = $("#size").val();
          var trCnt = $('table tr').length;
          if( (trCnt < 5) && !(color==colorE && size==sizeE) ){
             var str = "";
             str += '<tr><td><div id="leftDiv">${dto.getPname() }<br/>-<b>'+color+'/'+size+'</b></div></td>';
             str += '<td style="width: fit-content; display: flex; padding: 13px; align-items: center;"><input class="spinner" id="btnQty" value="1" onfocus="this.blur()"/>';
             str += '<label id="deleteRow"><i class="fas fa-times-circle"></i></label></td>';
             str += '<td style="width: 100px;"><div id="rightDiv"><label><b>${price}원</b></label><label><b>(p.${point }원)</b></label></div></td></tr>';
   
             $('table > tbody:last').append(str);
            $( ".spinner" ).spinner({
                  min:0,
                  max:100,
               });
            $("#size").val("size").prop("selected", true);
            colorE = color;
            sizeE = size;
   
             priceUp();
             addToBasket(code, color, size);
         }
      }
<!--  딥V스트라이프 트임맨투맨T-아이보리/FREE  39,000원(p.300원)3-->
    $(function() {
      $(document).on("click", "#deleteRow", function(e) {  //행 삭제
         var str = $(this).parent().parent().text();      //tr
         var name = str.split('-')[1];      //아이보리/FREE  39,000원(p.300원)
         var color2 = name.split('/')[0];
         var size = name.split('/')[1];      //FREE  39,000원(p.300원)
         var size2 = size.split(' ')[0];
         var thisQty = $(this).prev().children().val();   //#btnQty 값.
         $(this).parent().parent().remove();
         priceDown(thisQty);
         removeToBasket(color2, size2, thisQty);
      });

      $(document).on("click", ".ui-spinner-up", function(e) {  //버튼-수량 up
         priceUp();
         var str = $(this).parent().parent().parent().text()      //tr
         var name = str.split('-')[1];
         var color2 = name.split('/')[0];
         var size = name.split('/')[1];
         var size2 = size.split(' ')[0];
         addToBasket(code, color2, size2);
      });
      
      $(document).on("click", ".ui-spinner-down", function(e) {  //버튼-수량 down
         var str = $(this).parent().parent().parent().text()
         var name = str.split('-')[1];
         var color2 = name.split('/')[0];
         var size = name.split('/')[1];
         var size2 = size.split(' ')[0];
         var btnQty = $(this).siblings().val();
         if(btnQty>0){
            priceDown(1);
            removeToBasket(color2, size2, 1);
         }
         else{
            for(var i=0; i<1; i++){
               priceDown(1);
               removeToBasket(color2, size2, 1);
            }
            if(btnQty==0){
               $(this).parent().parent().parent().remove();
               }
            var i = $("#qty").val();
            if(i==0){
               $("#total").val("0");
               return;
            }
         }
      });
   });

    
   function priceUp() {
         var j = $("#total").val();
         var i = $("#qty").val();
         var price = '${price}';
         var total = document.getElementById("total").value; 
         total = (parseInt(j) + parseInt(price.replace(",","")) /1000);
         total = String(total) + ",000";
         document.getElementById("total").value = total;
         document.getElementById("qty").value = parseInt(i)+1;
      }

   function priceDown(cnt) {
         var j = $("#total").val();
         var i = $("#qty").val();
         var price = '${price}';
         var total = document.getElementById("total").value; 
         total = (parseInt(j) - parseInt(price.replace(",",""))*cnt /1000);
         total = String(total) + ",000";
         document.getElementById("total").value = total;
         document.getElementById("qty").value = parseInt(i) - cnt;
      }

   
   var basket = "";
   function addToBasket(code, color, size) {
      if(basket=="") {
         basket = code +"_"+ color +"_"+ size +"_1";   
         return;
      }
      var basketList = basket.split('___');      //idx: 0번으로.
      var arrBasketCode = new Array(basketList.length);
      var arrBasketColor = new Array(basketList.length);
      var arrBasketSize = new Array(basketList.length);
      var arrBasketQuantity = new Array(basketList.length);
      
      var flag = false;  // 이미 있었던 : true, 새롭게 추가 : false;
      
      for(var i=0; i<=basketList.length-1; i++) {   
         arrBasketCode[i] = Number(basketList[i].split('_')[0]);
         arrBasketColor[i] = basketList[i].split('_')[1];
         arrBasketSize[i] = basketList[i].split('_')[2];
         arrBasketQuantity[i] = Number(basketList[i].split('_')[3]);

         if(arrBasketColor[i]==color && arrBasketSize[i]==size) {   //중복
            arrBasketQuantity[i]++;
            flag = true;
         }
      }
      basket = "";      //왜초기화?? --이름 한번만.
      for(var i=0; i<=basketList.length-1; i++) {
         if(i > 0)
            basket += "___";
         basket += arrBasketCode[i] +"_"+ arrBasketColor[i] +"_"+ arrBasketSize[i] +"_"+ arrBasketQuantity[i]; 
      }

      if(flag==false) {   //다른 상품.
         if(basketList.length > 0)      //list.length: 1!
            basket += "___";
         basket += code +"_"+ color +"_"+ size +"_1";   
      }
   }
   
<!--   15_민트_FREE_1___15_멜란지그레이_FREE_4___15_화이트_FREE_1   -->
   function removeToBasket(color2, size2, qty2) {
      var basketList = basket.split('___');      
      var arrBasketCode = new Array(basketList.length);
      var arrBasketColor = new Array(basketList.length);
      var arrBasketSize = new Array(basketList.length);
      var arrBasketQuantity = new Array(basketList.length);
      
      for(var i=0; i<=basketList.length-1; i++) {   
         arrBasketCode[i] = Number(basketList[i].split('_')[0]);
         arrBasketColor[i] = basketList[i].split('_')[1];
         arrBasketSize[i] = basketList[i].split('_')[2];
         arrBasketQuantity[i] = Number(basketList[i].split('_')[3]);

         if(arrBasketColor[i]==color2 && arrBasketSize[i]==size2) {   
            arrBasketQuantity[i] -= qty2;
            if(arrBasketQuantity[i]==0) {   
               basket -= "___";      
               arrBasketCode[i]="";
               arrBasketColor[i]="";
               arrBasketSize[i]="";
               arrBasketQuantity[i]="";
            }
         }
      }

      basket = "";      
      for(var i=0; i<=basketList.length-1; i++) {
         if(arrBasketCode[i]=="") 
            continue;
         if(i > 0 && basketList.length > 0){
            basket += "___";
         }
         basket += arrBasketCode[i] +"_"+ arrBasketColor[i] +"_"+ arrBasketSize[i] +"_"+ arrBasketQuantity[i]; 
         
      }
   }


   function gotoBasket() {
      location.href="Controller?command=loginCheck&goto=insertbasket&basket="+basket;
   };
   function likey() {
      alert("관심상품으로 등록되었습니다.");
   };
   function buying() {
      location.href="Controller?command=loginCheck&goto=directorder&basket="+basket;
   };
</script>
</html>