package actionpackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.QnABoardDAO;
import com.yg.dao.MemberDAO;

public class MemberDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String ID=(String)session.getAttribute("ID");
		
		MemberDAO mdao= MemberDAO.getinstance();
		mdao.deleteMember(ID);
		
		session.removeAttribute("ID");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('회원탈퇴가 완료되었습니다'); location.href='MainPage.jsp';</script>");
		
		
	}

}
