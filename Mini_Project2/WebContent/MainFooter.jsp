<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   body {
       letter-spacing: -1px;
   }
   div {
       vertical-align:center;
    }
    html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre,
    code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
       margin: 0 auto;
    }
   #footer {
      text-align:center;
      font-size:11px;
      padding-top: 80px;
   }
   .footer-wrap p {
       color: #101010;
       line-height: 18px;
       word-wrap: break-word;
   }   
   .footer-wrap {
         margin-bottom: 50px;
   }
   .ft_menu {
        display: flex;
       padding: 0;
       width: 60%;
   }
   li {
       list-style:none;
    }
    .main_bt li img {
       width: 95%;
       float:right;
    }
    .main_bt {
          display: flex;
        padding: 0;
       width: 70%;
       margin: 0 auto;
       margin-bottom: 80px;
    }
    .ft_menu li {
       margin-right: 2%;
       text-align: left;
       vertical-align: top;
       width: 15%;
       max-width: 150px;
       font-size: 11px;
    }
    .footer_ico {
       margin: 4% 0;
       font-size: 0;
       line-height: 0;
   }
   .footer_ico li {
       padding: 0 12px;
       display: inline-block;
   }
   .footer_ico {
       padding: 0;
   }
   h1{
       font-size: 15px;
       padding-bottom: 20px;
   }
   p {
       display: block;
       margin-block-start: 1em;
       margin-block-end: 1em;
       margin-inline-start: 0px;
       margin-inline-end: 0px;
      }
      
   a{
   		list-style:none;
   		text-decoration:none;
   		color:black;
   }
</style>
</head>
<body>
   <div id="footer">
      <ul class="main_bt">
         <li><a href="리뷰 페이지"> <img src="https://stylenanda.com/design1/kr/main_bt01.jpg">
         </a></li>
         <li><a href="공지사항"> <img src="https://stylenanda.com/design1/kr/main_bt02.jpg">
         </a></li>
         <li><a href="Q&A"> <img src="https://stylenanda.com/design1/kr/main_bt03.jpg">
         </a></li>
      </ul>
      <div class="footer-wrap">
         <ul class="ft_menu">
            <li>
               <h1>CUSTOMER</h1>
               <p>0502 707 8888</p>
               <p>평일 09:30 - 18:00</p>
               <p>점심 12:00 - 13:00</p>
               <p>휴무 (토, 일, 공휴일)</p>
            </li>
            <li>
               <h1>DELIVERY</h1>
               <p>
                  <a href="#" onclick="배송조회 팝업">배송조회 >></a>
               </p>
               <p>반품주소</p>
               <p>인천광역시 계양구 계산동</p>
               <p>계양우체국 사서함 1117호</p>
               <p>반드시 우체국택배 이용</p>
            </li>
            <li>
               <h1>STORE</h1>
               <p>
                  <a href="플래그십">플래그십</a>
               </p>
               <p>
                  <a href="백화점">백화점</a>
               </p>
               <p>
                  <a href="면세점">면세점</a>
               </p>
               <p>
                  <a href="올리브영">올리브영</a>
               </p>
               <p>
                  <a href="아울렛">아울렛</a>
               </p>
               <p>
                  <a href="해외">해외</a>
               </p>
            </li>
            <li>
               <h1>HELP</h1>
               <p>
                  <a href="Controller?command=showboard&page=1">Q&A / FAQ</a>
               </p>
               <p>
                  <a href="쇼핑가이드">쇼핑가이드</a>
               </p>
               <p>
                  <a href="개인정보">개인정보처리방침</a>
               </p>
               <p>
                  <a href="이용약관">이용약관</a>
               </p>
               <p>
                  <a href="제휴문의">제휴문의</a>
               </p>
            </li>
            <li>
               <h1>NOTICE</h1>
               <p>
                  <a href="회사소개">회사소개</a>
               </p>
               <p>
                  <a href="해외배송">해외배송</a>
               </p>
               <p>
                  <a href="공지사항">공지사항</a>
               </p>
               <p>
                  <a href="이벤트">이벤트</a>
               </p>
            </li>
         </ul>
         <ul class="footer_ico">
            <li><a href="페이스북계정"> <img src="https://stylenanda.com/design1/kr/footer_ico01__.png">
            </a></li>
            <li><a href="인스타계정"> <img src="https://stylenanda.com/design1/kr/footer_ico02__.png">
            </a></li>
            <li><a href="블로그계정"> <img src="https://stylenanda.com/design1/kr/footer_ico03__.png">
            </a></li>
            <li><a href="유튜브계정"> <img src="https://stylenanda.com/design1/kr/footer_ico04__.png">
            </a></li>
            <li><a href="카카오톡계정"> <img src="https://stylenanda.com/design1/kr/footer_ico05__.png">
            </a></li>
            <li><a href="카카오스토리계정"> <img src="https://stylenanda.com/design1/kr/footer_ico06__.png">
            </a></li>
         </ul>
         <p>
            대표이사. 신지은 | 사업자등록번호. 130-86-24632 | 통신판매업신고. 2014-서울마포-0835 |
            개인정보보호책임자. 한관현 <a href="사업자정보확인">[사업자정보확인]</a>
         </p>
         <p>회사명. ㈜난다 | 전화. 0502-707-8888 | 팩스. 02-335-5274 | 이메일.
            nanda@stylenanda.co.kr | 주소. 서울특별시 마포구 잔다리로 32 서문빌딩 2~6F</p>
         <p style="margin-bottom: 20px;">
            ⓒ 2017 NANDA All rights reserved. | <a href="개인정보처리방침">개인정보처리방침</a>
            | <a href="운영관리방침">영상정보처리기기운영･관리방침</a> | <a href="이용약관">이용약관</a> |
            Hosting by cafe24
         </p>
         <p>
            고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 PG 사의 구매안전서비스를 이용하실 수 있습니다. <strong>토스페이먼츠
               에스크로</strong> <a href="서비스가입사실확인">(서비스가입사실확인)</a>
         </p>
      </div>
   </div>
</body>
</html>