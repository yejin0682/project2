package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.QnABoardDAO;

public class UpdateBoardAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qbno=request.getParameter("qbno");
		String qtitle=request.getParameter("qtitle");
		String qcontent=request.getParameter("qcontent");
		
		QnABoardDAO dao=QnABoardDAO.getinstance();
		dao.updateboard(qbno, qtitle, qcontent);
		
		String url="Controller?command=showcontent&qbno="+qbno;
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
