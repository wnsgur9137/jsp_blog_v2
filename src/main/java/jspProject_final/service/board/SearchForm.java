package jspProject_final.service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspProject_final.service.Action;

public class SearchForm implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
		String searchName = request.getParameter("searchName");
		
		System.out.println("searchType : " + searchType);
		System.out.println("searchName : " + searchName);
		response.sendRedirect("views/board/searchList.jsp?searchType=" + searchType + "&searchName=" + searchName);
		
	}

}
