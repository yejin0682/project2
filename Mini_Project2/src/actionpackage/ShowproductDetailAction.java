package actionpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.ProductDAO;
import com.yg.dto.ProductDTO;

public class ShowproductDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pno = request.getParameter("pno");
		
		ProductDAO pDao = ProductDAO.getinstance();
		ProductDTO dto = pDao.selectProductDetail(pno);
		
		String[] color = dto.getColor().split(",");
		String[] size = dto.getSize().split(",");
		String price = (dto.getPrice() / 1000) +",000";
		int point = (dto.getPrice() / 10000) *100;
		request.setAttribute("dto", dto);
		request.setAttribute("price", price);
		request.setAttribute("point", point);
		request.setAttribute("color", color);
		request.setAttribute("size", size);
		request.setAttribute("pno", pno);
		
		request.getRequestDispatcher("product_detail.jsp").forward(request, response);
		
	}

}
