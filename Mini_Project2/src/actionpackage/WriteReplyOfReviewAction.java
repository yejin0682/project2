package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.ReviewDAO;
import com.yg.dto.ReviewDTO;

public class WriteReplyOfReviewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ReviewDAO rDao = ReviewDAO.getInstance();
		String ID=(String) session.getAttribute("ID");
		
		int pno=0;
		
		if(request.getParameter("content") == null) {	
			response.sendRedirect("write_reply.jsp");
		}else {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			int ref = (int) session.getAttribute("session_ref");
			int level = (int) session.getAttribute("session_level");
			int step = (int) session.getAttribute("session_step");
			pno = (int) session.getAttribute("session_pno");
			int obno = (int) session.getAttribute("session_obno");
			
			ReviewDTO dto = new ReviewDTO(title, content, ID, pno, ref, level, step, obno);
			rDao.insertReply(dto);
			
			session.removeAttribute("session_ref");
			session.removeAttribute("session_level");
			session.removeAttribute("session_step");
			session.removeAttribute("session_pno");
			
			response.sendRedirect("Controller?command=review_board&pno="+pno+"&page=1");
		}
		
	}

}
