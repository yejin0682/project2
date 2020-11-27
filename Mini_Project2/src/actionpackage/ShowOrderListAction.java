package actionpackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.OrderDAO;
import com.yg.dto.OrderDTO;

public class ShowOrderListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderDAO odao =OrderDAO.getinstance();
		ArrayList<OrderDTO> list=new ArrayList<OrderDTO>();
		
		HttpSession session=request.getSession();
		String ID=(String) session.getAttribute("ID");
		list=odao.showorderlist(ID);
		
		request.setAttribute("mypageorderlist", list);
		String sql="MyPage_showorderlist.jsp";
		request.getRequestDispatcher(sql).forward(request, response);
	}

}
