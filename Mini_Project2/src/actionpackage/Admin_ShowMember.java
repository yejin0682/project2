package actionpackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.MemberDAO;
import com.yg.dto.MemberDTO;

public class Admin_ShowMember implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO mdao =MemberDAO.getinstance();
		ArrayList<MemberDTO> list=new ArrayList<MemberDTO>();
		list=mdao.showmember();
		
		request.setAttribute("memberlist", list);
		String sql="Admin_ShowMemberPage.jsp";
		request.getRequestDispatcher(sql).forward(request, response);
		
	}

}
