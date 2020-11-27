package actionpackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.OrderDAO;
import com.yg.dto.OrderDTO;

public class Admin_ShowdateSalesAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date=request.getParameter("date");
		
		OrderDAO dao = OrderDAO.getinstance();
		ArrayList<OrderDTO> list = dao.selectOrderByDate(date);
		int dailySales = (dao.selectDailySales(date) / 1000);
		
		String ds = null;
		if(dailySales == 0) {
			ds = dailySales+"";
		}else {
			ds = dailySales+",000";
		}
		
		request.setAttribute("dailySales", ds);
		request.setAttribute("list", list);
		request.setAttribute("date", date);
		request.getRequestDispatcher("Admin_show_dailySales.jsp").forward(request, response);
		
		
	}

}
