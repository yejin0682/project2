package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

public class LoginCheckAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      String loginID = (String)(session.getAttribute("ID"));
      String param = request.getParameter("goto");
      System.out.println(param+"11");
      String basket = request.getParameter("basket");
      System.out.println(basket+"22");
      String encodedString="";
      if(basket!=null) {
    	  encodedString = URLEncoder.encode(basket, "UTF-8");  
      }
      
      if(loginID != null){
         if(param.equals("insertbasket")) {
        	 System.out.println("11");
            response.sendRedirect("Controller?command="+param+"&basket="+encodedString);}   //장바구니
         else if(param.equals("directorder"))
            response.sendRedirect("Controller?command="+param+"&basket="+encodedString);   //결제
         else if(param.equals("write_Re_review"))
            response.sendRedirect("Controller?command="+param);      //리뷰 답글
         else if(param.equals("mypage"))
        	response.sendRedirect("MyPage.jsp");
              
         } else{
            response.sendRedirect("LoginPage.jsp");  //로그인 
         }
         
      
   }

}