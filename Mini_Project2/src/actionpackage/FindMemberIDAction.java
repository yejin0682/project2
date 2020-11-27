package actionpackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.MemberDAO;
import com.yg.dto.MemberDTO;

public class FindMemberIDAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("check_method");
		
		String name=request.getParameter("name");
		String email="";
		String phone="";
		
		MemberDTO dto = new MemberDTO();
		MemberDAO mdao =MemberDAO.getinstance();
		String ID="";
		
		if("emailchk".equals(method)) {
			email=request.getParameter("email");
			ID=mdao.findmemberid_email(name, email);
		} else {
			phone=request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
			ID=mdao.findmemberid_phone(name, phone);
		}
		
		String url="";
		if(ID.equals("")) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('입력하신 정보로 가입 된 회원 아이디는 존재하지 않습니다.'); location.href='FindID.jsp';</script>");
		} else {
			url="FoundID.jsp?ID="+ID;
			request.getRequestDispatcher(url).forward(request, response);
		}

	}

}
