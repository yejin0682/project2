package actionpackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.MemberDAO;

public class MemberLoginAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ID=request.getParameter("member_id");
		String PW=request.getParameter("member_pw");
		
		MemberDAO mdao= MemberDAO.getinstance();
		
		boolean check=false;
		check =mdao.selectLogin(ID, PW);
		
		if(ID.equals("admin") && PW.equals("admin")) {
			String url="AdminMainPage.jsp";
			request.getRequestDispatcher(url).forward(request, response);	
		}
		
		if(check==true) {
			HttpSession session=request.getSession();
			session.setAttribute("ID", ID);
			session.setAttribute("PW", PW);
			String url="MainPage.jsp";
			request.getRequestDispatcher(url).forward(request, response);	
			
		} else {
			  response.setContentType("text/html;charset=utf-8");
			  PrintWriter out=response.getWriter(); 
			  out.println("<script>alert('아이디/비밀번호가 일치하지 않습니다');history.go(-1);</script>"); 
			  out.flush(); 
			  out.close();
		}
	}

}
