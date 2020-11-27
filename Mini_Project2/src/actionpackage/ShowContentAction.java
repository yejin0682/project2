package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.QnABoardDAO;
import com.yg.dto.BoardDTO;

public class ShowContentAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String qbno=request.getParameter("qbno");
		int level=Integer.parseInt(request.getParameter("level"));
		int ref=Integer.parseInt(request.getParameter("ref"));
		
		QnABoardDAO qdao=QnABoardDAO.getinstance();
		BoardDTO bdto=new BoardDTO();
		
		HttpSession session=request.getSession();
		String ID=(String)session.getAttribute("ID");
		
		bdto=qdao.showcontent(qbno);
		qdao.uphitcount(qbno);
		
		String url="";
		String update=request.getParameter("update");
		if(bdto.getID().equals(ID)) {
			url="viewcontent_loginver.jsp";
			if("yes".equals(update)) {
				url="updateboardPage.jsp";
			}
		} else {
			url="viewcontent.jsp";
		}
		
		request.setAttribute("ref", ref);
		request.setAttribute("level", level);
		request.setAttribute("bdto", bdto);
		request.getRequestDispatcher(url).forward(request, response);	
		
	}

}
