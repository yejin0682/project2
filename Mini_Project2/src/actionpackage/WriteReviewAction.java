package actionpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yg.dao.ReviewDAO;
import com.yg.dto.ProductDTO;
import com.yg.dto.ReviewDTO;



public class WriteReviewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ReviewDAO rDao = ReviewDAO.getInstance();
		PrintWriter out = response.getWriter();

		ReviewDTO dto = null;
		
		
		// 파일이 업로드될 실제 tomcat 폴더의 경로 (WebContent 기준)
		String uploadPath=request.getRealPath("resources");
		
		// 업로드 될 파일의 최대 사이즈 (10메가)
		int size = 10*1024*1024;

		String rtitle = "";
		String rcontent = "";
		String ID = "";
		int pno = 0;
		int obno = 0;
		String filename1 = "";
		String filename2 = "";
		
		try{
			// 파일 업로드를 하기 위해서 cos.jar 추가 및 객체 생성
		    MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());
			
		  //파라미터를 받는 title, writer, content의 request를 multi로 대체. 
			rtitle = multi.getParameter("rtitle");
        	rcontent = multi.getParameter("rcontent");
            ID = (String) session.getAttribute("ID");
            pno = Integer.parseInt(multi.getParameter("pno"));
            obno = Integer.parseInt(multi.getParameter("obno"));
	
		    Enumeration files = multi.getFileNames();
		    String file1 = (String)files.nextElement();
		    filename1 = multi.getFilesystemName(file1);
		    String file2 = (String)files.nextElement();
		    filename2=multi.getFilesystemName(file2);

		    dto = new ReviewDTO(rtitle, rcontent, ID, pno, obno, filename2, filename1);
            
		}catch(Exception e){
		    e.printStackTrace();
		}
		
        rDao.insertReviewBoard(dto,obno);
		out.println("<script>alert('후기가 등록되었습니다.'); location.href='Controller?command=review_board';</script>");	
		response.sendRedirect("Controller?command=review_board&pno="+pno+"&page=1");
	}

}
