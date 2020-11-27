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

import java.net.URLDecoder;


public class InsertBasket implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =request.getSession();
		String basket=request.getParameter("basket");
		
		BasketDAO bdao= BasketDAO.getinstance();
		
		String ID=(String)session.getAttribute("ID");
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
			bdao.basketAdd(ID, pno, qty, color, size);
				
		}
		
		String url="Controller?command=detail&pno="+pno;
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter(); 
		out.println("<script>alert('장바구니에 품목이 담겼습니다');history.go(-1);</script>"); 
		out.flush(); 
		out.close();
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
