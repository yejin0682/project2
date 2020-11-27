package actionpackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.ProductDAO;

public class Admin_InsertProduct implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pname=request.getParameter("product_name");
		String pcolor=request.getParameter("product_color");
		String psize=request.getParameter("product_size");
		int price=Integer.parseInt(request.getParameter("product_price"));
		String img=request.getParameter("product_image");
		String inform=request.getParameter("product_inform");
		String p_info=request.getParameter("product_info");
		String size_info=request.getParameter("size_info");
		String category=request.getParameter("category");
		
		ProductDAO pdao =ProductDAO.getinstance();
		pdao.admin_insertproduct(pname, pcolor, psize, price, img, inform, p_info, size_info,category);
		
		String url="Admin_insertProduct.jsp";
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		 
		out.println("<script>alert('상품이 등록되었습니다'); location.href='Admin_insertProduct.jsp';</script>");
		 
		out.flush();
		out.close();

	
		//alert창 안뜸
		
	}

}
