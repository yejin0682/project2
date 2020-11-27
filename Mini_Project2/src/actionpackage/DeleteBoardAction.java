package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.QnABoardDAO;

public class DeleteBoardAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qbno=Integer.parseInt(request.getParameter("qbno"));
		int level=Integer.parseInt(request.getParameter("level"));
		int ref=Integer.parseInt(request.getParameter("ref"));
		
		QnABoardDAO dao=QnABoardDAO.getinstance();
		
		int count=-1;
		count=dao.countrefboard(ref, level);  
		System.out.println(count);
		
		if(count>=1) {
			dao.deleteUpdatetitle(qbno);
		} else {
			dao.deleteboard(qbno);
		}
		
		String url="Controller?command=showboard&page=1";
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
