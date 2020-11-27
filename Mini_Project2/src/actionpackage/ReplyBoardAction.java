package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.QnABoardDAO;

public class ReplyBoardAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		String qtitle=request.getParameter("qtitle");
		String qcontent=request.getParameter("qcontent");
		String ID=(String) session.getAttribute("ID");
		int ref=Integer.parseInt(request.getParameter("ref"));
		
		QnABoardDAO dao= QnABoardDAO.getinstance();
		dao.replyboard(ID, ref, qtitle, qcontent);
		
		String url="Controller?command=showboard&page=1";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
