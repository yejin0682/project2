package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.OrderDAO;
import com.yg.dto.OrderDTO;

public class InsertOrderAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderDAO odao=OrderDAO.getinstance();

		HttpSession session=request.getSession();
		
		String ID=(String)session.getAttribute("ID");
		String bnoAll=request.getParameter("bno");
		String[] bno= bnoAll.split(",");
		
		for(int i=0;i<bno.length;i++) {
			int bnoo=Integer.parseInt(bno[i]);
			odao.insertorder(ID,bnoo);
		}
		
		OrderDTO odto=null;
		odto=odao.showordernum(ID);
		
		
		request.setAttribute("odto",odto);
		
		String url="payresultview.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}
