package actionpackage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yg.dao.QnABoardDAO;
import com.yg.dto.BoardDTO;

public class SearchBoardAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search_key=request.getParameter("search-key");
		String search=request.getParameter("search");
		int page=Integer.parseInt(request.getParameter("page"));
		
		QnABoardDAO dao=QnABoardDAO.getinstance();
		ArrayList<BoardDTO> list =new ArrayList<BoardDTO>();
		int count=-1;
		
		if(search_key.equals("subject")) {
			count=dao.countsearch_subject(search);
			list=dao.searchboard_subject(search, page);
		} else if(search_key.equals("content")){
			count=dao.countsearch_content(search);
			list=dao.searchboard_content(search, page);
		} else {
			count=dao.countsearch_writer(search);
			list=dao.searchboard_writer(search, page);
		}
		
		request.setAttribute("search", search);
		request.setAttribute("search_key", search_key);
		request.setAttribute("countsearch", count);
		request.setAttribute("searchlist", list);
		String url="searchresultpage.jsp?page="+page;
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
