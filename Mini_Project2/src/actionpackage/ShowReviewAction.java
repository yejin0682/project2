package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.ReviewDAO;
import com.yg.dto.ReviewDTO;

public class ShowReviewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rbno = request.getParameter("rbno");
		ReviewDAO dao = ReviewDAO.getInstance();
		ReviewDTO dto = dao.showReview(rbno);
		String pno=request.getParameter("pno");
		
		if(dto.getFilename1()==null || dto.getFilename1().equals("null")) {
			dto.setFilename1("(첨부된 파일 없음)");
		}
		String getImg = dto.getFilename1();

		if(dto.getFilename2()==null || dto.getFilename2().equals("null")) {
			dto.setFilename2("(첨부된 파일 없음)");
		}
		String getImg2 = dto.getFilename2();
		
		HttpSession session = request.getSession();
		session.setAttribute("session_pno", dto.getPno());
		session.setAttribute("session_ref", dto.getRef());
		session.setAttribute("session_level", dto.getLevel());
		session.setAttribute("session_step", dto.getStep());
		session.setAttribute("session_obno", dto.getObno());
		
		request.setAttribute("pno", pno);
		request.setAttribute("dto", dto);
		request.setAttribute("getImg", getImg);
		request.setAttribute("getImg2", getImg2);
		request.setAttribute("rbno", rbno);
		request.setAttribute("id", dto.getID());
		String url="show_reviewDetail.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
