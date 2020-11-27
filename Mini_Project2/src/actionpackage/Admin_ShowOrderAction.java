package actionpackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.OrderDAO;
import com.yg.dto.MemberDTO;
import com.yg.dto.OrderDTO;

public class Admin_ShowOrderAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderDAO odao =OrderDAO.getinstance();
		ArrayList<OrderDTO> list=new ArrayList<OrderDTO>();
		list=odao.showorder();
		
		request.setAttribute("orderlist", list);
		String sql="Admin_ShowOrderPage.jsp";
		request.getRequestDispatcher(sql).forward(request, response);
	}

}
