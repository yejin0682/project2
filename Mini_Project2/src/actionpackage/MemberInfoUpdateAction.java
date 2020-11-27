package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.MemberDAO;
import com.yg.dto.MemberDTO;

public class MemberInfoUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		String ID=(String)session.getAttribute("ID");
		String PW=request.getParameter("member_pw");
		String address=request.getParameter("member_address");
		String name=request.getParameter("member_name");
		String phone=request.getParameter("member_phonenum1")+request.getParameter("member_phonenum2")+request.getParameter("member_phonenum3");
		String email=request.getParameter("member_email");
		
		MemberDAO mdao =MemberDAO.getinstance();
		MemberDTO mdto =new MemberDTO();
		mdto=mdao.memberinfoupdate(ID, PW,name,address,phone,email);
		
		request.setAttribute("inforesult", mdto);
		
		String url="MemberInfoResultPage.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
