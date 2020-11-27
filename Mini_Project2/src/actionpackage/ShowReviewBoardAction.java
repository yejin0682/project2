package actionpackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.ReviewDAO;
import com.yg.dto.ReviewDTO;


public class ShowReviewBoardAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page;
		int count=0;
		int pno = Integer.parseInt(request.getParameter("pno"));
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch(Exception e) { 
			page = 1;	
		}
		
		ReviewDAO rDao = ReviewDAO.getInstance();
		ArrayList<ReviewDTO> list = rDao.selectReviewBoard(page,pno);
		count=rDao.countreviewboard(pno);
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("pno", pno);
		
		String url = "review_board.jsp";
		request.getRequestDispatcher(url).forward(request, response);
		
		
	}

}
