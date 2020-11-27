package actionpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.BasketDAO;
import com.yg.dto.BasketDTO;

public class ShowBasketAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String ID=(String)session.getAttribute("ID");
		
		if(ID==null) {
			  response.setContentType("text/html;charset=utf-8");
			  PrintWriter out=response.getWriter(); 
			  out.println("<script>alert('로그인을 해주세요');history.go(-1);</script>"); 
			  out.flush(); 
			  out.close();
		}
		
		BasketDAO bdao=BasketDAO.getinstance();
		ArrayList<BasketDTO> list =new ArrayList<BasketDTO>();
		list=bdao.showbasket(ID);
		
		request.setAttribute("basketlist", list);
		
		String url="viewbasket.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
