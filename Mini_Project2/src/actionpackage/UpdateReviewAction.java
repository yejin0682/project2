package actionpackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.ReviewDAO;
import com.yg.dto.ReviewDTO;


public class UpdateReviewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String pno=request.getParameter("pno");
		request.setAttribute("pno", pno);
		System.out.println(pno);
		
		String rbno = request.getParameter("rbno");
		ReviewDAO dao = ReviewDAO.getInstance();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		if(request.getParameter("pageIs") == null) {
			String id = (String) session.getAttribute("ID");
			ReviewDTO dto = dao.showReview(rbno);
			if(id.equals(dto.getID())) {
				if(dto.getFilename1()==null || dto.getFilename1().equals("null")) {
					dto.setFilename1("(첨부된 파일 없음)");
				}
				String getImg = dto.getFilename1();
				
				if(dto.getFilename2()==null || dto.getFilename2().equals("null")) {
					dto.setFilename2("(첨부된 파일 없음)");
				}
				String getImg2 = dto.getFilename2();
				
				request.setAttribute("dto", dto);
				request.setAttribute("rbno", rbno);
				request.setAttribute("getImg", getImg);
				request.setAttribute("getImg2", getImg2);

				String url="update_review.jsp";
				request.getRequestDispatcher(url).forward(request, response);
			}else {
				out.println("<script>alert('권한이 없습니다.'); history.back();</script>");		
			}
		}   
		else if(request.getParameter("pageIs").equals("2")){
			String rtitle = request.getParameter("rtitle");
			String rcontent = request.getParameter("rcontent");
			String file = request.getParameter("file");
			dao.updateReview(rbno, rtitle, rcontent);
			
			response.sendRedirect("Controller?command=show_review&rbno="+rbno);
		}
		
	}
}	