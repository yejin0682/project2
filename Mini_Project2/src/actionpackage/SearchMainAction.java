package actionpackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yg.dao.ProductDAO;
import com.yg.dto.ProductDTO;

public class SearchMainAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value=request.getParameter("search_main");
		
		ProductDAO pdao=ProductDAO.getinstance();
		
		ArrayList<ProductDTO> list =new ArrayList<ProductDTO>();
		list=pdao.searchvalue(value);
		
		HttpSession session=request.getSession();
		session.setAttribute("searchlist", list);
		
		String url="SearchProductResultPage.jsp";
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
