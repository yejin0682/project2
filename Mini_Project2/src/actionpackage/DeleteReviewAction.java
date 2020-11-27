package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.ReviewDAO;


public class DeleteReviewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String rbno = request.getParameter("rbno");
		int pno=Integer.parseInt(request.getParameter("pno"));
		
			ReviewDAO dao = ReviewDAO.getInstance();
			dao.deleteReview(rbno);
			
			String url="Controller?command=review_board&pno="+pno+"&page=1";
			response.sendRedirect(url);
	}

}

