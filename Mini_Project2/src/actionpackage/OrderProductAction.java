package actionpackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.BasketDAO;
import com.yg.dao.MemberDAO;
import com.yg.dto.BasketDTO;
import com.yg.dto.MemberDTO;

public class OrderProductAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String ID=(String) session.getAttribute("ID");
		
		MemberDTO mdto=null;
		MemberDAO mdao=MemberDAO.getinstance();
		mdto=mdao.memberinfoselect(ID);
		
		String bnoAll=request.getParameter("bno");
		String[] bno= bnoAll.split(",");
		BasketDAO bdao=BasketDAO.getinstance();
		BasketDTO bdto =null;
		ArrayList<BasketDTO> list=new ArrayList<BasketDTO>();
		
		for(int i=0;i<bno.length;i++) {
			int bnoo=Integer.parseInt(bno[i]);
			bdto=bdao.showbasket(bnoo);
			list.add(bdto);			
		}
		
		request.setAttribute("basketorder", list);
		request.setAttribute("mdto", mdto);
		
		String url="ProductOrder.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
