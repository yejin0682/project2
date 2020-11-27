package actionpackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.QnABoardDAO;
import com.yg.dao.MemberDAO;
import com.yg.dto.MemberDTO;

public class FindMemberPWAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("check_method");
		
		String ID=request.getParameter("id"); 
		String name=request.getParameter("name");
		String email="";
		String phone="";
		
		MemberDAO mdao =MemberDAO.getinstance();
		String PW="";
		
		if("emailchk".equals(method)) {
			email=request.getParameter("email");
			PW=mdao.findmemberpw_email(ID, name, email);
		} else {
			phone=request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
			PW=mdao.findmemberpw_phone(ID, name, phone);
		}
		
		String url="";
		if(PW.equals("")) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('입력하신 정보로 가입 된 회원 비밀번호는 존재하지 않습니다.'); location.href='FindPassWord.jsp';</script>");
		} else {
			url="FoundPW.jsp?PW="+PW;
			request.getRequestDispatcher(url).forward(request, response);
		}

	}

}
