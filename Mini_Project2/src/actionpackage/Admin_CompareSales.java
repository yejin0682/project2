package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.OrderDAO;

public class Admin_CompareSales implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date1=request.getParameter("date1");
		String date2=request.getParameter("date2");
		
		int total1=0;
		int total2=0;
		
		OrderDAO odao=OrderDAO.getinstance();
		
		total1=odao.selectDailySales(date1);
		total2=odao.selectDailySales(date2);
		
		int compareprice=0;
		double proportion=0;
		String bigdate="";
		
		compareprice=total2-total1;
		proportion=compareprice/(double)(total1)*100;
		proportion=Math.round(proportion*100)/100.0;

		
		request.setAttribute("total1", total1);
		request.setAttribute("total2", total2);
		request.setAttribute("compareprice", compareprice);
		request.setAttribute("propor", proportion);
		request.setAttribute("bigdate", bigdate);
		
		
		String url="Admin_compareResult.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
