package actionpackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.OrderDAO;
import com.yg.dto.OrderDTO;

public class DirectinsertrPayAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String ID=(String) session.getAttribute("ID");
		
		ArrayList<OrderDTO> list =null; 
		list=(ArrayList<OrderDTO>) session.getAttribute("list");
		OrderDAO odao=OrderDAO.getinstance();
		
		for(OrderDTO odto:list) {
			
			int pno=odto.getPno();
			System.out.println(pno);
			String color=odto.getColor();
			String size=odto.getSize();
			int qty=odto.getQty();
			
			odao.directinsert(pno,color,size,qty,ID);
		}
		
		OrderDTO odto=null;
		odto=odao.showordernum(ID);
		
		request.setAttribute("odto",odto);
		
		session.removeAttribute("list");
		
		String url="payresultview.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}
