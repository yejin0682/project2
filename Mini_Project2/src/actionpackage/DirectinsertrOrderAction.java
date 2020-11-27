package actionpackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.MemberDAO;
import com.yg.dao.OrderDAO;
import com.yg.dto.MemberDTO;
import com.yg.dto.OrderDTO;

public class DirectinsertrOrderAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String ID=(String) session.getAttribute("ID");
		
		OrderDAO odao=OrderDAO.getinstance();
		ArrayList<OrderDTO> list=new ArrayList<OrderDTO>();
		OrderDTO odto=null;
		
		MemberDTO mdto=null;
		MemberDAO mdao=MemberDAO.getinstance();
		mdto=mdao.memberinfoselect(ID);
		
		String basket=request.getParameter("basket");
		
		String[] basketlist=basket.split("___");
		int pno=0;
		String color="";
		String size="";
		int qty=0;
		
		for(int i=0;i<basketlist.length;i++) {
			String[] basketdetail=basketlist[i].split("_");
			
			pno=Integer.parseInt(basketdetail[0]);
			color=basketdetail[1];
			size=basketdetail[2];
			qty=Integer.parseInt(basketdetail[3]);
			
			odto=new OrderDTO();
			odto.setPno(pno);
			odto.setColor(color);
			odto.setSize(size);
			odto.setQty(qty);
			list.add(odto);
		}
		
		request.setAttribute("directlist", list);
		request.setAttribute("mdto", mdto);
		
		String url="DirectOrder.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}
