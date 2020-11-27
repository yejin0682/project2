package actionpackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.QnABoardDAO;
import com.yg.dto.BoardDTO;

public class ShowBoardAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<BoardDTO> list =null;
		QnABoardDAO bdao= QnABoardDAO.getinstance();
		int page=Integer.parseInt(request.getParameter("page"));
		
		HttpSession session=request.getSession();
		String ID=(String)session.getAttribute("ID");
		int countboard=bdao.countboard();
		
		if(page==0) {
			page=1;
		}
		
		try {
			list =bdao.showboard(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url="";
		request.setAttribute("list", list);
		request.setAttribute("boardcount", countboard);
		
		if(ID!=null) {
			url="viewboard_loginver.jsp?page="+page;
		} else {
			url="viewboard.jsp?page="+page;
		}
		request.getRequestDispatcher(url).forward(request, response);	
	}

}
