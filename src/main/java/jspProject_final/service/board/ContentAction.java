package jspProject_final.service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspProject_final.service.Action;

public class ContentAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardKey = request.getParameter("boardKey");
		response.sendRedirect("views/board/content.jsp?boardKey=" + boardKey);
		
	}

}
