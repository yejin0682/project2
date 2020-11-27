package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.MemberDAO;
import com.yg.dto.MemberDTO;

public class MemberInfoSelectAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String ID=(String) session.getAttribute("ID");
		
		MemberDAO mdao=MemberDAO.getinstance();
		MemberDTO mdto=new MemberDTO();
		mdto =mdao.memberinfoselect(ID);

		request.setAttribute("memberinfo", mdto);

		String sql="MemberInfoUpdatePage.jsp";
		request.getRequestDispatcher(sql).forward(request, response);
		
	}

}
