package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.MemberDAO;
import com.yg.dto.MemberDTO;

public class MemberJoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ID= request.getParameter("member_id");
		String PW= request.getParameter("member_pw");
		String name=request.getParameter("member_name");
		String phone=request.getParameter("member_phonenum1")+request.getParameter("member_phonenum2")+request.getParameter("member_phonenum3");
		String address=request.getParameter("member_address");
		String email=request.getParameter("member_email");
		
		MemberDAO mdao=MemberDAO.getinstance();
		MemberDTO memberdto= new MemberDTO(ID, PW, name, phone, address, email);
		
		mdao.insertMemberJoin(memberdto);
		
		String url="LoginPage.jsp";
		request.getRequestDispatcher(url).forward(request, response);		
	}

}
