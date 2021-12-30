package jspProject_final.service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspProject_final.domain.board.BoardDAO;
import jspProject_final.service.Action;

public class Delete implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardKey = request.getParameter("boardKey");
		BoardDAO boardDAO = new BoardDAO();
		
		int result = boardDAO.delete(boardKey);
		if(result != 1) {
			response.sendRedirect("views/board/boardAlertForm.jsp?select=delete&alert=deleteFail");
		} else {
			response.sendRedirect("views/board/boardAlertForm.jsp?select=delete&alert=deleteSuccess");
		}
	}

}
