package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.ReviewDAO;
import com.yg.dto.ProductDTO;

public class GotoWriteReviewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String ID=(String) session.getAttribute("ID");
		ReviewDAO rDao = ReviewDAO.getInstance();

		int obno = Integer.parseInt(request.getParameter("obno"));
		int pno=Integer.parseInt(request.getParameter("pno"));
		ProductDTO dto = rDao.bringProduct(obno);
		
		session.setAttribute("ID", ID);	
		request.setAttribute("dto", dto);
		request.setAttribute("pno", pno);		//수정해야.
		request.setAttribute("obno", obno);	//수정해야.
		
		String url = "write_review.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
