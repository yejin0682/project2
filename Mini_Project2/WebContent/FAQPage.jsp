<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="MainHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
   $(document).ready(function() {
      $("#spreadBtn01").click(function() {
         if ($("#hiddenFAQ01").is(":visible")) {
            $("#hiddenFAQ01").slideUp();
         } else {
            $("#hiddenFAQ01").slideDown();
         }
      });
   });
   $(document).ready(function() {
      $("#spreadBtn02").click(function() {
         if ($("#hiddenFAQ02").is(":visible")) {
            $("#hiddenFAQ02").slideUp();
         } else {
            $("#hiddenFAQ02").slideDown();
         }
      });
   });
</script>
<style>
   #content {
      text-align:center;
      width:1000px;
      height:1000px;
      font-size:12px;
   }
   .btn {
      cursor:pointer;
      margin:10px;
      text-align:left;
   }
   li {
      display:inline-block;
   }
   .tab_faq {
      margin:10px;
      font-size:12px;
   }
   .tab_faq:hover {
      color:rgba(243,226,211,1);
      text-decoration:underline;
   }
   .faq-con {
      text-align:left;
      margin:20px;
   }
   .cate_top_txt > h1 {
      margin-top:70px;
      margin-bottom:10px;
   }
   hr {
      color:rgba(222,222,222,0.2);
   }
   #head_style {
      margin-bottom:30px;
   }
</style>
</head>
<body>
   <div id="content">
      <div id="cont-wrap">
         <div>
            <div id="head_style">
               <div class="cate_top_txt">
                  <h1>F A Q</h1>
                  <ul>
                     <li><a href="#">
                           <div class="tab_faq">회원가입</div>
                     </a></li>
                     <li class="line">|</li>
                     <li><a href="#">
                           <div class="tab_faq">주문관련</div>
                     </a></li>
                     <li class="line">|</li>
                     <li><a href="#">
                           <div class="tab_faq">결제관련</div>
                     </a></li>
                     <li class="line">|</li>
                     <li><a href="#">
                           <div class="tab_faq">배송관련</div>
                     </a></li>
                     <li class="line">|</li>
                     <li><a href="#">
                           <div class="tab_faq">취소/교환/반품</div>
                     </a></li>
                     <li class="line">|</li>
                     <li><a href="#">
                           <div class="tab_faq">오프라인관련</div>
                     </a></li>
                  </ul>
               </div>
            </div>
            <div id="faq-wrap">
               <div id="spreadBtn01" class="btn">회원가입 적립금은 바로 사용할 수 있나요?</div>
               <hr>
               <div id="hiddenFAQ01" class="faq-con" style="display:none;">
                  <p>
                     네~<br /> 회원가입시 가입 적립금 3,000원을 지급해드리며<br /> 구매시 바로 사용가능합니다.<br />
                     <br /> <br />
                  </p>
               </div>
               <div id="spreadBtn02" class="btn">회원가입 시 어떠한 혜택이 있나요?</div>
               <hr>
               <div id="hiddenFAQ02" class="faq-con" style="display:none;">
                  <p>
                     스타일난다의 <b>회원</b>이 되시면 다양한 혜택과 여러 이벤트에 참여하실 수 있습니다.<br /> 1.
                     회원가입시 바로사용할 수 있는 3,000원 신규적립금 지급<br /> <br /> 2. <b>구매금액에
                        대한 1% 적립금지급</b><br /> -1만원이상 상품에 대한 배송완료후 1% 적립금지급<br /> <br />
                     3. 착용후기 작성시 최대 30,000원 적립금 지급<br /> -매주 발표하는 베스트 포토후기 당첨시 최대
                     30,000원 적립금지급<br /> <br /> 4. 매월 회원등급별 혜택 제공<br /> -할인쿠폰,
                     무료배송쿠폰 등 다양한 할인혜택 및 추가 적립금 지급<br /> <br /> 5. <b>다양한 이벤트 안내
                        및 회원전용 게시판 이용</b><br /> -회원전용 Q&A게시판 이용 및 이벤트 안내를 받아보실 수 있는 혜택<br />
                     <br /> * 스타일난다 회원이 되시면 이 외 더 많은 혜택을 받으실 수 있습니다.
                  </p>
               </div>
            </div>
         </div>
      </div>
   </div>
   <%@ include file="MainFooter.jsp" %>    
</body>
</html>
