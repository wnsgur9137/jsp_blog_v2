package jspProject_final.service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspProject_final.service.Action;
import jspProject_final.domain.board.BoardDAO;

public class UpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardKey = request.getParameter("boardKey");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		BoardDAO boardDAO = new BoardDAO();
		int result = boardDAO.update(boardKey, boardTitle, boardContent);
		if(result != 1) {
			response.sendRedirect("views/board/boardAlertForm.jsp?select=update&alert=updateFail");
		} else {
			response.sendRedirect("views/board/boardAlertForm.jsp?select=update&alert=updateSuccess");
		}
		
	}

}
