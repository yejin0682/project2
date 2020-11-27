package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.QnABoardDAO;
import com.yg.dao.OrderDAO;

public class Admin_ShowSumSales implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date1=request.getParameter("date1");
		String date2=request.getParameter("date2");
		
		OrderDAO odao =OrderDAO.getinstance();
		
		int totalprice=0;
		
		totalprice=odao.showsumsales(date1, date2);
		
		request.setAttribute("total", totalprice);
		String url="dateorderresultPage.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
